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

contract mainEVMCircuit1x2x2v4 {
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
    uint256 constant deltax1 = 13298246900727613518172183754936258271548795356820558549157934899019627792518;
    uint256 constant deltax2 = 11423253604367936764850022264612049845295045288279493847394749756856683203376;
    uint256 constant deltay1 = 7217824640053942402509801826969853278907063288850004783890935183232824684783;
    uint256 constant deltay2 = 20326994716138876079386411002736212170310635205083337481640222486260670515959;

    
    uint256 constant IC0x = 7035419827458627408334151800096066438564676900339207971295144024443409479931;
    uint256 constant IC0y = 12852824914597157617321311461340383930648461559781615306936190389996229148907;
    
    uint256 constant IC1x = 651186598526177401997740322729450361793158704804212797943797981572290238106;
    uint256 constant IC1y = 1511914399497697627942852723054866235535768483167178883847674132238587551669;
    
    uint256 constant IC2x = 12668655913225715126136791516618483468942504758602561544581813974489055966507;
    uint256 constant IC2y = 6710161199967791924888735114054019696155859298810590023548547129569500722750;
    
    uint256 constant IC3x = 13461971760345827437824822520448043295605915179912521108615677091829860658182;
    uint256 constant IC3y = 12047266840383377047705531062255235057398844565852432887633318155824277442741;
    
    uint256 constant IC4x = 3345417660452295479425717341622394512267621566183136765885585719930257411178;
    uint256 constant IC4y = 14303396128170570494106206357106422479018801648965109369479755918231694805238;
    
    uint256 constant IC5x = 19982113044729013532980674692292784407503365769963498771098725025509699264366;
    uint256 constant IC5y = 5402200685500569791821608777756894791093162776487017368810910916554445532130;
    
    uint256 constant IC6x = 13374561962394494919877644679822898152619316339953391557942267946916848084259;
    uint256 constant IC6y = 14359658609081077567598850947875074189066963839808515868312312543323728196458;
    
    uint256 constant IC7x = 14735783915302276365397728183170573358157293885531909021797141342772255337146;
    uint256 constant IC7y = 1649283246541875414467115357461242465193211762923436974790122046483062540112;
    
    uint256 constant IC8x = 14667661406492671712002387143598862904642783585285309833105946768204199828702;
    uint256 constant IC8y = 20419921684819518571033270271810957573864495514254750636649142433891911753110;
    
    uint256 constant IC9x = 21534495762632449869961460704845125165474919751437191783924586295994501413304;
    uint256 constant IC9y = 7914317902038505649635968934558259120349111748483275806042354032747667218948;
    
    uint256 constant IC10x = 20882940796241277040598526160116179904960734166124627228260100895833673092821;
    uint256 constant IC10y = 4240997962149532250688521718472659832951156545900959828003844946227201206211;
    
    uint256 constant IC11x = 9935277268250014544792555169524699713845396070003851955723033352453595437266;
    uint256 constant IC11y = 14076411489381411931504195641065209409650959091520627884787047059976294196527;
    
    uint256 constant IC12x = 15243925297177221607898738385079453269623248113335624795335348380623218169462;
    uint256 constant IC12y = 5808646443486106601905947058309131893141847535779215679582754923808727714985;
    
    uint256 constant IC13x = 12798362041653076638790218074644463515527868414672121569556510756724015552752;
    uint256 constant IC13y = 425203787467401660156559937910229339786799905803245317284285186655683870654;
    
    uint256 constant IC14x = 7179235892332615356911923556062816079855118154121775491292093525501972513472;
    uint256 constant IC14y = 9334919718700313841140071763233005978133543893574944651698238192781629420368;
    
    uint256 constant IC15x = 19487556790372886973827667524318896158093447984380923951856307900605280941656;
    uint256 constant IC15y = 13116087403454142032224470488953262632515268856412955271030896668510047025112;
    
    uint256 constant IC16x = 1847699222127882290389314365143117353517991783585789573228605462776148039653;
    uint256 constant IC16y = 19730854496467947142657638777611029997441650972606265900924733769912956454971;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[16] calldata _pubSignals) public view returns (bool) {
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
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
