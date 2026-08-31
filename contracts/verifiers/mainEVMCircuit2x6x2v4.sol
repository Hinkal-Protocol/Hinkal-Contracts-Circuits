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

contract mainEVMCircuit2x6x2v4 {
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
    uint256 constant deltax1 = 14428224583845755927256752236131914160513167454435865933100417614032471451054;
    uint256 constant deltax2 = 8375689160931315996836991917960688034210302341562333005358353869014429821740;
    uint256 constant deltay1 = 11501976705881303745189492497841034160045180758174695448866851179067010854314;
    uint256 constant deltay2 = 18681723037472606575117170616550295312203426389165057232108851100990731032149;

    
    uint256 constant IC0x = 16139904376684488928179314307649926998363318721691036414867575252805059437840;
    uint256 constant IC0y = 4884888487385523626283383318471176285358660293817310624797619909552916684673;
    
    uint256 constant IC1x = 19444518674747171894009549308485063631720283968224848914702702158996204277471;
    uint256 constant IC1y = 1792060128478155649626646131185098265875497953818709571596292688303773996724;
    
    uint256 constant IC2x = 17008545150759270695747585252388571064181935890645212122369008001878831021682;
    uint256 constant IC2y = 19140120386242225219633542200878699607282557324347455635411109136220456300345;
    
    uint256 constant IC3x = 21119282563882314966362318617553930525901057385531580001313689059463236779377;
    uint256 constant IC3y = 2991574277976158765254472781044247138433512978776381420297876727423238100322;
    
    uint256 constant IC4x = 17322713702187450823610617725955992712948500404174992106447498352236672580706;
    uint256 constant IC4y = 11297794094587259919157619383889153477910143098513999120790054245344729520449;
    
    uint256 constant IC5x = 176705787976247786330480765985522804517511535808051175382399556354503449573;
    uint256 constant IC5y = 13502928075640144216009778015144720482105003604228779895851651539628684506725;
    
    uint256 constant IC6x = 4821068545375052172714613472011232446856134044343683847903344597185786731563;
    uint256 constant IC6y = 20441355034501209365606495149479638025062003078969370427561324891585522259945;
    
    uint256 constant IC7x = 6303777990566882524438344595555679134611222755226162896629784742368076499898;
    uint256 constant IC7y = 3631874854528027341538870800084917773085784276823864297091334594076781663747;
    
    uint256 constant IC8x = 18882586833029293643119855876336370778736393844217692679322240269654962838781;
    uint256 constant IC8y = 21779765046149613579524774566494506444269736773339714922496222572875174035824;
    
    uint256 constant IC9x = 9624404131037676268270299569541747560340299319160498330348641595441262283444;
    uint256 constant IC9y = 20026632411565254365817843451696586950481001107465998734450311550311968156278;
    
    uint256 constant IC10x = 8503659195817841922408552678200856605030114204876277597109011734530329654552;
    uint256 constant IC10y = 15536995390634859559121047748615266647476312484998313241472571204059262117985;
    
    uint256 constant IC11x = 6254740180429553284860944332422085755433623232492375382977108983266787262370;
    uint256 constant IC11y = 18442259425468733901577077012713813915513131922067286686220889277517076614176;
    
    uint256 constant IC12x = 17109020522435599802597072155604759050540956925776102170336780797077275134242;
    uint256 constant IC12y = 6464855756454020180734629681389484350204885234202279356646542877885945686846;
    
    uint256 constant IC13x = 8571793341708871098729695317705288548100893866693074845479624209403375264077;
    uint256 constant IC13y = 5351454885410579199740304824859495607490827288183294239549382584236975965411;
    
    uint256 constant IC14x = 6137572165362159657555036343683985357756184496308117565214229283507831479941;
    uint256 constant IC14y = 1034960222363812071331548484784267129845248220234508504306258836143454854601;
    
    uint256 constant IC15x = 4995941401375577208298994538499798704956576642263911545748684046798825075371;
    uint256 constant IC15y = 7829478573924582913987133113068947790027735706617825641233411671195785244622;
    
    uint256 constant IC16x = 11044845087023360267676102571673235219637423464846543972713084824796306476568;
    uint256 constant IC16y = 5868848198411778770145460186897954726257799997147550152511753939572000700267;
    
    uint256 constant IC17x = 15766601976074995051593029323760252515930790745556909860572490509324821737820;
    uint256 constant IC17y = 13404288929982494245736040704194469361694990120094233408507177888062207102451;
    
    uint256 constant IC18x = 77911976353198896904513195035784863149327945743662208125249930387665018646;
    uint256 constant IC18y = 14642458595377573104980385854481421096946953185819854806299671087576166532782;
    
    uint256 constant IC19x = 17770058204348484353210007496741214688497692277034338032824672918930884365600;
    uint256 constant IC19y = 21360777220458282424555962773885157616456447213821657558587777212711032681781;
    
    uint256 constant IC20x = 14099773675165276049896199909817161889909204825235069851187945953115236650805;
    uint256 constant IC20y = 19931175254868908927661479599583280269754724447731142977284124205150811726281;
    
    uint256 constant IC21x = 5954061415634845471510452185827710647670576504336677912856936758208586162547;
    uint256 constant IC21y = 16780810576890234638963073196672605755254922031766594712508576900185855028373;
    
    uint256 constant IC22x = 10624432515416179399740881225297815122609469304924412039038496271601017630391;
    uint256 constant IC22y = 14955904097814556991273802108526146127624080765656161596319206195090114954364;
    
    uint256 constant IC23x = 1592349911412247521958229565558708747778384949265711207373527541990585173265;
    uint256 constant IC23y = 15901451115858283533504437696566352103149113619081046246390198927209589488757;
    
    uint256 constant IC24x = 21661080095141623603670117318795256869282681994899080316760953678793482496938;
    uint256 constant IC24y = 10400215123792140653888523217077804895073927860609928831439133615159665452151;
    
    uint256 constant IC25x = 9295887080940658186737507726146190604879779209394602450463671688383503375078;
    uint256 constant IC25y = 3538531948737010746858085684462832089178235898633460100166791438945424987145;
    
    uint256 constant IC26x = 9008811976222355032033590849553984205045560768760443085008117520465957188728;
    uint256 constant IC26y = 13306284338154603556120100065773498794134147051659754982632120036954975691494;
    
    uint256 constant IC27x = 1365682891101167715403007881139795519807138502444573425923338494022612684721;
    uint256 constant IC27y = 6174897678422745844518796023415120207207326001911246036180911642673893196523;
    
    uint256 constant IC28x = 15702734885114409463421586598972957816962302851055906860836805388801051366147;
    uint256 constant IC28y = 18447868444395761411656218087940567895634748064650157321785850468647645241429;
    
    uint256 constant IC29x = 537428351813822782975153732726902562657140056895575056630373580219972045891;
    uint256 constant IC29y = 21516657826497610579709293124664367369198185937570054065677081854451694275673;
    
    uint256 constant IC30x = 4762247669964569478792883374305445529146460473066487356596030518035218056661;
    uint256 constant IC30y = 1594836276245888794689548424156484112444642052295094318864099205396309645773;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[30] calldata _pubSignals) public view returns (bool) {
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
                
                g1_mulAccC(_pVk, IC26x, IC26y, calldataload(add(pubSignals, 800)))
                
                g1_mulAccC(_pVk, IC27x, IC27y, calldataload(add(pubSignals, 832)))
                
                g1_mulAccC(_pVk, IC28x, IC28y, calldataload(add(pubSignals, 864)))
                
                g1_mulAccC(_pVk, IC29x, IC29y, calldataload(add(pubSignals, 896)))
                
                g1_mulAccC(_pVk, IC30x, IC30y, calldataload(add(pubSignals, 928)))
                

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
            
            checkField(calldataload(add(_pubSignals, 800)))
            
            checkField(calldataload(add(_pubSignals, 832)))
            
            checkField(calldataload(add(_pubSignals, 864)))
            
            checkField(calldataload(add(_pubSignals, 896)))
            
            checkField(calldataload(add(_pubSignals, 928)))
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
