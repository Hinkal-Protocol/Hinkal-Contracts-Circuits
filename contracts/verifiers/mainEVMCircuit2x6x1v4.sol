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

contract mainEVMCircuit2x6x1v4 {
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
    uint256 constant deltax1 = 11503991248381136003420485706118732358991961539219939938368645591258565505144;
    uint256 constant deltax2 = 1787782352528521358267867525200560054926156760838018683499806156793275379531;
    uint256 constant deltay1 = 2081712907725370779116323564274516981132996941745345961483571178604291059720;
    uint256 constant deltay2 = 18697227756053945559753143459578694906368425212438183985444936973741726161734;

    
    uint256 constant IC0x = 11962702366500466484222963286409465905218829761037924878398097791668983592476;
    uint256 constant IC0y = 15059741658122910568629922647026210019376614945680582718888043447150959267207;
    
    uint256 constant IC1x = 6112752719472661539198059686871054038046958708823219808213380693760474997530;
    uint256 constant IC1y = 6560163764252047108623160096829134096700828958251734112660624978860934839967;
    
    uint256 constant IC2x = 1559285147345462896188020518454956323497146690670088624480301198384444407538;
    uint256 constant IC2y = 4959320231061482267215279605561892911603448205071465139259935422328960381963;
    
    uint256 constant IC3x = 6454133075009028103406741114181137544231110639391632550662218358469370620104;
    uint256 constant IC3y = 12045541945299552985129609807992576085809489814618866255936672632735732613320;
    
    uint256 constant IC4x = 16809986294728360588953079510870305109341234276346622351384484868670447753526;
    uint256 constant IC4y = 630653241636490056469689672323669125243762864037835508232653379760288334003;
    
    uint256 constant IC5x = 19262159867336726068814663507660054886738028583441008222222377668016867711298;
    uint256 constant IC5y = 21168124147613185253992618831102561832167456942092257803361299518508693363327;
    
    uint256 constant IC6x = 3740099256804124190681992877771961969580114243423990190514511085732077644038;
    uint256 constant IC6y = 14954286845787395109037914654565967825284176801377218183306799763387574035659;
    
    uint256 constant IC7x = 19092025201968071826962591105628809662366853465594053187444389019564008267888;
    uint256 constant IC7y = 9609453933866126784169411604678998972107943218268865232626806708491780934261;
    
    uint256 constant IC8x = 15234310955246240399944418980047801663656654193737784214221529194418348955339;
    uint256 constant IC8y = 14100333149646428402559882049295536043047161651489423481760522763904694341939;
    
    uint256 constant IC9x = 12560193652745347699883925740223687428362882506644480785728659802186772518001;
    uint256 constant IC9y = 13299588848226736476364858700079941330179346655758703105630509840252811397485;
    
    uint256 constant IC10x = 9631948433565076433701577554310712864818468655827104097687068244668353401769;
    uint256 constant IC10y = 8295057479347313542737746273011593556927375933084334825482808782774615090490;
    
    uint256 constant IC11x = 8876381846777702453712368807584041433471609759661805853880631010370974010073;
    uint256 constant IC11y = 8940194811760379658664153067678188710972969108559613937125186394007718797520;
    
    uint256 constant IC12x = 5752837371796439816447790464487362982374244029086167425229946460701757443944;
    uint256 constant IC12y = 4387194539580403401331257739626822459320413581421576353889764012104169231193;
    
    uint256 constant IC13x = 7757335768925882134975452281939485117020643465067189047912152456607044296341;
    uint256 constant IC13y = 10088188671559481515366791236666321664026187533363328392496252509279558832597;
    
    uint256 constant IC14x = 5637084793728240415260099425809637170558642416711938892796500115989177242445;
    uint256 constant IC14y = 9862229215705197119019109814802491924160628248747588540522415682109470644611;
    
    uint256 constant IC15x = 2248890187830516079540012475696311213182179108375470223295539854525938927923;
    uint256 constant IC15y = 18953442902925520931860335851013280338833360231662206989566726821040159646608;
    
    uint256 constant IC16x = 7438081817189123673009052217494317662764419183896093285447124703947690298429;
    uint256 constant IC16y = 9761301588072046373117900905255467829705423770252836101960560990030540530486;
    
    uint256 constant IC17x = 19030650739302499862146016097964056128031644009278455544862193882149166834752;
    uint256 constant IC17y = 19942983305300404398901724133311148379411448153086415516189315094975821714371;
    
    uint256 constant IC18x = 16492811328731608361654304031762107249156919733116268279348191444014044748097;
    uint256 constant IC18y = 1811399633976111347455333141770674990026580386597015254257940709751293087440;
    
    uint256 constant IC19x = 9331640361588850725158021787518904189707790648855412410267055007870470880434;
    uint256 constant IC19y = 3128309187391835047438209481549585540353215603088322103710944722929513934382;
    
    uint256 constant IC20x = 20125889505607899455897655328636790258812559145128052525696285759447896877679;
    uint256 constant IC20y = 19569730829968146550140548242221159995252459433618098359518138986061515437332;
    
    uint256 constant IC21x = 1998017207129933831010974175996401115897538886263389670738459823210051554550;
    uint256 constant IC21y = 19181318115261378866519524590051293041815626563836880600017162432479708100495;
    
    uint256 constant IC22x = 5436937096218829223159698327072000858287096833653889109220867576072110333110;
    uint256 constant IC22y = 10637366699707267082312357159569103333460549454528541874959172505738611917156;
    
    uint256 constant IC23x = 1483771368203766835793842622156066055403576672030543970167980776495583930819;
    uint256 constant IC23y = 1761590348712054140347651981553412620565070074927194893059066247659988708385;
    
    uint256 constant IC24x = 11213650599798597470341955938663571844170714193019759789462468306949854654379;
    uint256 constant IC24y = 19834395904076777506222885703642656837563366794044424112977719148713961161504;
    
    uint256 constant IC25x = 7865197976869687008181074799261784859654601471837639032361692001172378736079;
    uint256 constant IC25y = 13617296633149697083999025814802343051616248041932949339730516243365451671654;
    
    uint256 constant IC26x = 7521813702850082925860625158684366315265763733039276940917124927284201392353;
    uint256 constant IC26y = 14078087630912820197482502990679563210711878993815639808410533822452067911618;
    
    uint256 constant IC27x = 14397435109562481308637279669781302697399797938778639541716466322654596774876;
    uint256 constant IC27y = 17251270416375902194427611903150712329870267542740688908849454531225735572381;
    
    uint256 constant IC28x = 11958749333159803351520737808799861201064450222488175165496277838756540370736;
    uint256 constant IC28y = 3028780642249113775930690554697755645731164162283241180096894524850231518276;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[28] calldata _pubSignals) public view returns (bool) {
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
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
