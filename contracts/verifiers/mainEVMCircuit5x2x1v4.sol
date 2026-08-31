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

contract mainEVMCircuit5x2x1v4 {
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
    uint256 constant deltax1 = 20151209826441104316401457789638323070602738801879821066436127289527103470010;
    uint256 constant deltax2 = 17965120948156012751962075777595589551853370132526790092375838209895623386991;
    uint256 constant deltay1 = 7865509241229946049544990126789380318343474870026889251755855173982488846321;
    uint256 constant deltay2 = 3481671925283514637206784350380330558560854090033056617816623309989491141410;

    
    uint256 constant IC0x = 10148414253102792758516851895793725515603270940543919764716026005561413203813;
    uint256 constant IC0y = 5057411144370701025427838605996633644724832036757459676566850185255337483989;
    
    uint256 constant IC1x = 15001337700821555638354048479134824124565313285124956189418845263033520898095;
    uint256 constant IC1y = 15686585021853408578615688718348719801910891993375082973608754901289429396671;
    
    uint256 constant IC2x = 14262293426205309246725158373727813908770205128511140701767773497536792179210;
    uint256 constant IC2y = 5203606559204379277639679446287934950188041170954685851195582157609872114422;
    
    uint256 constant IC3x = 18363315318361974182011595281606530162888694934398854977408626969919982104858;
    uint256 constant IC3y = 5847615777680528633067526772562662180902336662632580837242016024456246903255;
    
    uint256 constant IC4x = 8756005717160680996857257431022312593012822823728440619219812111152714616503;
    uint256 constant IC4y = 5672393187126308130985241402086596161911955921946553554973805214077404625670;
    
    uint256 constant IC5x = 5336228448225259981655898175557290106872265011931693341078477621407218180252;
    uint256 constant IC5y = 4561734225667129453267047156365048558307630253712970226868221986786263325808;
    
    uint256 constant IC6x = 9203495590962015941059416950747799801363279188009057072678931006519782588606;
    uint256 constant IC6y = 7614068374266289394049955432444590763645712636705273806267981717313988285034;
    
    uint256 constant IC7x = 16755277166286539525206652123358745144120725046056546175206988073074067323402;
    uint256 constant IC7y = 17534238324827262916683871045456462726122287771737401736128531874557421151039;
    
    uint256 constant IC8x = 15082403730129852796568854404495994276655047622193854692160699639716306066316;
    uint256 constant IC8y = 9530837403646559766664239641257317498447575060660524365024732810228915308682;
    
    uint256 constant IC9x = 11082949804653209125620703814723425033264423113140877467185038937758621168037;
    uint256 constant IC9y = 13329490587752734940351996558954047737214155207782440052528634927692928864516;
    
    uint256 constant IC10x = 18043197688462504694569487153299961246026221816958274685810291684395254749547;
    uint256 constant IC10y = 11839040755207437678091033110124868130915404181032717766324380529166825276778;
    
    uint256 constant IC11x = 14069941006445011785264027182025391177225290767394982502916851789432438903239;
    uint256 constant IC11y = 1026594569350300453424697381204326625014777368989365136191453825007195800672;
    
    uint256 constant IC12x = 19187021883224173004715813193498880282368511509170694621179096421426771116656;
    uint256 constant IC12y = 11733760328742181341783548751472402765401485734735179553680133780667217097683;
    
    uint256 constant IC13x = 11727194495594087125836412935665521577307837997192189030109155783949044387076;
    uint256 constant IC13y = 4982921015153623002644399067118431277228846356931159539236114781160105347183;
    
    uint256 constant IC14x = 3559585918167443385729153944228772356844196869855550114543151268431115256501;
    uint256 constant IC14y = 17632857079459315816322946107491331604560020829589175458698549555603032787577;
    
    uint256 constant IC15x = 4292572745138999484860847268331581430698477715922299968051920885648291477406;
    uint256 constant IC15y = 17162565651532174291309129986102348313390905021030749894280249584835960799580;
    
    uint256 constant IC16x = 6951151293114444945598928016799368131248035540138440273926290815215472034054;
    uint256 constant IC16y = 7106008618356750410451545841745370325666347623117844677834850559247850342092;
    
    uint256 constant IC17x = 7274470101783770655010703982490514868921587496893690326513904562586853495448;
    uint256 constant IC17y = 21855419732589095507090591790649497851756818625517331057232245884506916565475;
    
    uint256 constant IC18x = 13674150796046732049766154039747577471108962401938232956568599942133612692336;
    uint256 constant IC18y = 20504291800527340658440770983982963385885914906679816455956517834936784296583;
    
    uint256 constant IC19x = 17981187491710293415344752376742730894279173417508869491454390618908507786394;
    uint256 constant IC19y = 11624406289685108333248361637964676251820099039619413304350270086104051565383;
    
    uint256 constant IC20x = 11776327161720222479388311443394958366150632795050838929189592251755924554019;
    uint256 constant IC20y = 15129489526767812174465714697229114465232865097292910219900884937201171523983;
    
    uint256 constant IC21x = 17407160068169098255889514203958852328053794532963530095149004132159980581542;
    uint256 constant IC21y = 15111519513193573402971851873724120417849556581915930237203332455183563201787;
    
    uint256 constant IC22x = 19073546586027132314845249478853065694882357965325312440782386240164242690745;
    uint256 constant IC22y = 4457631412983987450064501323371524107042794180858605852073318013299075608518;
    
    uint256 constant IC23x = 10014791667736475298528607081169377313827424936179987191160996678360441274273;
    uint256 constant IC23y = 9668407455836390677306274865848234871312461073947688953692096685161421093456;
    
    uint256 constant IC24x = 17339518212634829536456888926594810229600924936555988892816580983845760548031;
    uint256 constant IC24y = 9849555911891706365100483002289019838819992180301544279212716913054833834395;
    
    uint256 constant IC25x = 9746911742566901450616152207773814889665134665183220250669376900326253318880;
    uint256 constant IC25y = 16304771037264772229038512692020671721414769481035016831637729823621769451161;
    
    uint256 constant IC26x = 14122931219274064967300112301921946716882187830921220945526155967866318600657;
    uint256 constant IC26y = 13653117528962160348625237897743632482327204000158905187804542166650663909098;
    
    uint256 constant IC27x = 14310900492308071043926376400886308392827282775346870549553576870738593643897;
    uint256 constant IC27y = 21226607976030224926880209770853032528710777058426467670941532330543971485033;
    
    uint256 constant IC28x = 12327307987830079162348914152268450134716115307083220039813134231828649853035;
    uint256 constant IC28y = 5308139669491987930365412010848045117991207371640894692297275947677998309145;
    
    uint256 constant IC29x = 3084919503268010632051438380436367712523158821122672413323000754464415697794;
    uint256 constant IC29y = 15569361797914217900756935511631356065239040568412437043757221843752400979820;
    
    uint256 constant IC30x = 11950417644513131681748499156161974151329219812929454323455415232328877260882;
    uint256 constant IC30y = 15840631366269685639234318506535214463962291286338043950572504953335312345810;
    
    uint256 constant IC31x = 1143824923067372530869393292541623920184194173580173594063322846012839603848;
    uint256 constant IC31y = 10361330495321760074120985558190038477973259087932072613025775231915110601865;
    
    uint256 constant IC32x = 16723509665544429798169413280963960665235512867088966630612139413415064252088;
    uint256 constant IC32y = 4334748003998969271251689439056836121744944568473879477844753271688705965896;
    
    uint256 constant IC33x = 10282936538600176828492354980487047078964876624652649293553078778605021408660;
    uint256 constant IC33y = 2765655121533220386660037557227409931982661981844931569187848834441889167780;
    
    uint256 constant IC34x = 8967393741131301303625171186528111182400246389791712497588714023606040876252;
    uint256 constant IC34y = 9240833632513756422162681193925800710390372632956777021169449679906722354708;
    
    uint256 constant IC35x = 8592009602047856037011531100622320667401467697139643361066466693703081353422;
    uint256 constant IC35y = 4576221553869120048033541762331795228662578970047813879968909775182373635805;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[35] calldata _pubSignals) public view returns (bool) {
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
                
                g1_mulAccC(_pVk, IC31x, IC31y, calldataload(add(pubSignals, 960)))
                
                g1_mulAccC(_pVk, IC32x, IC32y, calldataload(add(pubSignals, 992)))
                
                g1_mulAccC(_pVk, IC33x, IC33y, calldataload(add(pubSignals, 1024)))
                
                g1_mulAccC(_pVk, IC34x, IC34y, calldataload(add(pubSignals, 1056)))
                
                g1_mulAccC(_pVk, IC35x, IC35y, calldataload(add(pubSignals, 1088)))
                

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
            
            checkField(calldataload(add(_pubSignals, 960)))
            
            checkField(calldataload(add(_pubSignals, 992)))
            
            checkField(calldataload(add(_pubSignals, 1024)))
            
            checkField(calldataload(add(_pubSignals, 1056)))
            
            checkField(calldataload(add(_pubSignals, 1088)))
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
