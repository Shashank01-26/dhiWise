library home_page;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhiwise_assignment/MultiDataProgressBar.dart';
// import 'package:page_view_indicators/page_view_indicators.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'dart:async';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

part 'model.dart';

class MyHomePageBuilder extends StatelessWidget {
  MyHomePageBuilder({super.key});
  final _HomeScreenModel _model = _HomeScreenModel();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<_Data>(
        future: _model.init(),
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: SizedBox(
                  height: 200,
                  width: 200,
                  child: const CircularProgressIndicator()),
            );
          } else if (data != null) {
            return _MyHomePage(
              data: data,
              model: _model,
            );
          }
          return const Text('Error');
        },
      ),
    );
  }
}

class _MyHomePage extends StatefulWidget {
  final _Data data;
  final _HomeScreenModel model;
  const _MyHomePage({super.key, required this.data, required this.model});

  @override
  State<_MyHomePage> createState() => __MyHomePageState();
}

class __MyHomePageState extends State<_MyHomePage> with SingleTickerProviderStateMixin {
  int _currentPage = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animateProgressBars();
  }

  void _animateProgressBars() {
    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: const BoxDecoration(
            color: Color.fromARGB(255, 45, 44, 121),
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(50.0),
                topRight: Radius.circular(50.0))),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15),
                child: SizedBox(
                  height: MediaQuery.of(context).size.height * 0.50,
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Stack(
                      children: [
                        PageView(
                          controller: widget.model.pageViewController ??=
                              PageController(initialPage: 0),
                          scrollDirection: Axis.horizontal,
                          children: [
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 20.0),
                                  child: Text("Buy a dream house",
                                      style: TextStyle(
                                        fontFamily:
                                            GoogleFonts.openSans().fontFamily,
                                        color: const Color.fromARGB(
                                            255, 255, 255, 255),
                                        fontSize: 25.0,
                                        decoration: TextDecoration.none,
                                      )),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 50),
                                  child: Stack(children: [
                                    Center(
                                      child: Column(
                                        children: [
                                          const Icon(
                                            Icons.home,
                                            size: 200.0,
                                            color: Colors.white,
                                          ),
                                          Text("\$" + widget.data.you_saved.toString(),
                                              style: TextStyle(
                                                fontFamily:
                                                    GoogleFonts.openSans()
                                                        .fontFamily,
                                                color: Color.fromARGB(
                                                    255, 255, 255, 255),
                                                fontSize: 20.0,
                                                decoration: TextDecoration.none,
                                              )),
                                          Text("Saved",
                                              style: TextStyle(
                                                fontFamily:
                                                    GoogleFonts.openSans()
                                                        .fontFamily,
                                                color: const Color.fromARGB(
                                                    197, 255, 255, 255),
                                                fontSize: 18.0,
                                                decoration: TextDecoration.none,
                                                fontWeight: FontWeight.w300,
                                              ))
                                        ],
                                      ),
                                    ),
                                    Center(
                                      child: SizedBox(
                                        height: 300.0,
                                        width: 300.0,
                                        child: CircularPercentIndicator(
                                          radius: 150,
                                          lineWidth: 10.0,
                                          percent: (widget.data.you_saved/widget.data.goal_amount),
                                          backgroundColor: Colors.white,
                                          progressColor: Colors.blue,
                                          animateFromLastPercent: true,
                                          animation: true,
                                          animationDuration: 1400,
                                          curve: Curves.easeInOut,
                                          circularStrokeCap: CircularStrokeCap.round,
                                        ),
                                      ),
                                    )
                                  ]),
                                )
                              ],
                            ),
                            for (int i = 0; i < 3; i++) _comingSoon()
                          ],
                          onPageChanged: (int index) {
                            setState(() {
                              _currentPage = index;
                            });
                          },
                        ),
                        Positioned(
                          bottom: 10.0,
                          left: 0.0,
                          right: 0.0,
                          child: DotsIndicator(
                            dotsCount: 4,
                            position: _currentPage,
                            decorator: DotsDecorator(
                              size: const Size.square(8.0),
                              activeSize: const Size(20.0, 8.0),
                              activeShape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text("Goal",
                          style: TextStyle(
                            fontFamily: GoogleFonts.openSans().fontFamily,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize: 22.0,
                            decoration: TextDecoration.none,
                          )),
                      Text("Target timeline",
                          style: TextStyle(
                            fontFamily: GoogleFonts.openSans().fontFamily,
                            color: Color.fromARGB(255, 140, 140, 140),
                            fontWeight: FontWeight.w300,
                            fontSize: 13.0,
                            decoration: TextDecoration.none,
                          )),
                    ],
                  ),
                  Text("\$" + widget.data.goal_amount.toString(),
                      style: TextStyle(
                        fontFamily: GoogleFonts.openSans().fontFamily,
                        color: Color.fromARGB(255, 255, 255, 255),
                        fontSize: 22.0,
                        decoration: TextDecoration.none,
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * 0.15,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 60, 86, 243),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(
                        10.0, 25, 10.0, 25.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Need more savings",
                              style: TextStyle(
                                fontFamily: GoogleFonts.openSans().fontFamily,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18.0,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "\$" + (widget.data.goal_amount - widget.data.you_saved).toString(),
                              style: TextStyle(
                                fontFamily: GoogleFonts.openSans().fontFamily,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18.0,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 5.0),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Monthly Saving Projection",
                              style: TextStyle(
                                fontFamily: GoogleFonts.openSans().fontFamily,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18.0,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            Text(
                              "\$" + widget.data.monthly_saving_pro.toString(),
                              style: TextStyle(
                                fontFamily: GoogleFonts.openSans().fontFamily,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize: 18.0,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50.0),
                      topRight: Radius.circular(50.0)),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(
                      40.0, 40.0, 40.0, 20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Contributions",
                            style: TextStyle(
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              color: Color.fromARGB(255, 6, 23, 77),
                              fontSize: 18.0,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "Show History",
                            style: TextStyle(
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              color: Color.fromARGB(224, 17, 36, 79),
                              fontSize: 18.0,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10.0),
                      Stack(
                        children: [
                          // AnimatedBuilder(
                          //   animation: _animationController,
                          //   builder: (context, child){
                          //     return LinearProgressIndicator(
                          //       borderRadius: BorderRadius.circular(60.0),
                          //       minHeight: 20.0,
                          //       value: widget.data.bonus.toDouble() * _animationController.value,
                          //       backgroundColor: Colors.transparent,
                          //       color: Colors.yellow,
                          //     );
                          //   },
                          // ),
                          // AnimatedBuilder(
                          //   animation: _animationController,
                          //   builder: (context, child) {
                          //     return LinearProgressIndicator(
                          //       borderRadius: BorderRadius.circular(60.0),
                          //       minHeight: 20.0,
                          //       value: widget.data.savings.toDouble() * _animationController.value,
                          //       backgroundColor: Colors.transparent,
                          //       color: Colors.greenAccent[200],
                          //     );
                          //   },
                          // ),
                          // AnimatedBuilder(
                          //     animation: _animationController,
                          //     builder: (context, child) {
                          //       return LinearProgressIndicator(
                          //         borderRadius: BorderRadius.circular(60.0),
                          //         minHeight: 20.0,
                          //         value: widget.data.monthly_salary.toDouble() * _animationController.value,
                          //         backgroundColor: Colors.transparent,
                          //         color: Colors.blue,
                          //       );
                          //     }
                          // ),
                          // LinearPercentIndicator(
                          //   fillColor: Colors.white,
                          //   progressColor: Colors.blue,
                          //   lineHeight: 25.0,
                          //   animationDuration: 1200,
                          //   animation: true,
                          //   percent: (widget.data.monthly_salary/(widget.data.bonus + widget.data.savings)),
                          // ),
                          MultiDataLinearProgressBar(
                            dataPoints: [
                              DataPoint(value: (widget.data.monthly_salary).toDouble(), color: Colors.blue),
                              DataPoint(value: (widget.data.savings).toDouble(), color: Colors.green),
                              DataPoint(value: (widget.data.bonus).toDouble(), color: Colors.yellow),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                           Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius: 10,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  "Monthly Salary",
                                  style: TextStyle(
                                    fontFamily:
                                    GoogleFonts.openSans().fontFamily,
                                    color: Color.fromARGB(224, 17, 36, 79),
                                    fontSize: 18.0,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              )
                            ],
                          ),
                          Text(
                            "\$" + widget.data.monthly_salary.toString(),
                            style: TextStyle(
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              color: Color.fromARGB(224, 17, 36, 79),
                              fontSize: 18.0,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.yellowAccent,
                                radius: 10,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  "Bonus",
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.openSans().fontFamily,
                                    color: Color.fromARGB(224, 17, 36, 79),
                                    fontSize: 18.0,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "\$" + widget.data.bonus.toString(),
                            style: TextStyle(
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              color: Color.fromARGB(224, 17, 36, 79),
                              fontSize: 18.0,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.green,
                                radius: 10,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    8.0, 0.0, 0.0, 0.0),
                                child: Text(
                                  "Savings",
                                  style: TextStyle(
                                    fontFamily:
                                        GoogleFonts.openSans().fontFamily,
                                    color: Color.fromARGB(224, 17, 36, 79),
                                    fontSize: 18.0,
                                    decoration: TextDecoration.none,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "\$" + widget.data.savings.toString(),
                            style: TextStyle(
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              color: Color.fromARGB(224, 17, 36, 79),
                              fontSize: 18.0,
                              decoration: TextDecoration.none,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _comingSoon() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "Coming Soon!!!",
            style: TextStyle(
              fontFamily: GoogleFonts.openSans().fontFamily,
              color: const Color.fromARGB(255, 255, 255, 255),
              fontSize: 30.0,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w300,
            ),
          ),
          Text(
            "Stay Tuned",
            style: TextStyle(
              fontFamily: GoogleFonts.openSans().fontFamily,
              color: const Color.fromARGB(192, 255, 255, 255),
              fontSize: 20.0,
              decoration: TextDecoration.none,
              fontWeight: FontWeight.w300,
            ),
          ),
        ],
      ),
    );
  }
}
