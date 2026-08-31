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

contract mainEVMCircuit3x6x1v4 {
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
    uint256 constant deltax1 = 21402171812734481194549549948104444983384966724647888736751888930731734295757;
    uint256 constant deltax2 = 4358811986386948466252797930015258177228211875180230346574894772644378032624;
    uint256 constant deltay1 = 20987297479561064343424176749944272168343302509463116723843428390853258899111;
    uint256 constant deltay2 = 5079874179126761126481025663215253206939916368464241758640115527735029971770;

    
    uint256 constant IC0x = 10415828253922286117407754448869392231876865494742165854250593648919645450097;
    uint256 constant IC0y = 20352079012376174183497373306897127238540141432970220431450892819215799656569;
    
    uint256 constant IC1x = 9052304025599462381061083051010734444341379548101873829484735949091212317228;
    uint256 constant IC1y = 1226233451401117073948458249860763867853472995254538262488626380083803708987;
    
    uint256 constant IC2x = 21745659735305914198006838394252539670838550831618526329154478152828033937906;
    uint256 constant IC2y = 12454511467221795290068135638140342905319626284530191638333506457916532307601;
    
    uint256 constant IC3x = 6260977381117645447957056096870129195238518408320436931846921970090529797933;
    uint256 constant IC3y = 913790287195277481890237444228004911523340868981376744845780746128554909197;
    
    uint256 constant IC4x = 17214104588312871386416960858510288347568060050023322699275851597518792559616;
    uint256 constant IC4y = 6614719338004124566812359791227240639407904337414454002697865453106615766135;
    
    uint256 constant IC5x = 18792999617975013190765757196864018801537786436361558040822097022825752633712;
    uint256 constant IC5y = 2328204263415376935078015489134014105096474648806702466093572209414970211151;
    
    uint256 constant IC6x = 4025923784798512333703297268587197971463855814304594857287553582157115454701;
    uint256 constant IC6y = 14709216964448471088281614390622068100614010728585987125720962880046253240070;
    
    uint256 constant IC7x = 16130549998762592774843765763304120899799224402465593523835874847485619273995;
    uint256 constant IC7y = 3259300915956900628486501077146381758741639373585030827945942527787184693114;
    
    uint256 constant IC8x = 9465536625944384781411609209877109568752089021993763805596189278138263904282;
    uint256 constant IC8y = 12882014026244646130919071710824756701890765499376644057373302382221237025438;
    
    uint256 constant IC9x = 13959455436445014240779960293170705170841614606845057528884634900705419575105;
    uint256 constant IC9y = 17397548906561868945089975598947800132666305523279636863427348514838261085277;
    
    uint256 constant IC10x = 15160122814452342267508150863314529334868672514621943666360348742590929034602;
    uint256 constant IC10y = 12015331261199437737424919975848821224191175718613492653950719734005753644365;
    
    uint256 constant IC11x = 13336758798532310913208629361632610862978068111038637313184147678557403932452;
    uint256 constant IC11y = 13007764468255561197612253704835740821343741500894676273643864919133251236823;
    
    uint256 constant IC12x = 5952836705161723593123247487551842037809333668305292589225462543993363936860;
    uint256 constant IC12y = 20505295379351559210513316283253408796604865806141704768141482733375838792250;
    
    uint256 constant IC13x = 2370441418402620653391463732195569864674399912370777836199332431675436768735;
    uint256 constant IC13y = 5465540948436878239188618667808903080041676116453371351329230320681295032748;
    
    uint256 constant IC14x = 5096012369963120941345654241686952703120025178811514780763734709335021305056;
    uint256 constant IC14y = 305070242559454341311375843171361248188246227418617327281438696126161928492;
    
    uint256 constant IC15x = 2298902539679835950872799086527587803053195726666321006363123022938295307717;
    uint256 constant IC15y = 8207956680009462536723337245012923375599397856650378604805318337983655202086;
    
    uint256 constant IC16x = 18927735278730109247717347220174755044745920361022337004511329285533432909819;
    uint256 constant IC16y = 19464431146223418086376626076248819063982532947721444794934179989941214639182;
    
    uint256 constant IC17x = 7142953976062323035319997145877103508817489095168376000152013432059807039270;
    uint256 constant IC17y = 9168243145179974932136870620926950687951251512515262421929500539016227808420;
    
    uint256 constant IC18x = 13034569777940434599276858694380622478093151328417393707806607862372844186798;
    uint256 constant IC18y = 19497955792822776247856250614877076977344263336092065221317074305596255338194;
    
    uint256 constant IC19x = 17772715111745962625556636377752420976104134340188499296436359489299531230956;
    uint256 constant IC19y = 4943888382986581055826899309377293275290807505375053074578560034945633982751;
    
    uint256 constant IC20x = 20752541362676137683485044408704445234747449891189336134753877100952225620951;
    uint256 constant IC20y = 6431558064588583435477189848447404370087847585792413835288251059713221116555;
    
    uint256 constant IC21x = 5127408232405450725164565098613030916612197749915802583970564583529058575106;
    uint256 constant IC21y = 8202608423186196183018564988235041050428545530257059593095717373283288858267;
    
    uint256 constant IC22x = 9395780489563657382739222800998927324264580292947301266878317082905515968422;
    uint256 constant IC22y = 1294355598234599554005473009890618995367527984452384781368505940628167459824;
    
    uint256 constant IC23x = 8456749511798817066846389125064366684890449356747842642049286996912823284475;
    uint256 constant IC23y = 15620776482151616896792678541697414941656560317888774077450818083862801021944;
    
    uint256 constant IC24x = 12265595995610711067179421208715162433109601081096496814917675769533900759438;
    uint256 constant IC24y = 19459637313260718412542031721152563821965640485472857459642256696454268697873;
    
    uint256 constant IC25x = 21746698594001857229124434211517948425389122815074532894729933109531913842032;
    uint256 constant IC25y = 15804701490853541918735170660571895960450583092060492911221494889060430705369;
    
    uint256 constant IC26x = 6790891552972877725447136917549289083566873579860949485345769064477417141213;
    uint256 constant IC26y = 15569904981006658721563620544429377891227644811648488829237033712413330696371;
    
    uint256 constant IC27x = 2333667853934884163960473613804639007076952351877002799159275693193430810659;
    uint256 constant IC27y = 3785078667598856786773008702795019969522455372150503221006443283326628317410;
    
    uint256 constant IC28x = 12839976890362553956102705278797053112950034513934048842331320127312935396450;
    uint256 constant IC28y = 8253512538712044849601948603777578451241755766715329389705985700037598665200;
    
    uint256 constant IC29x = 16775287308856519545361833310844630130843293452348317489105682227779880762544;
    uint256 constant IC29y = 724147281458965656169728253536895230792846753330130471971487230699484975283;
    
    uint256 constant IC30x = 2593556069382462160405952110222914824028148617581735483726040044877348887378;
    uint256 constant IC30y = 6394872638076499020282796288963381910900893233318805975319923147695313444783;
    
    uint256 constant IC31x = 2635114789049332202603140578936626191065572665437195256294302222389150261088;
    uint256 constant IC31y = 15608888173773069171100451071855294959526894141944369864571374815988702086725;
    
    uint256 constant IC32x = 996301370255994601265787482632639405419630381929271596951214290028701960044;
    uint256 constant IC32y = 11642696827294792307308635169439256808764873971613766346565908904743392686597;
    
    uint256 constant IC33x = 18518437197688745829319165759345574582966343104536588776497600161788791994392;
    uint256 constant IC33y = 9211346631712929313032716867599128597310161364782987344192967000594253589705;
    
    uint256 constant IC34x = 16998299579228925076866441279891240800254704746482154132947423464687973395186;
    uint256 constant IC34y = 14286207734776132266277928981158569578370299507511790255034403974807075470582;
    
    uint256 constant IC35x = 5955847641348402166131239661800502268174079265590007364431320007458098188238;
    uint256 constant IC35y = 13797827314561451496175239995201708321612722690663229712293392254526505837311;
    
    uint256 constant IC36x = 13484944254208720181667529055787744018441570980569327075231656331555155724422;
    uint256 constant IC36y = 15442934847787466810038364897063021188564111327910468403721305253169394942182;
    
    uint256 constant IC37x = 6500148449670619638014569897737587150778007275896138862238135801686967453684;
    uint256 constant IC37y = 21243416581825134723089503961638976792032588572023909403003081781126303808526;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[37] calldata _pubSignals) public view returns (bool) {
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
                
                g1_mulAccC(_pVk, IC36x, IC36y, calldataload(add(pubSignals, 1120)))
                
                g1_mulAccC(_pVk, IC37x, IC37y, calldataload(add(pubSignals, 1152)))
                

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
            
            checkField(calldataload(add(_pubSignals, 1120)))
            
            checkField(calldataload(add(_pubSignals, 1152)))
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
