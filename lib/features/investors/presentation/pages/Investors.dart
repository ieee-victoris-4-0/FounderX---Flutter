import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:founderx/core/transitions/slide_page.dart';
import 'package:founderx/features/investors/presentation/pages/investor_profile.dart';
import 'package:founderx/features/investors/presentation/widgets/progress_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class Investors extends StatelessWidget {
  Investors({super.key});
  final List<String> images = [
    "assets/test_images/1.png",
    "assets/test_images/2.png",
    "assets/test_images/3.png",
    "assets/test_images/4.png",
    "assets/test_images/1.png",
    "assets/test_images/2.png",
    "assets/test_images/3.png",
    "assets/test_images/4.png",
    "assets/test_images/1.png",
    "assets/test_images/2.png",
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color.fromRGBO(243, 242, 242, 1),
      body: Padding(
        padding: EdgeInsets.only(
          top: size.height * 0.05,
          left: size.width * 0.05,
          right: size.width * 0.05,
        ),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Text(
                tr("investors.title"),
                style: GoogleFonts.raleway(
                  fontSize: size.width * 0.06,
                  fontWeight: FontWeight.w600,
                  color: const Color.fromRGBO(15, 15, 15, 1),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Navigator.of(context).push(SlidePageRoute(
                        page: InvestorProfile(),
                      ));
                    },
                    child: SizedBox(
                      height: size.height * 0.3,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(
                              vertical: size.height * 0.03,
                              horizontal: size.width * 0.015,
                            ),
                            height: size.height * 0.25,
                            decoration: BoxDecoration(
                              boxShadow: [
                                BoxShadow(
                                  color: Color.fromRGBO(170, 77, 232, 0.24),
                                  blurRadius: 24,
                                  offset: Offset(0, 0),
                                  spreadRadius: 0,
                                ),
                              ],

                              color: Color.fromRGBO(255, 255, 255, 1),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: Color.fromRGBO(255, 255, 255, 1),
                                width: 1,
                              ),
                            ),
                            child: Padding(
                              padding:  EdgeInsets.symmetric(vertical: size.height*0.02),
                              child: Row(
                                children: [
                                  Expanded(flex: 4, child: SizedBox.shrink()),
                                  Expanded(
                                    flex: 7,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          staticData["names"][index],
                                          style: GoogleFonts.raleway(
                                            fontSize: size.width * 0.05,
                                            fontWeight: FontWeight.w600,
                                            color: const Color.fromRGBO(
                                              15,
                                              15,
                                              15,
                                              1,
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Text(
                                              "intersted in :",
                                              style: GoogleFonts.raleway(
                                                fontSize: size.width * 0.04,
                                                fontWeight: FontWeight.w500,
                                                color: const Color.fromRGBO(
                                                  64,
                                                  63,
                                                  63,
                                                  1,
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: size.width * 0.04,
                                              child: SvgPicture.asset(
                                                (staticData["fields"][index]
                                                        as Map)
                                                    .values
                                                    .elementAt(0),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 3,
                                            ),
                                            Expanded(
                                              child: Text(
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                staticData["fields"][index].keys.elementAt(0),
                                                style: GoogleFonts.raleway(
                                                  fontSize: size.width * 0.04,
                                                  fontWeight: FontWeight.w500,
                                                  color: const Color.fromRGBO(
                                                    64,
                                                    63,
                                                    63,
                                                    1,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,                                          children: [
                                            Text("${staticData["Compatible"][index]*100}% Compatible",
                                            style: GoogleFonts.raleway(
                                              fontSize: size.width * 0.04,
                                              fontWeight: FontWeight.w500,
                                              color: const Color.fromRGBO(
                                                64,
                                                63,
                                                63,
                                                1,
                                              ),
                                            ),
                                            ),
                                          ],
                                        ),
                                        CompatibilityProgressBar(compatibility: 0.8,),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment(-0.9, -1),
                            child: SizedBox(
                              height: size.height * 0.2,
                              child: Image.asset(staticData["images"][index]),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Map staticData = {
  "images": [
    "assets/test_images/1.png",
    "assets/test_images/2.png",
    "assets/test_images/3.png",
    "assets/test_images/4.png",
    "assets/test_images/1.png",
    "assets/test_images/2.png",
    "assets/test_images/3.png",
    "assets/test_images/4.png",
    "assets/test_images/1.png",
    "assets/test_images/2.png",
  ],
  "names": [
    "John Doe",
    "Hansy Erick",
    "Gamal Hobashy",
    "John Smith",
    "Alice Johnson",
    "Emily Williams",
    "Michael Brown",
    "Sarah Davis",
    "David Wilson",
    "Linda Anderson",
  ],
  "fields": [
    {"Health Care": "assets/setUp_profile_feature/health.svg"},
    {"Education": "assets/setUp_profile_feature/techandsoftware.svg"},
    {"Fintech": "assets/setUp_profile_feature/finetech.svg"},
    {"Consumer & Lifestyle": "assets/setUp_profile_feature/consumer.svg"},
    {"Health Care": "assets/setUp_profile_feature/health.svg"},
    {"Education": "assets/setUp_profile_feature/techandsoftware.svg"},
    {"Fintech": "assets/setUp_profile_feature/finetech.svg"},
    {"Consumer & Lifestyle": "assets/setUp_profile_feature/consumer.svg"},
    {"Health Care": "assets/setUp_profile_feature/health.svg"},
    {"Education": "assets/setUp_profile_feature/techandsoftware.svg"},
  ],
  "Compatible":[
    0.7,
    0.8,
    0.96,
    0.78,
    0.8,
    0.9,
    0.68,
    0.8,
    0.6,
    0.7,
  ]
};
// [
//   {
//     "image": "assets/test_images/1.png",
//     "name": "John Doe",
//     "field": {"Health Care": "assets/setUp_profile_feature/health.svg"},
//     "compatible": 0.7
//   },
//   {
//     "image": "assets/test_images/2.png",
//     "name": "Hansy Erick",
//     "field": {"Education": "assets/setUp_profile_feature/techandsoftware.svg"},
//     "compatible": 0.8
//   },
//   {
//     "image": "assets/test_images/3.png",
//     "name": "Gamal Hobashy",
//     "field": {"Fintech": "assets/setUp_profile_feature/finetech.svg"},
//     "compatible": 0.96
//   },
//   {
//     "image": "assets/test_images/4.png",
//     "name": "John Smith",
//     "field": {"Consumer & Lifestyle": "assets/setUp_profile_feature/consumer.svg"},
//     "compatible": 0.78
//   },
//   {
//     "image": "assets/test_images/1.png",
//     "name": "Alice Johnson",
//     "field": {"Health Care": "assets/setUp_profile_feature/health.svg"},
//     "compatible": 0.8
//   },
//   {
//     "image": "assets/test_images/2.png",
//     "name": "Emily Williams",
//     "field": {"Education": "assets/setUp_profile_feature/techandsoftware.svg"},
//     "compatible": 0.9
//   },
//   {
//     "image": "assets/test_images/3.png",
//     "name": "Michael Brown",
//     "field": {"Fintech": "assets/setUp_profile_feature/finetech.svg"},
//     "compatible": 0.68
//   },
//   {
//     "image": "assets/test_images/4.png",
//     "name": "Sarah Davis",
//     "field": {"Consumer & Lifestyle": "assets/setUp_profile_feature/consumer.svg"},
//     "compatible": 0.8
//   },
//   {
//     "image": "assets/test_images/1.png",
//     "name": "David Wilson",
//     "field": {"Health Care": "assets/setUp_profile_feature/health.svg"},
//     "compatible": 0.6
//   },
//   {
//     "image": "assets/test_images/2.png",
//     "name": "Linda Anderson",
//     "field": {"Education": "assets/setUp_profile_feature/techandsoftware.svg"},
//     "compatible": 0.7
//   }
// ]

