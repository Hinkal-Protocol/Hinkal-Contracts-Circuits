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

contract mainEVMCircuit2x2x1v4 {
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
    uint256 constant deltax1 = 12712177162097434196149841417919554014855088386889338049447574295929335101905;
    uint256 constant deltax2 = 2458402098558382980059557877188977804510866888286596425536167843727824567238;
    uint256 constant deltay1 = 6919532669060154781774805952927864141979283836831175542750151640066842209111;
    uint256 constant deltay2 = 1098778992814422102200844540867663252650496964656476998239181071850213143634;

    
    uint256 constant IC0x = 10987478818330363888718428553282373824952575919820139956069503304045838560;
    uint256 constant IC0y = 8456873595389187217771276609008464453576112999813014066036751701718650255522;
    
    uint256 constant IC1x = 19313014611243295262489842949699325100168378629163060203057150019414654428306;
    uint256 constant IC1y = 18923234060852323276902988252128720977173848565501946256943920194932504563210;
    
    uint256 constant IC2x = 15805434977225762005350320710635106862160069077566059411543927394189240161703;
    uint256 constant IC2y = 10281572375776312276357515296195689242064149849687622572353278062351714058562;
    
    uint256 constant IC3x = 5191835756151559166311734961270723943063310808933986415178100475250774030158;
    uint256 constant IC3y = 7764434439312810177471680993818530204856959968641450832179994713449274585479;
    
    uint256 constant IC4x = 8021460189010536808267537632246275368513191617024442746105368308962545477090;
    uint256 constant IC4y = 8331197721736226040616628519410494740474439256152109389952862206020721346616;
    
    uint256 constant IC5x = 2177643865808678425272344808363084584746417728670240856441391697773243283112;
    uint256 constant IC5y = 15838124110579837021616272907190979327488872660314188988189829703652097957984;
    
    uint256 constant IC6x = 20436235466016277290430682746750318977372869413102734373188991173449805320471;
    uint256 constant IC6y = 12741333196055019243940757339325918155582316651016253423151360903549285975005;
    
    uint256 constant IC7x = 14060899095591409759327146938795785711543669825627885048884253565752653596230;
    uint256 constant IC7y = 18250570195226759521154942055339392625645200150495398817713278502528157930433;
    
    uint256 constant IC8x = 15189660313451868493290800369857877765187898999741670060611160995527135637916;
    uint256 constant IC8y = 13151075529115642771045643171166851046303228790183438071350504207995441868553;
    
    uint256 constant IC9x = 8565113425557135721145282306212789461491339432016197538272251800611243467220;
    uint256 constant IC9y = 2447849553081568752341450596413264385812424674870269519522202037251973773363;
    
    uint256 constant IC10x = 25985050094613144362736535877634244687996055826420058690547622751961528141;
    uint256 constant IC10y = 3551829646038010218516924249292217748653976058170167016473385704773914195391;
    
    uint256 constant IC11x = 5796775114522335906591156386933146706418350177876184899958251580483680378263;
    uint256 constant IC11y = 7814692663884810355941990935137047894065141693452533256026725341582547270725;
    
    uint256 constant IC12x = 14767271073655388685610145780375003126220515870124044607359980165535114504026;
    uint256 constant IC12y = 130465659406645317396423200324264332834436814526964195654322567668536458489;
    
    uint256 constant IC13x = 9694477271161368743360906065775075744144472336341211722131167046744432284450;
    uint256 constant IC13y = 10356958628765765140841781977934031662276958066629382727771310443373484045532;
    
    uint256 constant IC14x = 11647855656234974429753807322885410524623228118383797227122435346249211511654;
    uint256 constant IC14y = 7346799649224321110448912186872718409570784605766966590577579644344977443785;
    
    uint256 constant IC15x = 8987531008615964764053475063391220392379653126671297956474052715511265459412;
    uint256 constant IC15y = 5722981374953462494207307759154013401194056011560561404935651674652839747603;
    
    uint256 constant IC16x = 1591676824236262058206295106717575166958290514804171728802374333877270761709;
    uint256 constant IC16y = 11129466944365253413895186146651403599553970323068613152648378827516227386150;
    
    uint256 constant IC17x = 21326449579293894972127742643245401999851708097648947931881277616590180563683;
    uint256 constant IC17y = 17551085020956209441142182457820942331174633616028544347900491650178277787882;
    
    uint256 constant IC18x = 4953847410634940705383128873456592312518018390083649499988611113352866529090;
    uint256 constant IC18y = 14175673890178341113509869653488878699527735171886172091040424698255658068020;
    
    uint256 constant IC19x = 780415869624388271598088300729110301759530281690713246664946213927612032770;
    uint256 constant IC19y = 3281932123854353046271990582975614549359986905732979981837159967304040261681;
    
    uint256 constant IC20x = 7372344020635222928540869210331492349341732178077550691712416204214575432772;
    uint256 constant IC20y = 20895106055682908748636095878886258950921137153487422785664961485425936578964;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[20] calldata _pubSignals) public view returns (bool) {
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
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
