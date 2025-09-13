import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:founderx/features/dashboard/presentation/widgets/painters/scorecontainer.dart';
import 'package:founderx/features/dashboard/presentation/widgets/scoreContainerContent.dart';
import 'package:google_fonts/google_fonts.dart';
import '../widgets/buttons.dart';
import '../widgets/painters/performancepainter.dart';
import '../widgets/painters/progresspainter.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  final Map<String, double> scores = {
    "Market": 5,
    "Team": 5,
    "Competition": 3,
    "Financials": 5,
    "Traction\n/GTM": 2,
  };
  clickedLabel clicked=clickedLabel.none;
  @override
@override
Widget build(BuildContext context) {
  final size = MediaQuery.of(context).size;
  return  SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Padding(
        padding: EdgeInsets.only(bottom: (size.height * 0.18)),
        child: Column(
          children: [
            TweenAnimationBuilder<Offset>(
              key: UniqueKey(),
              curve: Curves.elasticInOut,
              tween: Tween<Offset>(
                begin: Offset(0, -0.45),
                end: Offset(0, 0),
              ),
              duration: const Duration(seconds: 3),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(0, value.dy * size.height),
                  child: Container(
                    padding: EdgeInsets.only(top: 25),
                    width: double.infinity,
                    height: 0.35 * size.height,
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 153, 54, 219),
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(25),
                        bottomRight: Radius.circular(25),
                      ),
                    ),
                    child: LayoutBuilder(
                      builder: (context, constraints) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Flexible(
                                  child: Text(
                                    "${tr("dashboard.title")} Mansour",
                                    overflow: TextOverflow.ellipsis,
                                    softWrap: true,
                                    style: GoogleFonts.raleway(
                                      fontSize: size.width * 0.045,
                                      fontWeight: FontWeight.bold,
                                      color: Color.fromRGBO(247, 247, 247, 1),
                                    ),
                                  ),
                                ),
                                SvgPicture.asset(
                                  "assets/dashboard_feature/hand.svg",
                                  width: size.width*0.08,
                                  height: size.width*0.08,
                                ),
                              ],
                            ),
                            TweenAnimationBuilder<double>(
                              tween: Tween<double>(begin: 0, end: 0.8),
                              duration: const Duration(seconds: 4),
                              builder: (context, value, child) {
                                return CustomPaint(
                                  size: Size(
                                    constraints.maxHeight * 0.35,
                                    constraints.maxHeight * 0.35,
                                  ),
                                  painter: RingProgressPainter(value),
                                  child: SizedBox(
                                    width: constraints.maxHeight * 0.5,
                                    height: constraints.maxHeight * 0.5,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          FittedBox(
                                            fit: BoxFit.scaleDown,
                                            child: Text(
                                              "Total Score:",
                                              maxLines: 1,
                                              style: GoogleFonts.raleway(
                                                fontSize: (size.width >= 800)
                                                    ? size.width * 0.022
                                                    : size.width * 0.028,
                                                fontWeight: FontWeight.w500,
                                                color: Color.fromRGBO(247, 247, 247, 1),
                                              ),
                                            ),
                                          ),
                                          ShaderMask(
                                            shaderCallback: (bounds) => LinearGradient(
                                              begin: Alignment.topCenter,
                                              end: Alignment.bottomCenter,
                                              colors: [
                                                Color.fromRGBO(47, 229, 147, 1),
                                                Color.fromRGBO(227, 189, 253, 1),
                                              ],
                                            ).createShader(
                                              Rect.fromLTWH(0, 0, bounds.width, bounds.height),
                                            ),
                                            child: Text(
                                              "80%",
                                              style: GoogleFonts.raleway(
                                                fontSize: (size.width >= 800)
                                                    ? size.width * 0.05
                                                    : size.width * 0.06,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                            Text(
                              tr("dashboard.subtitle"),
                              textAlign: TextAlign.center,
                              style: GoogleFonts.raleway(
                                fontSize: (size.width / size.height <= 0.6)
                                    ? size.width * 0.05
                                    : size.width * 0.03,
                                fontWeight: FontWeight.bold,
                                color: Color.fromRGBO(247, 247, 247, 1),
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                );
              },
            ),
            
            // Performance Section
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Text(
                  tr("dashboard.subtitle2"),
                  style: GoogleFonts.raleway(
                    fontSize: (size.width >= 800)
                        ? size.width * 0.06
                        : size.width * 0.07,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(15, 15, 15, 1),
                  ),
                ),
              ),
            ),
            
            SizedBox(
              width: size.width,
              height: size.width,
              child: CustomPaint(
                size: Size(size.width, size.width),
                painter: PerformancePainter(scores: scores),
              ),
            ),
            
            // Insights Section
            SizedBox(height: 20),
            Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
                child: Text(
                  tr("dashboard.subtitle3"),
                  style: GoogleFonts.raleway(
                    fontSize: (size.width >= 800)
                        ? size.width * 0.06
                        : size.width * 0.07,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(15, 15, 15, 1),
                  ),
                ),
              ),
            ),
            
            // Score Cards Section
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: data.map<Widget>((item) {
                  return Padding(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.02,
                    ),
                    child: SizedBox(
                      width: size.width,
                      height: size.width * 0.7,
                      child: CustomPaint(
                        size: Size(size.width, size.width * 0.7),
                        painter: ScoreContainer(),
                        child: ScoreContainerContent(
                          title: item["title"],
                          strength: item["strength"],
                          advice: item["advice"],
                          score: (item["score"]).toDouble(),
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            ),
           ],
        ),
      ),
    );
}}
List data=[
  {
    "title":"Competitors",
    "strength":"Few localized competitors in the region.",
    "advice":"Clarify differentiation from global apps (MySugr, Omada, Fitbit).",
    "score":3,
  },
  {
    "title":"Market",
    "strength":"Big demand for chronic disease solutions",
    "advice":"Add regional health statistics for credibility",
    "score":2,
  },{
    "title":"Financials",
    "strength":"""Clear subscription-based business model.""",
    "advice":"""Show concrete revenue milestones and CAC vs LTV to validate sustainability
     sd;gsd;gk dskgdskblgds; erhoerther rtyuoerityoer reyorueyoer rtyourety sfdgjsld ryjkre
      tertyjk oretjyore jerotkyj oertj orjetkiy'kjoerto ;rt;oeo e;rtoijy oe;rtk eorti rto""",
    "score":3.25,
  }
];
