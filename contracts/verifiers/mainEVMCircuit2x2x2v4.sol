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

contract mainEVMCircuit2x2x2v4 {
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
    uint256 constant deltax1 = 5179660265343022442795265901391218496455775587120388732927210253594427179878;
    uint256 constant deltax2 = 14639067963024887383777297502799445665328454842503873939031016940357684709445;
    uint256 constant deltay1 = 7183702531203169056865338041364005625084092302842467107324786163548673116048;
    uint256 constant deltay2 = 19659535570638102393230103056722870313877431011572964531298370113090275849110;

    
    uint256 constant IC0x = 9764405517245926479815155511992922272850477123536172708177753748997247418696;
    uint256 constant IC0y = 555318613894530601530779107556497866113616518314900119227269930215048344639;
    
    uint256 constant IC1x = 4252441911111114976249141617126466413596571798237899877630154501967329684998;
    uint256 constant IC1y = 14081704720977440467685337154501633242011132089417629483174119484369562731622;
    
    uint256 constant IC2x = 18203942710916091819013249184492940873964188744339715423644267720603293369467;
    uint256 constant IC2y = 21718720222280710222360221901332855075578855593052977088590316630909411419514;
    
    uint256 constant IC3x = 15225485316668547214648063018862586199654762893442544256049441956255079773187;
    uint256 constant IC3y = 15675544749211829635967318459362691414491052205474208700430452408182078507875;
    
    uint256 constant IC4x = 5797079763312232782832307815211486246344118360285945128219329778245188518756;
    uint256 constant IC4y = 7329171535746572005377521216838212486924144061094274948793004794851918583406;
    
    uint256 constant IC5x = 17298325118250128830578301224322011063248567856708926013144596962905733183849;
    uint256 constant IC5y = 15254440984071479754630928094028232059389430803545699905737937491890429380626;
    
    uint256 constant IC6x = 15454323106180183627526831819796113283603913946011433842649907448471231735654;
    uint256 constant IC6y = 5726817806084031922740236911638960902548864067811303071268241067894406492888;
    
    uint256 constant IC7x = 13238544467074150898202426527916375699430632414438430960993938421287308385429;
    uint256 constant IC7y = 6583182645668486909272354448573492550931514981013838883772808062858940534507;
    
    uint256 constant IC8x = 13126025962956476012695501780870071432151032307684199977385851151049188556011;
    uint256 constant IC8y = 6282859413830712224596213090444701986564703606611177327958992112946915251948;
    
    uint256 constant IC9x = 21211002179219611686292086269196106059513633407812204642563838770140164585307;
    uint256 constant IC9y = 6668175859658333113017654213439765663192474161303145504075060017994341676806;
    
    uint256 constant IC10x = 19581564478264445629937219703718760244561865076501971536239422730594498802069;
    uint256 constant IC10y = 20148926684314102232832123265746206868653886232332706868569596545411535818007;
    
    uint256 constant IC11x = 15854902667965630462964651115040790956017287386068186366170536678539862671038;
    uint256 constant IC11y = 2002783294434353205969814389605775745123496146701187205236002004185516291042;
    
    uint256 constant IC12x = 17865439614829856403041814143577164058658893011662739949241555991432227422786;
    uint256 constant IC12y = 21811988631310837828375356337193931441414167341835237643201570971965482014357;
    
    uint256 constant IC13x = 20688347154618028306454645494426646666594095602645786242865040408910975264727;
    uint256 constant IC13y = 8958787983518014061778790532834400016867175955720163795488712491931101669876;
    
    uint256 constant IC14x = 19481974145176624414531688642996057433116428058636618281677134517171987439019;
    uint256 constant IC14y = 2892891934301265556996376964336624966845925919331166862551132176221478436449;
    
    uint256 constant IC15x = 21398953851693821764439816580458657633814127875713739041246465155402508685891;
    uint256 constant IC15y = 20389994868613349798425636856197994256142391117420693989758735821339731919186;
    
    uint256 constant IC16x = 18102074499413568210044189201379507288435680977303438090414005083940212944734;
    uint256 constant IC16y = 15472822580358494205576179041845151080208164438703595446137727318085021645799;
    
    uint256 constant IC17x = 7799577964425768836319719368444209224013991350158691263516496321959436014112;
    uint256 constant IC17y = 20582290666026423089145040649813996814423162498302142334627111858755244886023;
    
    uint256 constant IC18x = 14581590396071710671845644214935712968150801231931931172105031326430870632366;
    uint256 constant IC18y = 11345301494456754256067189818054873526116025337846803675376423597190359382528;
    
    uint256 constant IC19x = 11354422967283899352918110947450774474649320740478051130106525378999098614109;
    uint256 constant IC19y = 5320861361628488295883468111018310338391933967270353430583530748501771499655;
    
    uint256 constant IC20x = 5227457689825988570852719500946078519562885402541008143456690259827325652959;
    uint256 constant IC20y = 8315010864221483733516248529915367655799753163736140742379893922837863592722;
    
    uint256 constant IC21x = 3756871092665387549499177309355649112466974377010101258224463015854785753734;
    uint256 constant IC21y = 4299633464455894790938619336671460233629586633384988156758726119652697993370;
    
    uint256 constant IC22x = 10057649982220268687734998144791149972992119852855485625650356884965054905838;
    uint256 constant IC22y = 16010998539210133286591640180432869612783006027748305105502071599206548883844;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[22] calldata _pubSignals) public view returns (bool) {
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
                
                g1_mulAccC(_pVk, IC20x, IC20y, calldataload(add(pubSignals, 608)))
                
                g1_mulAccC(_pVk, IC21x, IC21y, calldataload(add(pubSignals, 640)))
                
                g1_mulAccC(_pVk, IC22x, IC22y, calldataload(add(pubSignals, 672)))
                

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
            
            checkField(calldataload(add(_pubSignals, 608)))
            
            checkField(calldataload(add(_pubSignals, 640)))
            
            checkField(calldataload(add(_pubSignals, 672)))
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
