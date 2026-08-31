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

contract mainEVMCircuit3x2x1v4 {
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
    uint256 constant deltax1 = 20633177510217294328134726729120753827201772342053886359901957898184642837367;
    uint256 constant deltax2 = 19192270540544092952715949280492764929099999618231026556455991780043788590918;
    uint256 constant deltay1 = 9009466564999253311386613415766221024583250745092991089151570515542929460179;
    uint256 constant deltay2 = 17725710858911816603139508273211052200842808979026101947372237136278180904285;

    
    uint256 constant IC0x = 12135157571090387129275568889273822788409870494271549787188229036475630582171;
    uint256 constant IC0y = 17224038666975992041049573704489387950571898817723946330128806259716490909377;
    
    uint256 constant IC1x = 19744610801391307157550105402285809760521954728062512284903246601272782192398;
    uint256 constant IC1y = 10976804664640750148331406425060664852604099698129527279660855718289993377122;
    
    uint256 constant IC2x = 1898702418024590311578969965308854917081295233951902728669383900183044501722;
    uint256 constant IC2y = 9846615887877971663645132480936544809520880263715231449313935553185442463318;
    
    uint256 constant IC3x = 2647370974926845697237121957999709018233755697837499576285996703436020847509;
    uint256 constant IC3y = 21734878835552908083483206561560399213873091765475294781456426070484701001820;
    
    uint256 constant IC4x = 2848036400862925873401346964991957028975818935313876845871243320009841652172;
    uint256 constant IC4y = 18886357569893905913580877832064400569885654618940598378261270455226480231649;
    
    uint256 constant IC5x = 15606122319501590127615312240056941581322313715379785718388259036408845259510;
    uint256 constant IC5y = 14741285257991242917101561586585964296396036555095533406305498219800267901651;
    
    uint256 constant IC6x = 8339906651601680367349479981896644024636305192168620617053140029762850176793;
    uint256 constant IC6y = 15178838266705472734726381934262259073861582175485472999298808059237243772137;
    
    uint256 constant IC7x = 3351030652432876931391976614217320659525008915007145038916954271612265398258;
    uint256 constant IC7y = 18970747329774399284199222351267607136429199691222121131003186291347212009821;
    
    uint256 constant IC8x = 14595595108934650703997281624802273359806428548303214977268526773041103353412;
    uint256 constant IC8y = 2007939014325756552037626819696316481436756309277544410200084151109123999325;
    
    uint256 constant IC9x = 7955163093780046147764577372247181759267604232533853512841680292948547074342;
    uint256 constant IC9y = 4284724849618695868234978523733942276867102618002638753566248398803937164478;
    
    uint256 constant IC10x = 19038252848211039650154260680196874493780086060421732268428558112105844335064;
    uint256 constant IC10y = 10965832123137273326265112709461095597768315762752597710703983999708155553178;
    
    uint256 constant IC11x = 7090921133002554525407031232185968742563766995314854473441227136592684100818;
    uint256 constant IC11y = 4036990338498101598418161168342290486562861463365714090801577163830837685634;
    
    uint256 constant IC12x = 437141588113375567822695876282249841321768297158260743266728419482224795179;
    uint256 constant IC12y = 1330272080552654381763656067648567259319101112189456641522713319493716198603;
    
    uint256 constant IC13x = 14346353207235200498906397807116895507534369089531361760534081330010097617032;
    uint256 constant IC13y = 19429721480134079000245031539018749238490928288171974550143822844196286208531;
    
    uint256 constant IC14x = 11549710155051140757592782140176105939844426386542165947242836060844708586709;
    uint256 constant IC14y = 10875559968818893626696082052175875852504164886481152435420678912208051364888;
    
    uint256 constant IC15x = 1706131953909730788127207482097064420448171465503879031044829009215922394701;
    uint256 constant IC15y = 9377456194636472864772988825442148222284571243374099524217712934824121999968;
    
    uint256 constant IC16x = 14988997366253968480146510196585733698593821777411489452470952756946860309552;
    uint256 constant IC16y = 5587068519905240761635827642851630352260582553881955691631137249054673857183;
    
    uint256 constant IC17x = 11360758759410341501769941700932885886247690301778151902120229625969706769199;
    uint256 constant IC17y = 10873166456398865863559179644477094887409026192081746261341784722161751537345;
    
    uint256 constant IC18x = 3038865894695942334708405027047426900268895231108235089912489833478733175842;
    uint256 constant IC18y = 19627058246300744312643454990457341022205345354913105215389913005224023554347;
    
    uint256 constant IC19x = 8292944488636103679878474447571433570767317741736444153983904255515377250812;
    uint256 constant IC19y = 1995978577476153381731623099130386511782576350382965204081724605231683846087;
    
    uint256 constant IC20x = 13037508895309572967656142378807124055859676873161705660194733151023486542661;
    uint256 constant IC20y = 18791067840757425274689314179737630328660655402542351671856311534791220992650;
    
    uint256 constant IC21x = 1064685525550519882246181447547414253620681472573309740363077600676403984757;
    uint256 constant IC21y = 843294108997973619911290223344241211850676492202770948938886860001683913420;
    
    uint256 constant IC22x = 134831431521335625300827486227805969535763394654848127873959968219234880038;
    uint256 constant IC22y = 6044071415147622397211434487936754367669887712681582576941824271430612499393;
    
    uint256 constant IC23x = 9889632633348995154988025201839555135001247516963329182039911861450710389737;
    uint256 constant IC23y = 19303315629808777941210871733146126466754414478828287550996828627208643430615;
    
    uint256 constant IC24x = 1799729089709625076142839584954700081693588711029234200389956016345757084168;
    uint256 constant IC24y = 9567563680883304337636226587624124746592639265413710307727882411814792575234;
    
    uint256 constant IC25x = 21414683003434977471068332342912430043640326208112858418863396007936468114179;
    uint256 constant IC25y = 5735843181274496280765611312178316142828715939487024277772300628395834805792;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[25] calldata _pubSignals) public view returns (bool) {
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
                
                g1_mulAccC(_pVk, IC23x, IC23y, calldataload(add(pubSignals, 704)))
                
                g1_mulAccC(_pVk, IC24x, IC24y, calldataload(add(pubSignals, 736)))
                
                g1_mulAccC(_pVk, IC25x, IC25y, calldataload(add(pubSignals, 768)))
                

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
            
            checkField(calldataload(add(_pubSignals, 704)))
            
            checkField(calldataload(add(_pubSignals, 736)))
            
            checkField(calldataload(add(_pubSignals, 768)))
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
