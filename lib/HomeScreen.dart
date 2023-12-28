import 'package:dhiwise_assignment/HomeScreenModel.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late HomeScreenModel _model;

  @override
  void initState(){
    super.initState();
    _model = HomeScreenModel();
  }

  @override
  void dispose(){
    _model.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 3),
      child: Container(
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: Colors.deepPurple[900],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50.0),
            topRight: Radius.circular(50.0)
          )
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
             Padding(
               padding: const EdgeInsets.only(top:15),
               child: Container(
                 height:MediaQuery.of(context).size.height * 0.75,
                 child: Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: PageView(
                     // pageSnapping: true,
                     controller: _model.pageViewController ??=
                         PageController(initialPage: 0),
                     scrollDirection: Axis.horizontal,
                     children: [
                       Column(
                         children: [
                           Text(
                               "This is the head for First Text",
                             style:TextStyle(
                               fontFamily: GoogleFonts.openSans().fontFamily,
                               color: Color.fromARGB(255, 255, 255, 255),
                               fontSize: 25.0,
                               decoration: TextDecoration.none,
                             )
                           ),
                           ClipRRect(
                             borderRadius: BorderRadius.circular(8),
                             child: Text(
                                 "This is First Screen",
                                 style:TextStyle(
                                   fontFamily: GoogleFonts.openSans().fontFamily,
                                   color: Color.fromARGB(255, 255, 255, 255),
                                 ),
                             ),
                           ),
                         ],
                       ),
                       ClipRRect(
                         borderRadius: BorderRadius.circular(8),
                         child: Text("This is Second Screen"),
                       ),
                     ],
                   ),
                   //NEED TO ADD DOTS FOR PAGE NUMBERING
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
                     Text(
                         "Goal",
                     style:TextStyle(
                       fontFamily: GoogleFonts.openSans().fontFamily,
                       color: Color.fromARGB(255, 255, 255, 255),
                       fontSize:22.0,
                       decoration: TextDecoration.none,
                     )
                     ),
                     Text(
                         "Target timeline",
                         style:TextStyle(
                           fontFamily: GoogleFonts.openSans().fontFamily,
                           color: Color.fromARGB(255, 140, 140, 140),
                           fontWeight: FontWeight.w300,
                           fontSize: 13.0,
                           decoration: TextDecoration.none,
                         )
                     ),
                   ],
                 ),
                 Text(
                     "\$50,000",
                     style:TextStyle(
                       fontFamily: GoogleFonts.openSans().fontFamily,
                       color: Color.fromARGB(255, 255, 255, 255),
                       fontSize:22.0,
                       decoration: TextDecoration.none,
                     )
                 ),
               ],
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  height:MediaQuery.of(context).size.height * 0.15,
                  decoration: const BoxDecoration(
                    color: Colors.blueAccent,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Padding(
                    padding: const EdgeInsetsDirectional.fromSTEB(10.0,25,10.0,25.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                          "Need more savings",
                          style:TextStyle(
                            fontFamily: GoogleFonts.openSans().fontFamily,
                            color: Color.fromARGB(255, 255, 255, 255),
                            fontSize:18.0,
                            decoration: TextDecoration.none,
                            fontWeight: FontWeight.w400,
                          ),),
                          Text(
                            "\$25,000",
                            style:TextStyle(
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontSize:18.0,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400,
                            ),),
                        ],
                      ),
                        SizedBox(height: 5.0),
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Monthly Saving Projection",
                              style:TextStyle(
                                fontFamily: GoogleFonts.openSans().fontFamily,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize:18.0,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400,
                              ),),
                            Text(
                              "\$250",
                              style:TextStyle(
                                fontFamily: GoogleFonts.openSans().fontFamily,
                                color: Color.fromARGB(255, 255, 255, 255),
                                fontSize:18.0,
                                decoration: TextDecoration.none,
                                fontWeight: FontWeight.w400,
                              ),),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height:MediaQuery.of(context).size.height,
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50.0),
                  topRight: Radius.circular(50.0)
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(40.0,40.0,40.0,20.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children:[
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Contributions",
                            style:TextStyle(
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              color: Color.fromARGB(255, 6, 23, 77),
                              fontSize:18.0,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.bold,
                            ),),
                          Text(
                            "Show History",
                            style:TextStyle(
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              color: Color.fromARGB(224, 17, 36, 79),
                              fontSize:18.0,
                              decoration: TextDecoration.none,
                              fontWeight: FontWeight.w400,
                            ),),
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
}