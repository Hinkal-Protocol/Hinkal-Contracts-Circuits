// SPDX-License-Identifier: GPL-3.0
/*
    Copyright 2021 0KIMS association.

    This file is generated with [snarkJS](https://github.com/iden3/snarkjs).

    snarkJS is a free software: you can redistribute it and/or modify it
    under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    snarkJS is distributed in the hope that it will be useful, but WITHOUT
    ANY WARRANTY; without even the implied warranty of MERCHANTABILITY
    or FITNESS FOR A PARTICULAR PURPOSE. See the GNU General Public
    License for more details.

    You should have received a copy of the GNU General Public License
    along with snarkJS. If not, see <https://www.gnu.org/licenses/>.
*/

pragma solidity >=0.7.0 <0.9.0;

contract mainEVMCircuit1x2x1v4 {
    // Scalar field size
    uint256 constant r    = 21888242871839275222246405745257275088548364400416034343698204186575808495617;
    // Base field size
    uint256 constant q   = 21888242871839275222246405745257275088696311157297823662689037894645226208583;

    // Verification Key data
    uint256 constant alphax  = 20491192805390485299153009773594534940189261866228447918068658471970481763042;
    uint256 constant alphay  = 9383485363053290200918347156157836566562967994039712273449902621266178545958;
    uint256 constant betax1  = 4252822878758300859123897981450591353533073413197771768651442665752259397132;
    uint256 constant betax2  = 6375614351688725206403948262868962793625744043794305715222011528459656738731;
    uint256 constant betay1  = 21847035105528745403288232691147584728191162732299865338377159692350059136679;
    uint256 constant betay2  = 10505242626370262277552901082094356697409835680220590971873171140371331206856;
    uint256 constant gammax1 = 11559732032986387107991004021392285783925812861821192530917403151452391805634;
    uint256 constant gammax2 = 10857046999023057135944570762232829481370756359578518086990519993285655852781;
    uint256 constant gammay1 = 4082367875863433681332203403145435568316851327593401208105741076214120093531;
    uint256 constant gammay2 = 8495653923123431417604973247489272438418190587263600148770280649306958101930;
    uint256 constant deltax1 = 11142768916944504186428096981201155207686834752289238925197054476964551214976;
    uint256 constant deltax2 = 15781743129177288673487449903631341746096084082662452625558445864226380303249;
    uint256 constant deltay1 = 12821297137489988066043757432330257662577505592034670200932752062422670315884;
    uint256 constant deltay2 = 7755349115366838556214017660417373088739916170592819280369688920631886158326;

    
    uint256 constant IC0x = 3089133855668315279942779715597054601213489880020793300126483607381711996933;
    uint256 constant IC0y = 15427166417908874019146259798928644937103377633097718843734137655469452085470;
    
    uint256 constant IC1x = 4931950653601312942799437223471062126500342742380290833158739412937701998602;
    uint256 constant IC1y = 13228926277079275403477080153051162382053672261920068647276899307573363651681;
    
    uint256 constant IC2x = 1365584407008616818278946410710081461117559488849043323012950551882378788509;
    uint256 constant IC2y = 18997424553848236973699319545299647648748745528500266439554142729223896297693;
    
    uint256 constant IC3x = 1281821782316222487567060274856740804590653476241378296821428649364117527454;
    uint256 constant IC3y = 5580450271433256144158610079239874836240436031750359116918207794578454900324;
    
    uint256 constant IC4x = 6999040033051496488944579548399861173295958101756440634611182405950417156413;
    uint256 constant IC4y = 7643138078360312439401225263480998163824581643545313589405856658965272744243;
    
    uint256 constant IC5x = 1443367014006467196231982962987405515298815261903923333499075488827136302733;
    uint256 constant IC5y = 20853546329285785598413888746340617452880918346419063768623072568560604830620;
    
    uint256 constant IC6x = 4122969418577764260086902237541691877358611549776545719913989022446389098763;
    uint256 constant IC6y = 11532429433496518963496628492589069024265301538097788462228884058667782800431;
    
    uint256 constant IC7x = 21070341872084291967240488973774611906850667465625184045454731335168953114397;
    uint256 constant IC7y = 13722131835162392796387888583042849054509333243924529529928602463999763015580;
    
    uint256 constant IC8x = 2882869981856323138425896708422028833633682221162586353003926861639426923982;
    uint256 constant IC8y = 17273684666199304511229335121723977266172439042457072908297032399664547883347;
    
    uint256 constant IC9x = 9779295745613264221177194557417476347440416686698846466544465187099092273756;
    uint256 constant IC9y = 21252417211186146756289102130545989523257608615732497016618602783663572809341;
    
    uint256 constant IC10x = 14008565951302589004165978558721281318480614022905778834312474107974793565019;
    uint256 constant IC10y = 4697727901692058825937582763034653506320197268269124773318377917743872674131;
    
    uint256 constant IC11x = 10259406093162933163992641796953826305187481751636301390254439214702531480342;
    uint256 constant IC11y = 19349125497727895185680111027407492206319280275678806829818884121034208824596;
    
    uint256 constant IC12x = 7833428819341539854041141738428279274666508862869038619000665389370614276545;
    uint256 constant IC12y = 13074278328585432140795009130989049336811871799110005125520634942914672190325;
    
    uint256 constant IC13x = 4273920281915956675597885229410087142735023643254886196302373911329439585626;
    uint256 constant IC13y = 1028643847610611378164865634975773555758974720849194960990964740967521636743;
    
    uint256 constant IC14x = 10261540104111107520550414044683366626791844256579831489534557627342174364866;
    uint256 constant IC14y = 7635847849602269479075582021875453288917031295565404331931740967793945088411;
    
    uint256 constant IC15x = 19361608471652684397544964029393504835667531037572557032576359846883381790336;
    uint256 constant IC15y = 1715833354966004802042798833823039898506464082871187838251647979086074573206;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[15] calldata _pubSignals) public view returns (bool) {
        assembly {
            function checkField(v) {
                if iszero(lt(v, r)) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }
            
            // G1 function to multiply a G1 value(x,y) to value in an address
            function g1_mulAccC(pR, x, y, s) {
                let success
                let mIn := mload(0x40)
                mstore(mIn, x)
                mstore(add(mIn, 32), y)
                mstore(add(mIn, 64), s)

                success := staticcall(sub(gas(), 2000), 7, mIn, 96, mIn, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }

                mstore(add(mIn, 64), mload(pR))
                mstore(add(mIn, 96), mload(add(pR, 32)))

                success := staticcall(sub(gas(), 2000), 6, mIn, 128, pR, 64)

                if iszero(success) {
                    mstore(0, 0)
                    return(0, 0x20)
                }
            }

            function checkPairing(pA, pB, pC, pubSignals, pMem) -> isOk {
                let _pPairing := add(pMem, pPairing)
                let _pVk := add(pMem, pVk)

                mstore(_pVk, IC0x)
                mstore(add(_pVk, 32), IC0y)

                // Compute the linear combination vk_x
                
                g1_mulAccC(_pVk, IC1x, IC1y, calldataload(add(pubSignals, 0)))
                
                g1_mulAccC(_pVk, IC2x, IC2y, calldataload(add(pubSignals, 32)))
                
                g1_mulAccC(_pVk, IC3x, IC3y, calldataload(add(pubSignals, 64)))
                
                g1_mulAccC(_pVk, IC4x, IC4y, calldataload(add(pubSignals, 96)))
                
                g1_mulAccC(_pVk, IC5x, IC5y, calldataload(add(pubSignals, 128)))
                
                g1_mulAccC(_pVk, IC6x, IC6y, calldataload(add(pubSignals, 160)))
                
                g1_mulAccC(_pVk, IC7x, IC7y, calldataload(add(pubSignals, 192)))
                
                g1_mulAccC(_pVk, IC8x, IC8y, calldataload(add(pubSignals, 224)))
                
                g1_mulAccC(_pVk, IC9x, IC9y, calldataload(add(pubSignals, 256)))
                
                g1_mulAccC(_pVk, IC10x, IC10y, calldataload(add(pubSignals, 288)))
                
                g1_mulAccC(_pVk, IC11x, IC11y, calldataload(add(pubSignals, 320)))
                
                g1_mulAccC(_pVk, IC12x, IC12y, calldataload(add(pubSignals, 352)))
                
                g1_mulAccC(_pVk, IC13x, IC13y, calldataload(add(pubSignals, 384)))
                
                g1_mulAccC(_pVk, IC14x, IC14y, calldataload(add(pubSignals, 416)))
                
                g1_mulAccC(_pVk, IC15x, IC15y, calldataload(add(pubSignals, 448)))
                

                // -A
                mstore(_pPairing, calldataload(pA))
                mstore(add(_pPairing, 32), mod(sub(q, calldataload(add(pA, 32))), q))

                // B
                mstore(add(_pPairing, 64), calldataload(pB))
                mstore(add(_pPairing, 96), calldataload(add(pB, 32)))
                mstore(add(_pPairing, 128), calldataload(add(pB, 64)))
                mstore(add(_pPairing, 160), calldataload(add(pB, 96)))

                // alpha1
                mstore(add(_pPairing, 192), alphax)
                mstore(add(_pPairing, 224), alphay)

                // beta2
                mstore(add(_pPairing, 256), betax1)
                mstore(add(_pPairing, 288), betax2)
                mstore(add(_pPairing, 320), betay1)
                mstore(add(_pPairing, 352), betay2)

                // vk_x
                mstore(add(_pPairing, 384), mload(add(pMem, pVk)))
                mstore(add(_pPairing, 416), mload(add(pMem, add(pVk, 32))))


                // gamma2
                mstore(add(_pPairing, 448), gammax1)
                mstore(add(_pPairing, 480), gammax2)
                mstore(add(_pPairing, 512), gammay1)
                mstore(add(_pPairing, 544), gammay2)

                // C
                mstore(add(_pPairing, 576), calldataload(pC))
                mstore(add(_pPairing, 608), calldataload(add(pC, 32)))

                // delta2
                mstore(add(_pPairing, 640), deltax1)
                mstore(add(_pPairing, 672), deltax2)
                mstore(add(_pPairing, 704), deltay1)
                mstore(add(_pPairing, 736), deltay2)


                let success := staticcall(sub(gas(), 2000), 8, _pPairing, 768, _pPairing, 0x20)

                isOk := and(success, mload(_pPairing))
            }

            let pMem := mload(0x40)
            mstore(0x40, add(pMem, pLastMem))

            // Validate that all evaluations ∈ F
            
            checkField(calldataload(add(_pubSignals, 0)))
            
            checkField(calldataload(add(_pubSignals, 32)))
            
            checkField(calldataload(add(_pubSignals, 64)))
            
            checkField(calldataload(add(_pubSignals, 96)))
            
            checkField(calldataload(add(_pubSignals, 128)))
            
            checkField(calldataload(add(_pubSignals, 160)))
            
            checkField(calldataload(add(_pubSignals, 192)))
            
            checkField(calldataload(add(_pubSignals, 224)))
            
            checkField(calldataload(add(_pubSignals, 256)))
            
            checkField(calldataload(add(_pubSignals, 288)))
            
            checkField(calldataload(add(_pubSignals, 320)))
            
            checkField(calldataload(add(_pubSignals, 352)))
            
            checkField(calldataload(add(_pubSignals, 384)))
            
            checkField(calldataload(add(_pubSignals, 416)))
            
            checkField(calldataload(add(_pubSignals, 448)))
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
