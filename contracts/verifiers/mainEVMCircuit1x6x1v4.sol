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

contract mainEVMCircuit1x6x1v4 {
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
    uint256 constant deltax1 = 20870496095655532446750253539575618632317295822340425220882272156593226238817;
    uint256 constant deltax2 = 7555877027859490157547552306603146517832052009956031960969180218517756013843;
    uint256 constant deltay1 = 6532079741547891901042728440359402785412373807400429368344357200458200442426;
    uint256 constant deltay2 = 10067172053959858560610607679154010817215171410225939523575681130458847525828;

    
    uint256 constant IC0x = 4395019373028719278668381779724399493004420426382328974926066561542852071254;
    uint256 constant IC0y = 3150574308830396847222714635343828352685728106384959775033794942384952491955;
    
    uint256 constant IC1x = 6036913926639503077628008554622412433163809221726490155601099504733121707141;
    uint256 constant IC1y = 4641294334783280848153115855840987845983120027083214456775441723116991839317;
    
    uint256 constant IC2x = 18465602335690848029730181739311549408137665282773573571261323804165428584589;
    uint256 constant IC2y = 3814126496703583182244229530564270182578893554619867303230821021064056087683;
    
    uint256 constant IC3x = 909251241019931220549297828527160707685794419764869344296607204084452334705;
    uint256 constant IC3y = 18672554303405413348234467221359168681739909144148344988942031617846901779624;
    
    uint256 constant IC4x = 5304752898309987697932062424770000212141127009127851514598931975135419919877;
    uint256 constant IC4y = 7612582680986836076611895433736071184567135666107427269323581028728378496575;
    
    uint256 constant IC5x = 13365590743493780983358734031383110427956842377121812967353092175542831234173;
    uint256 constant IC5y = 3678012651443517961328695930866963745635937184529069599855176047809809818780;
    
    uint256 constant IC6x = 6219533782877712300590943272349022771079405452905947180738966948930863238543;
    uint256 constant IC6y = 5836215683212453981514857851703587998176181547677590065227758279222662679631;
    
    uint256 constant IC7x = 4629957114000809715034962960175475102119522905011238928967623303744623260401;
    uint256 constant IC7y = 8019608386707961677017750709708649077419387240380663329696704565784539908205;
    
    uint256 constant IC8x = 13759440529329847753671919689778718093114531916551123537798649949104769661833;
    uint256 constant IC8y = 21548446316234249578246613643568038097073629958825802126453922569712138454443;
    
    uint256 constant IC9x = 11374735775232779994169582266019557777011215130876823679711787006172755618276;
    uint256 constant IC9y = 12923871918932140839376873791271966508585998629981455702100149233346927789286;
    
    uint256 constant IC10x = 14584435319520781374316593088009341425123251226682245618308975732767624083449;
    uint256 constant IC10y = 3643437924906211239382585718715256261947723258116916217402700557804069443201;
    
    uint256 constant IC11x = 2695565615645926427151706949525495028756773767528878818626501232667403483419;
    uint256 constant IC11y = 11244143124404893869582298416184365525926945395852401305485230500761071690200;
    
    uint256 constant IC12x = 293915563081623146967837941328300383229918619938707349780424416518260533881;
    uint256 constant IC12y = 9326749333284227966208996670530336910544469365737179386316414869427969679135;
    
    uint256 constant IC13x = 5799597511410483855142952770401027293423283312226060555620666885267026705059;
    uint256 constant IC13y = 12435665277798197413135636935428286374764557710864421340114841237542342739831;
    
    uint256 constant IC14x = 7964314877732243672256447591512317421550205044125681696189741267743448317510;
    uint256 constant IC14y = 12857830844038333969337985063914225245381769059259030012035891461182490974889;
    
    uint256 constant IC15x = 9061760349069060382335708860477189843414906104818389432048786912565372914841;
    uint256 constant IC15y = 19939767948909708396088104684156343420544673546290171365379504876359022896821;
    
    uint256 constant IC16x = 9823631110655730804310478221888531168674390145108451749798534571058620243448;
    uint256 constant IC16y = 4222997531701975802767158730602375322585586486356206001954340003510581883966;
    
    uint256 constant IC17x = 13407004270272548702407966842451378444065226501961523156326754918516367105605;
    uint256 constant IC17y = 12647486271830011850310059694964822702519890429502685830879824623961217116097;
    
    uint256 constant IC18x = 10308042012405785947940275933653171245280819184424505061611124365897728023120;
    uint256 constant IC18y = 13202340034416032488121120027463920312427189355357928540373543366857747187023;
    
    uint256 constant IC19x = 15860638705462557192904126977294639434748213483573197382213837013153962867879;
    uint256 constant IC19y = 3291854593394922350224523377934208030648232976186725534576928716470192943033;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[19] calldata _pubSignals) public view returns (bool) {
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
                
                g1_mulAccC(_pVk, IC16x, IC16y, calldataload(add(pubSignals, 480)))
                
                g1_mulAccC(_pVk, IC17x, IC17y, calldataload(add(pubSignals, 512)))
                
                g1_mulAccC(_pVk, IC18x, IC18y, calldataload(add(pubSignals, 544)))
                
                g1_mulAccC(_pVk, IC19x, IC19y, calldataload(add(pubSignals, 576)))
                

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
            
            checkField(calldataload(add(_pubSignals, 480)))
            
            checkField(calldataload(add(_pubSignals, 512)))
            
            checkField(calldataload(add(_pubSignals, 544)))
            
            checkField(calldataload(add(_pubSignals, 576)))
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
