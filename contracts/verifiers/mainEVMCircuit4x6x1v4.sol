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

contract mainEVMCircuit4x6x1v4 {
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
    uint256 constant deltax1 = 9682281105165706146308376314235271535296445437728962234978125079407922507403;
    uint256 constant deltax2 = 15789627787898820181762598434149167831975854605424423589358919752860566088986;
    uint256 constant deltay1 = 6845101508809735663983600588932442710941883051589445042585207776395964351150;
    uint256 constant deltay2 = 16147475741536285121971568324629050955359172319404168152784146405455322159739;

    
    uint256 constant IC0x = 9287028649834539119792934880940715703141169203510582629802366915237870117823;
    uint256 constant IC0y = 2921442765678100266865729584179582899857655563008264871982758403098272777768;
    
    uint256 constant IC1x = 685085689770816210741986004532694336442320232977814685847140541081259123503;
    uint256 constant IC1y = 892706737033462575016887683768824788343561828772777833446119045374464877233;
    
    uint256 constant IC2x = 20837922986140449746975640049584523124565624969325701500452225752279625695738;
    uint256 constant IC2y = 18009607861923553519537733812389725537748613201996757099926604735491994695059;
    
    uint256 constant IC3x = 11379163716380804881288254295409364617190839383927756487704489682437081489470;
    uint256 constant IC3y = 15529009798259157789587469510561014280449819151429277132364464000339772668522;
    
    uint256 constant IC4x = 10742516227045738188367694413671602350518302997956934038637256491053997366445;
    uint256 constant IC4y = 6876314337315523899605283853969731809328623339332110715256772190479872311188;
    
    uint256 constant IC5x = 5041805840820585779146348560604538597355196404519995155596324264642324134725;
    uint256 constant IC5y = 5309065446288374654855644281342697096693880532474535843517381516381225692486;
    
    uint256 constant IC6x = 20100937275366077001906809941549399519310873548712988049397265991800744282640;
    uint256 constant IC6y = 15032826608487573537494571477765983836925055901425223488869389561661768190157;
    
    uint256 constant IC7x = 20189679506971584260439456227780657425244633018386070646790007390037051193203;
    uint256 constant IC7y = 11814953298805422171825358778780084398816991042837151798374775757995451070111;
    
    uint256 constant IC8x = 21442061507762461832750023214942507336659891125899520060274145824789028197475;
    uint256 constant IC8y = 20080545410285391115491698178270891915038974389210647822310215344941920628784;
    
    uint256 constant IC9x = 14477122308831616433770124760203753634797861492199525765097174806631782095510;
    uint256 constant IC9y = 18717160532420265660543458883119059746563043390295426561729623352006576734009;
    
    uint256 constant IC10x = 14813914690493688350343374677353861327516694695441304236715754521803131639929;
    uint256 constant IC10y = 7355064497987709036841560112590522906873777470527315987765490544216354807746;
    
    uint256 constant IC11x = 3473134825955064811546380777279823448858731524917221394949436816291962051777;
    uint256 constant IC11y = 953940571855659277867447467697442081202480865393844724033681343523654745408;
    
    uint256 constant IC12x = 12091694304410540044848486583574941558200664850936608842575511113720816536385;
    uint256 constant IC12y = 18632138018671676626691545777299980431479775695594368259046612796891226200451;
    
    uint256 constant IC13x = 8790078113103215773756868726322957816215478157837493000196533306371297088298;
    uint256 constant IC13y = 15097394245005999739272162814463132277628222603555233544203872290300158179129;
    
    uint256 constant IC14x = 18819975747899438709669463156531424156733888304237657559788545904731880464957;
    uint256 constant IC14y = 997572311370771399070327758843972256933699647899621180083293320547187955606;
    
    uint256 constant IC15x = 17148991243737772743876475600775014706107007800059556133818383597602641809861;
    uint256 constant IC15y = 10411430570748089527902762975431242004350354462526147641152124449675469180304;
    
    uint256 constant IC16x = 11501183177976058291315232916670430818381544206187938722914691766134864620954;
    uint256 constant IC16y = 365081154609861110146454862245423242993543926479551474608480766876204593373;
    
    uint256 constant IC17x = 5404935937419144737675574436548148097689046349969970619150990327359586095882;
    uint256 constant IC17y = 1447465800102886755392600315191820750950555386991067666545521456039668874362;
    
    uint256 constant IC18x = 3607266444774900395277841537088730652116480414427952743548894488585329131977;
    uint256 constant IC18y = 10735306097066533017031628856122720896062904724628070113049576101013542281554;
    
    uint256 constant IC19x = 1865034528338614429054149637153606346679042077774821276875099684983693155091;
    uint256 constant IC19y = 2354955237526795990452655296941126306093526020709403247561941558538587052927;
    
    uint256 constant IC20x = 11771470249580965321969201888831393277185379938661995234254319752439741261470;
    uint256 constant IC20y = 4673713849269247050891195561014701003263014532357657818827862784056580882000;
    
    uint256 constant IC21x = 13968652568536898679177736035814726330416319837672591600080751954168551265979;
    uint256 constant IC21y = 7047009747150028020109461949892524914614400061932049006524950722894181927274;
    
    uint256 constant IC22x = 13936367422224350298069788798552505780296932520166776853477438180503793661213;
    uint256 constant IC22y = 18406051610917626895300258448428106649141736745120888828693033821638269344337;
    
    uint256 constant IC23x = 157869847823243343058790768582904197057798486475401502924168467822998790371;
    uint256 constant IC23y = 1551126833909548252467772953588370601209772812792172089696494208996364878886;
    
    uint256 constant IC24x = 10132512006179088919551432845446187808346536200997021838830295745933793411287;
    uint256 constant IC24y = 20493368866862572809821259992075222790264217585361369747203609910854910846529;
    
    uint256 constant IC25x = 8361261858820387864693203016616469923394139188907819247987586641625523115777;
    uint256 constant IC25y = 4786447138242982559298462124306495339388948562207826034378390652388235760786;
    
    uint256 constant IC26x = 13754520609280660015922871589899965883664175514522381327835709318781767395321;
    uint256 constant IC26y = 11183170249511156226547385259424439789160509309246137395373905426199927916547;
    
    uint256 constant IC27x = 11214274417544578750101963518326131558333163151439391359494613169020307341720;
    uint256 constant IC27y = 11613894272973434189492974632338920651687975906783563904730246617846952530804;
    
    uint256 constant IC28x = 12000371208487638891056857159459307260122256756497654988563459760836599598092;
    uint256 constant IC28y = 1669794813688409508380679208277454400687600122315898974237034423712328859013;
    
    uint256 constant IC29x = 1073252900846278352119613793912219192093887145025302367453570061593047811204;
    uint256 constant IC29y = 18697493682553890917894031103973812643236961887168394697258725674276268469035;
    
    uint256 constant IC30x = 9502677668654190146846427275905150993364516754609711662749606678186934551859;
    uint256 constant IC30y = 3633231651435183474633692915748176631042127526931688709006223029243004439116;
    
    uint256 constant IC31x = 7249217839641242694882493172582177540971519425600424322098860319982361905753;
    uint256 constant IC31y = 20436849876698986544141079349064182148736614785216064918165659042020781965988;
    
    uint256 constant IC32x = 8387902803609125757719826978865570276624065511613880016635821958767446428723;
    uint256 constant IC32y = 1903856983781459252978010585873197691078096490165336892887211555857367761655;
    
    uint256 constant IC33x = 3767220250838693733660865624008068197762769230605486369384690744375081348082;
    uint256 constant IC33y = 9651928246685120589498847954683485495570210744672519679282947735991733946362;
    
    uint256 constant IC34x = 8643298312589055107493845950838157351075769805779101954391281556246331260950;
    uint256 constant IC34y = 17988790508550759021471163618021758382463253436266780918581581535243454502272;
    
    uint256 constant IC35x = 3195210038028538422235669982368744229276227049333621250880032570930107760894;
    uint256 constant IC35y = 14848348494565210660994536243638959961783151879411808977156310074780663778097;
    
    uint256 constant IC36x = 16306925295992757783727364944157637398948435384551084557185119224933341798369;
    uint256 constant IC36y = 2035135886169509436077993347255054623658329700087550679503735839878296871244;
    
    uint256 constant IC37x = 21014022635163288618421806725671350391865786193493373149628471760806651351106;
    uint256 constant IC37y = 2570651987870487340201173353632514617485999869823037053557986101525220471648;
    
    uint256 constant IC38x = 19171102954170622990185369989187670697346835031128393945433836648645616641946;
    uint256 constant IC38y = 12169138872191339516428810764380799332829669802082339251108799592163457902563;
    
    uint256 constant IC39x = 5727361670046498371918621193157389937478431753878210679700590311326072341372;
    uint256 constant IC39y = 17449175624641229671841383123820707827223639568815872914313662880106457936992;
    
    uint256 constant IC40x = 11965899926090093707039981874229013626218075119012108012191608943281606515311;
    uint256 constant IC40y = 938814173830048039715939829264849746899471990615578063409041185510952063354;
    
    uint256 constant IC41x = 7634504280043939355828944683377187357891794826309671948318419725563470512186;
    uint256 constant IC41y = 4812382382228065974369514314301528654712348183502408791241794467549213527053;
    
    uint256 constant IC42x = 8566690590896930189865280928857143265063816686952703196379309091843796798418;
    uint256 constant IC42y = 4499835814844849331504272284400945645174341462366384425170897056685166499582;
    
    uint256 constant IC43x = 3236266924110700432441982957976533288266381526149347077724683700907119299010;
    uint256 constant IC43y = 3742218920714142627249130098447645867383614542072379901913860196933361366382;
    
    uint256 constant IC44x = 13116641322650446568227981145980728969824940165753220710633958453309377024688;
    uint256 constant IC44y = 2899908935920257905083050777112202584684285463039197576883516903939592531108;
    
    uint256 constant IC45x = 3512121463308020974726254701405495204634087529612293545186009676867335666348;
    uint256 constant IC45y = 2834550134511304439196595063999455385296594746891534160909494183101048426546;
    
    uint256 constant IC46x = 6427240353390809025369613034758834911722990042625053118193942457350970141308;
    uint256 constant IC46y = 12723449980605100422470376224871831707978546953754761128548102990463247550167;
    
 
    // Memory data
    uint16 constant pVk = 0;
    uint16 constant pPairing = 128;

    uint16 constant pLastMem = 896;

    function verifyProof(uint[2] calldata _pA, uint[2][2] calldata _pB, uint[2] calldata _pC, uint[46] calldata _pubSignals) public view returns (bool) {
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
                
                g1_mulAccC(_pVk, IC38x, IC38y, calldataload(add(pubSignals, 1184)))
                
                g1_mulAccC(_pVk, IC39x, IC39y, calldataload(add(pubSignals, 1216)))
                
                g1_mulAccC(_pVk, IC40x, IC40y, calldataload(add(pubSignals, 1248)))
                
                g1_mulAccC(_pVk, IC41x, IC41y, calldataload(add(pubSignals, 1280)))
                
                g1_mulAccC(_pVk, IC42x, IC42y, calldataload(add(pubSignals, 1312)))
                
                g1_mulAccC(_pVk, IC43x, IC43y, calldataload(add(pubSignals, 1344)))
                
                g1_mulAccC(_pVk, IC44x, IC44y, calldataload(add(pubSignals, 1376)))
                
                g1_mulAccC(_pVk, IC45x, IC45y, calldataload(add(pubSignals, 1408)))
                
                g1_mulAccC(_pVk, IC46x, IC46y, calldataload(add(pubSignals, 1440)))
                

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
            
            checkField(calldataload(add(_pubSignals, 1184)))
            
            checkField(calldataload(add(_pubSignals, 1216)))
            
            checkField(calldataload(add(_pubSignals, 1248)))
            
            checkField(calldataload(add(_pubSignals, 1280)))
            
            checkField(calldataload(add(_pubSignals, 1312)))
            
            checkField(calldataload(add(_pubSignals, 1344)))
            
            checkField(calldataload(add(_pubSignals, 1376)))
            
            checkField(calldataload(add(_pubSignals, 1408)))
            
            checkField(calldataload(add(_pubSignals, 1440)))
            

            // Validate all evaluations
            let isValid := checkPairing(_pA, _pB, _pC, _pubSignals, pMem)

            mstore(0, isValid)
             return(0, 0x20)
         }
     }
 }
