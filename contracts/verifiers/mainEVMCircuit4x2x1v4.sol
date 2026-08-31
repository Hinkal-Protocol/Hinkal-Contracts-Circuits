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

contract mainEVMCircuit4x2x1v4 {
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
    uint256 constant deltax1 = 21769946543671025637512714657353820575786034851089672688973246836635077224353;
    uint256 constant deltax2 = 10270929392029172365318824630600803730306795779934019647895020358182321105927;
    uint256 constant deltay1 = 7537938553729003584513446874154784567606019338702838216624037060289367117027;
    uint256 constant deltay2 = 10113840925496594686571757621002790397860974277915603127662373115817159322193;

    
    uint256 constant IC0x = 2174262720259400380046548828376188698792867862968601869042563924515206547432;
    uint256 constant IC0y = 13942740083342926031323730923729464514494786259438940767929913213982795958827;
    
    uint256 constant IC1x = 1994159821091736248345132907996475924442181390850761207204427631269701377975;
    uint256 constant IC1y = 14538226245183698917415328011428587390442225450469802855365052529722513037692;
    
    uint256 constant IC2x = 9395774375459154009073016568653956754581132693302902262924765429430815324852;
    uint256 constant IC2y = 21878848115608277604852910326629609805019625269617884483235037748991243098106;
    
    uint256 constant IC3x = 12037706597685678492059449259766726966622010882788502042933060095795086263225;
    uint256 constant IC3y = 18532129307630191376309656848019987585164689369873962665471545642538230239015;
    
    uint256 constant IC4x = 20501220511677218888641757739016190808786123949693000178346411556158980346648;
    uint256 constant IC4y = 5880218962434328695178179135393953935797059361935830854071270108387257903004;
    
    uint256 constant IC5x = 2969033286330413885345994310080460082381193558472244544496288508612495927057;
    uint256 constant IC5y = 30034083939990669972199927135866471531994707888445532515165221032642140708;
    
    uint256 constant IC6x = 13792880596672770073794047663095223103772605015031887852878692939639957360565;
    uint256 constant IC6y = 10534698080995124019292443819744310136153374676326452674045978032455572399438;
    
    uint256 constant IC7x = 17627914325581432274700026945040490220844073399228138823370369669984093117912;
    uint256 constant IC7y = 15304543079309648478482312010629185129049515826034167442869005535198165464428;
    
    uint256 constant IC8x = 13338648476320179576394841497811320795694336997676759526592655378854574489586;
    uint256 constant IC8y = 13581093241995314164511249011651202108267995948797977819198370751561513563774;
    
    uint256 constant IC9x = 4886083837275694933125744833603526783242349977204968726308942506480871938669;
    uint256 constant IC9y = 4611172742433465856466465666178356919464382580986932384054401835918180323424;
    
    uint256 constant IC10x = 19837965930766833462708667292194171450697826036481473973929130669039542958341;
    uint256 constant IC10y = 15926512539078233913029001473556751218035688572379845502298928517347478040461;
    
    uint256 constant IC11x = 822483649618370237498451797048387473396812635729065856091798902370538851123;
    uint256 constant IC11y = 8311719034941092213869618403745702284968297228560704442322481743848775169767;
    
    uint256 constant IC12x = 21561872775390028513155654595547434984954861658894424773640910583420066267945;
    uint256 constant IC12y = 10535505582913806356963474397796719872200391926820749221343980429150453562300;
    
    uint256 constant IC13x = 10216395555462988796535261583722716415821772640148206307359514467705791178779;
    uint256 constant IC13y = 732083581176443889274827532591194191122837282849996365217256074199033825209;
    
    uint256 constant IC14x = 21665176955190624566434470284969703476402836277161250628353656248042522102103;
    uint256 constant IC14y = 16311196744623124686434196832081921071166291076475106831678454285764655684424;
    
    uint256 constant IC15x = 2720368747422874847322504788291000323163103176472512547468078851869921318491;
    uint256 constant IC15y = 20813230433434868385035710355735507597857567946622663328998799474678344442187;
    
    uint256 constant IC16x = 6195004894616724959141067040468845112074953821654300296314456091036806240651;
    uint256 constant IC16y = 6745498405796195886827143441203249246291833091084573501664058560112730006620;
    
    uint256 constant IC17x = 10737075459175912799542310009599931940309928970221141821410638352516158803805;
    uint256 constant IC17y = 2475217371928786872322669885174424204040939674179281336483514473730579604648;
    
    uint256 constant IC18x = 16659838699675683541154678458265208795149628780154831366171327337267224687253;
    uint256 constant IC18y = 18341010745545607484077468764198754145238705340736903362253645055810509759082;
    
    uint256 constant IC19x = 11639372449586620452246191075563137839319167996846876336428405462444204002382;
    uint256 constant IC19y = 9916791875103534114222668207934979496618143722707993167743359133381857185006;
    
    uint256 constant IC20x = 92018790867779200197773763381706672343603133220804539913624571372597787294;
    uint256 constant IC20y = 16036708373737407908045887623235787362961860470166411995633955769638047741394;
    
    uint256 constant IC21x = 14976347160263800866572901181299950053908605328947718385954216040041224673252;
    uint256 constant IC21y = 21058951033032882510624692388477929899314924166587547943756485830664969326065;
    
    uint256 constant IC22x = 13807162702862536682015037822050796017371623318552038762096380298155136909000;
    uint256 constant IC22y = 19297398382064345635712580928925966059789348537030416936190778103514394952368;
    
    uint256 constant IC23x = 4993151764347532647563536990474651317013467710134377202382341894929421587355;
    uint256 constant IC23y = 5597455271415219613317931793371377380498949389434688529715286649143188023667;
    
    uint256 constant IC24x = 17348397747784148282522621842538187670198448526561072684060414655442209168290;
    uint256 constant IC24y = 8958703927672450793830781266496397539155573988742031824068737322839996764484;
    
    uint256 constant IC25x = 682768383322772345606104319431661207399329968282404403819867998215804239839;
    uint256 constant IC25y = 20695965323848102895877597635984111676194945383346428000143087852255374976900;
    
    uint256 constant IC26x = 8663553328397813170195860660808248685445660985030032117447898474234566699628;
    uint256 constant IC26y = 17246947255448237827311624397553320573350247739382743407982308003022543508951;
    
    uint256 constant IC27x = 9546145683988116386482939992889747968274852960959429438778331459104559324571;
    uint256 constant IC27y = 7154760643590954674274849110446640580516338535423336254010074105161441214494;
    
    uint256 constant IC28x = 3649639763152280184806795240486200928532022676994471360220303962060866901856;
    uint256 constant IC28y = 2462196697231776606465550829190489677532349369701067271939781545957275628182;
    
    uint256 constant IC29x = 6425639097018332860080885415857255656513695397964983512898330200483502663742;
    uint256 constant IC29y = 17450881259590915348123931046927083337975795954911204269283457580992796099105;
    
    uint256 constant IC30x = 19586476636497226670724190786346143383230451588709409420669599928661899360625;
    uint256 constant IC30y = 10487994546319219335250760514444595147030775680801438158479683117604684785755;
    
 
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
