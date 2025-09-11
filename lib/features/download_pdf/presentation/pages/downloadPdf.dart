import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:founderx/core/transitions/fade_page.dart';
import 'package:founderx/features/download_pdf/presentation/pages/loading.dart';
import 'package:google_fonts/google_fonts.dart';

class DownloadPdf extends StatelessWidget {
  const DownloadPdf({super.key});

  @override
  Widget build(BuildContext context) {
    final size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor:  Color.fromRGBO(243, 242, 242, 1),
      body: Align(
        alignment: Alignment(0, -0.7),
        child: Container(
          margin: EdgeInsets.symmetric(
            horizontal: size.width*0.08,
                    ),
          height: size.height*0.4,          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Text(
                  tr("downloadPdf.title"),
                  style: GoogleFonts.raleway(
                    fontSize: size.width*0.055,
                    fontWeight: FontWeight.w500,
                    color: const Color.fromRGBO(0, 0, 0, 1),
                  ),
                ),
              ),
              Expanded(
                flex: 5,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: size.width*0.02,
                  ),
                  margin: EdgeInsets.symmetric(
                    vertical: size.height*0.02,
                  ),
                  decoration: BoxDecoration(
                    color: const Color.fromRGBO(252, 248, 254, 1),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(size.width*0.04),
                          height: size.height*0.1,
                          decoration: BoxDecoration(
                            color: const Color.fromRGBO(181, 180, 180, 1),
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: SvgPicture.asset("assets/download_pdf/pdf.svg"),
                        ),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(
                          margin: EdgeInsets.only(
                            left: size.width*0.02,
                          ),
                          height: size.height*0.1,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text("${tr("downloadPdf.Pitch")}:",style: GoogleFonts.raleway(
                                fontSize: size.width*0.03,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                              ),),
                              Text("${tr("downloadPdf.Date_of_Analysis")}:",style: GoogleFonts.raleway(
                                fontSize: size.width*0.03,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                              ),),
                              Text("${tr("downloadPdf.Overall_Score")}:",style: GoogleFonts.raleway(
                                fontSize: size.width*0.03,
                                fontWeight: FontWeight.w600,
                                color: const Color.fromRGBO(0, 0, 0, 1),
                              ),),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child:InkWell(
                  onTap: () {
                    Navigator.of(context).push(FadePageRoute(pageBuilder: (context, animation, secondaryAnimation) => Loading()));
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(
                      vertical: size.height*0.015,
                    ),
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(153, 54, 219, 1),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Center(
                      child: Text(
                        tr("downloadPdf.btn"),
                        style: GoogleFonts.raleway(
                          fontSize: size.width*0.055,
                          fontWeight: FontWeight.w500,
                          color: const Color.fromRGBO(255, 255, 255, 1),
                        ),
                      ),
                    ),
                  ),
                )
              )
              
            ],
          ),
        ),
      )
    );
  }
}