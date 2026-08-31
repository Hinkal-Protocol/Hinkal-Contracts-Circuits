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

contract mainEVMCircuit1x6x2v4 {
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
    uint256 constant deltax1 = 7158500904501446052406823620787995943381730555453509119462841678140103494134;
    uint256 constant deltax2 = 2298683615263173551919083064457052367731434605320162941103320629928546693579;
    uint256 constant deltay1 = 9848779454438178158402102367762486703785659276744661094576771464841165090995;
    uint256 constant deltay2 = 11488318509883601461778591020545442873426839683500289275200759907342766688347;

    
    uint256 constant IC0x = 2760262373275425875135410396536484504094262733513812364964512409638085589236;
    uint256 constant IC0y = 12399686918079191978223778581269489620861509630462434268107983626122484772922;
    
    uint256 constant IC1x = 10267274231379348967212637836046157751248121036068093921318558819536488300293;
    uint256 constant IC1y = 20877269300713704719763197335899579278494342900416757120525152492630585851551;
    
    uint256 constant IC2x = 15875292156538000713749945383342439174304714662411462057480999325018813208051;
    uint256 constant IC2y = 2855180929769411883917248998038589444035226489218307031499469145555019570555;
    
    uint256 constant IC3x = 19015219574797001915668126910440573167761688959418576987387184342284687746144;
    uint256 constant IC3y = 11663699913010589674565456259507762798890191585240393089901470505955031942152;
    
    uint256 constant IC4x = 16065916304997422933537552333719149355168242264770189565673624719848646174038;
    uint256 constant IC4y = 17334790864878377697927558657907159766832423074736319528215595190460264053089;
    
    uint256 constant IC5x = 14785134673176157459577843008750860576997428197945014816869269555504489051661;
    uint256 constant IC5y = 6674313809179845102416368775374602166585525839112420285001461749546719211392;
    
    uint256 constant IC6x = 6190901779283127607769702026747737429639259244655594418425460609077427611513;
    uint256 constant IC6y = 13221133343362262350083190422751020836181813634570994092895285490645587277898;
    
    uint256 constant IC7x = 13017544396294725175709325764234482138270166324899564817187459390675913518504;
    uint256 constant IC7y = 10125716532870121501504733134322669805108012229870126378481425318256579196103;
    
    uint256 constant IC8x = 12467553053332119876656101509511553759088635798430011695270647447434471007732;
    uint256 constant IC8y = 5957380581971331400201989516360995413737568885975327061564839361504513640895;
    
    uint256 constant IC9x = 17604204606352518199675397780499438700908891792002072487677355104826094397344;
    uint256 constant IC9y = 20036257567355476737925090334654792278039661999783451551219326260766020492694;
    
    uint256 constant IC10x = 1804163549267993446075871384265557452694540940494515383036699376406865487007;
    uint256 constant IC10y = 17795875676541672426233169527379698353092132164034630615022802784274794105701;
    
    uint256 constant IC11x = 10872295429654982177949525604451684919550151843402635720147762793424860667321;
    uint256 constant IC11y = 8822545703448585740050267708210386666564764766483779329816170919604192310061;
    
    uint256 constant IC12x = 15201338513434457705301466682787236372125702807722242392247131416803411499218;
    uint256 constant IC12y = 11441534894822111526213763939641983601749348288608155105394113889923611332880;
    
    uint256 constant IC13x = 7725435484452370747883422235694320679933109373975035654507404380956618617062;
    uint256 constant IC13y = 52299574103397877900178114206354106618195313621169011808499726154492612195;
    
    uint256 constant IC14x = 15582393671005434742198146520339469071148802227760956635322263102781736986814;
    uint256 constant IC14y = 11455340584423641680571154624718407338367151121999666440036903548557118997157;
    
    uint256 constant IC15x = 9020298465770417101229154402654375943922387943393473567615532812989399987281;
    uint256 constant IC15y = 2177136918591514480299560529410704364740593741749881868307506442587594590965;
    
    uint256 constant IC16x = 18799464619409422385772124045161878812949665276476634917314272432072257336771;
    uint256 constant IC16y = 21729077846110326961587985736949240417694014032066678913382022239860156154056;
    
    uint256 constant IC17x = 12787073637728068305365723317364561667887008483619661705304293297002888305557;
    uint256 constant IC17y = 4622085568917927019937117864990568001062091345660819695584703108349400873790;
    
    uint256 constant IC18x = 4016292578507738934937994475934243325079913500631201831438019609236371663717;
    uint256 constant IC18y = 10026263962920015184861852600930499500889581941314713693261631364527294175787;
    
    uint256 constant IC19x = 11393641646664906668784252864336280691955991689378360241306329139421327342540;
    uint256 constant IC19y = 17078361311053775175338458147483241192837150533872996659035161380728683905375;
    
    uint256 constant IC20x = 11029886472992981662477609327751538508407564447528665141163646190108448137489;
    uint256 constant IC20y = 3161402456243838826543151726946414813123030662128896137265518604095537890065;
    
 
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
