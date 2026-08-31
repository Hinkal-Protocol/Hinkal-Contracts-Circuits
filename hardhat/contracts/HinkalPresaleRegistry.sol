// SPDX-License-Identifier: BUSL-1.1
pragma solidity ^0.8.17;

import "@openzeppelin/contracts/security/ReentrancyGuard.sol";
import "@openzeppelin/contracts/utils/math/Math.sol";
import "@openzeppelin/contracts/interfaces/IERC20Metadata.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "./Transferer.sol";

struct PresaleStage {
    uint256 amountToRaise;
    uint256 priceMultiplier;
}

contract HinkalPresaleRegistry is Transferer, Ownable, ReentrancyGuard {
    // Constants
    uint256 public constant DENOMINATOR = 10 ** 18;

    // State variables
    PresaleStage[] public stages; 
    uint8 public currentPresaleStageIndex;
    uint256 public currentMaxDepositAmount;
    address[] public tokens;
    uint256 public totalDeposit;
    address public immutable ADMIN;
    
    
    // Mappings
    mapping(address => mapping(address => uint256)) public deposits; // depositor -> token -> amount
    mapping(address => uint256) public totalHINK;

    // Error definitions
    error PresaleFinished();
    error TokenNotInWhitelist();
    error MinHINKNotSatisfied();
    error RaisedAmountMustIncrease();
    error AmountExceedsRoundRequirement();
    error NotAdmin();
    // Events
    event Deposit(address indexed depositor, address indexed token, uint256 amountDeposit, uint256 amountHINK, uint256 totalDeposit, uint256 blockNumber, uint256 timeStamp);
    event Withdraw(address indexed withdrawer, address indexed token, uint256 amount);
    event StageAdvanced(uint256 indexed newStageIndex);

    // Modifiers
    modifier notFinished() {
        if (currentPresaleStageIndex == stages.length) revert PresaleFinished();
        _;
    }

    modifier onlyAdmin() {
        if (msg.sender != ADMIN) revert NotAdmin();
        _;
    }

    // Constructor
    constructor(PresaleStage[] memory _stages, address[] memory _tokens, address _admin, address _owner) {
        for (uint256 i = 0; i < _stages.length; i++)
            stages.push(_stages[i]);

        tokens = _tokens;
        
        currentPresaleStageIndex = 0;
        currentMaxDepositAmount = stages[currentPresaleStageIndex].amountToRaise;
        totalDeposit = 0;
        ADMIN = _admin;
        _transferOwnership(_owner);
    }

    // View functions
    function currentPresaleStage() public view notFinished returns (PresaleStage memory) {
        return stages[currentPresaleStageIndex];
    }

    function calculateHINK(uint256 amount) public view returns (uint256 amountHINK) {
        _checkIfMoreThanRoundRequirement(amount);
        PresaleStage memory currentStage = currentPresaleStage();
        amountHINK = Math.mulDiv(amount, DENOMINATOR, currentStage.priceMultiplier);
    }

    // Internal functions
    function getDecimals(address tokenAddress) internal view returns (uint8) {
        try IERC20Metadata(tokenAddress).decimals() returns (uint8 decimals) {
            return decimals;
        } catch {
            return 18;  // Default fallback decimals (ERC20 standard default)
        }
    }

    function _checkTokenInWhitelist(address token) internal view {
        for (uint256 i = 0; i < tokens.length; i++) {
            if (tokens[i] == token) return;
        }
        revert TokenNotInWhitelist();
    }

    function _checkIfMoreThanRoundRequirement(uint256 amount) internal view {
        if (amount > currentMaxDepositAmount) revert AmountExceedsRoundRequirement();
    }

    // Public/External functions
    function deposit(address token, uint256 amount, uint256 minHINK) nonReentrant notFinished public {
        _checkTokenInWhitelist(token);

        uint8 tokenDecimals = getDecimals(token);
        uint256 normalizedAmount = Math.mulDiv(amount, DENOMINATOR, 10 ** tokenDecimals);

        _checkIfMoreThanRoundRequirement(normalizedAmount);

        transferERC20TokenFromOrCheckETH(token, msg.sender, address(this), amount);
        uint256 amountHINK = calculateHINK(normalizedAmount);
        if (minHINK > amountHINK) revert MinHINKNotSatisfied();
    
        totalDeposit += normalizedAmount;

        deposits[msg.sender][token] += normalizedAmount;
        totalHINK[msg.sender] += amountHINK;
        currentMaxDepositAmount -= normalizedAmount;

        emit Deposit(msg.sender, token, normalizedAmount, amountHINK, totalDeposit, block.number, block.timestamp);
    }

    // Owner functions
    function withdraw(address token, uint256 amount) onlyAdmin public nonReentrant {
        transferERC20TokenOrETH(token, ADMIN, amount);

        emit Withdraw(ADMIN, token, amount);
    }

    function moveToNextStage() onlyOwner notFinished public {
        currentPresaleStageIndex += 1;
        if (currentPresaleStageIndex < stages.length) {
            currentMaxDepositAmount = stages[currentPresaleStageIndex].amountToRaise;
        }
        
        emit StageAdvanced(currentPresaleStageIndex);
    }
}
