import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:founderx/features/investors/presentation/widgets/pagebar.dart';
import 'package:founderx/features/investors/presentation/widgets/progress_bar.dart';
import 'package:google_fonts/google_fonts.dart';

class InvestorProfile extends StatelessWidget {
   InvestorProfile({super.key});
  final List<String> svgs=[
    "assets/investors_features/email.svg",
    "assets/investors_features/phone.svg",
    "assets/investors_features/share.svg",
  ];
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: SizedBox(
              width: double.infinity,
              child: SvgPicture.asset(
                "assets/investors_features/investot_background.svg",
                fit: BoxFit.cover,
              ),
            ),
          ),
          Align(alignment: Alignment(0, -0.9), child: InvestorPageBar()),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.03),
            child: Align(
              alignment: Alignment(0, 1),
              child: SizedBox(
                height: size.height * 0.8,
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "89% Compatible",
                            style: GoogleFonts.raleway(
                              fontSize: size.width * 0.06,
                              fontWeight: FontWeight.w600,
                              color: const Color.fromRGBO(15, 15, 15, 1),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: CompatibilityProgressBar(compatibility: 0.89),
                    ),
                    Expanded(
                      flex: 6,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Container(
                              alignment: Alignment.centerLeft,
                              child: Image.asset(investorData["image"]),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Container(
                              padding: EdgeInsets.only(left: size.width * 0.02),
                              alignment: Alignment.centerLeft,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    investorData["name"],
                                    style: GoogleFonts.raleway(
                                      fontSize: size.width * 0.06,
                                      fontWeight: FontWeight.w600,
                                      color: const Color.fromRGBO(
                                        15,
                                        15,
                                        15,
                                        1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: size.height * 0.02),
                                  Text(
                                    investorData["role"],
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
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              flex: 1,
                              child: Text(
                                "Interested in:",
                                style: GoogleFonts.raleway(
                                  fontSize: size.width * 0.06,
                                  fontWeight: FontWeight.w600,
                                  color: const Color.fromRGBO(15, 15, 15, 1),
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 6,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount:
                                    (investorData["field"] as Map).length,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                      vertical: size.height * 0.01,
                                    ),
                                    child: Row(
                                      children: [
                                        SvgPicture.asset(
                                          (investorData["field"] as Map).values
                                              .elementAt(index),
                                        ),
                                        SizedBox(width: size.width * 0.02),
                                        Text(
                                          (investorData["field"] as Map).keys
                                              .elementAt(index),
                                          style: GoogleFonts.raleway(
                                            fontSize: size.width * 0.05,
                                            fontWeight: FontWeight.w600,
                                            color: const Color.fromRGBO(
                                              19,
                                              22,
                                              12,
                                              1,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(flex: 3, child:Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: svgs.map((e) => Container(
                      child: SvgPicture.asset(e,
                      width: size.width*0.25,
                      )
                      )).toList(),

                    )),

                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

final Map<String, dynamic> investorData = {
  "name": "John Doe",
  "image": "assets/test_images/1.png",
  "role": "CEO & Founder of Talabat",
  "field": {
    "Health Care": "assets/setUp_profile_feature/health.svg",
    "Education": "assets/setUp_profile_feature/techandsoftware.svg",
    "Consumer & Lifestyle": "assets/setUp_profile_feature/consumer.svg",
  },
  "compatible": 0.89,
  "contact": {
    "phone": "+20123456789",
    "email": "john.doe@gmail.com",
    "linkedin": "https://www.linkedin.com/in/john-doe/",
    "twitter": "https://twitter.com/johndoe",
    "instagram": "https://www.instagram.com/johndoe/",
  },
};
