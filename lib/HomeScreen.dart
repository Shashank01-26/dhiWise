import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dhiwise_assignment/HomeScreenModel.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_view_indicators/page_view_indicators.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  late HomeScreenModel _model;
  final _pageController = PageController();
  int _currentPage = 0;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState(){
    super.initState();
    getData();
    _model = HomeScreenModel();
  }

  @override
  void dispose(){
    _model.dispose();
    super.dispose();
  }

  final Stream<QuerySnapshot> data = FirebaseFirestore.instance.collection("goals").snapshots();

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
                 height:MediaQuery.of(context).size.height * 0.55,
                 child: Padding(
                   padding: const EdgeInsets.all(20.0),
                   child: Stack(
                     children: [
                       PageView(
                         // pageSnapping: true,
                         controller: _model.pageViewController ??=
                             PageController(initialPage: 0),
                         scrollDirection: Axis.horizontal,
                         children: [
                           Column(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.only(top:15.0),
                                 child: Text(
                                     "Buy a dream house",
                                     style:TextStyle(
                                       fontFamily: GoogleFonts.openSans().fontFamily,
                                       color: Color.fromARGB(255, 255, 255, 255),
                                       fontSize: 25.0,
                                       decoration: TextDecoration.none,
                                     )
                                 ),
                               ),
                               Padding(
                                 padding: const EdgeInsets.only(top:30),
                                 child: Stack(
                                   children:[
                                     Padding(
                                       padding: const EdgeInsets.only(left:25),
                                       child: Column(
                                         children: [
                                           const Icon(
                                             Icons.home,
                                             size: 300.0,
                                             color: Colors.white,
                                           ),
                                           Text(
                                               "\$25,000",
                                               style:TextStyle(
                                                 fontFamily: GoogleFonts.openSans().fontFamily,
                                                 color: Color.fromARGB(255, 255, 255, 255),
                                                 fontSize: 20.0,
                                                 decoration: TextDecoration.none,
                                               )
                                           ),
                                           Text(
                                               "Saved",
                                               style:TextStyle(
                                                 fontFamily: GoogleFonts.openSans().fontFamily,
                                                 color:const Color.fromARGB(
                                                     197, 255, 255, 255),
                                                 fontSize: 18.0,
                                                 decoration: TextDecoration.none,
                                                 fontWeight: FontWeight.w300,
                                               )
                                           )
                                         ],
                                       ),
                                     ),
                                     Padding(
                                       padding: const EdgeInsets.only(top: 20),
                                       child: SizedBox(
                                         height:350.0,
                                         width:350.0,
                                         child: CircularProgressIndicator(
                                           value: 0.35,
                                           valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent[700]!),
                                           strokeWidth: 14.0,
                                           backgroundColor: Colors.white,
                                           strokeCap: StrokeCap.round,
                                         ),
                                       ),
                                     )
                                   ]
                                 ),
                               )
                             ],
                           ),
                           Center(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(
                                   "Coming Soon!!!",
                                      style: TextStyle(
                                        fontFamily: GoogleFonts.openSans().fontFamily,
                                        color:const Color.fromARGB(
                                            255, 255, 255, 255),
                                        fontSize: 30.0,
                                        decoration: TextDecoration.none,
                                        fontWeight: FontWeight.w300,
                                      ),
                                 ),
                                 Text(
                                   "Stay Tuned",
                                   style: TextStyle(
                                     fontFamily: GoogleFonts.openSans().fontFamily,
                                     color:const Color.fromARGB(
                                         192, 255, 255, 255),
                                     fontSize: 20.0,
                                     decoration: TextDecoration.none,
                                     fontWeight: FontWeight.w300,
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           Center(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(
                                   "Coming Soon!!!",
                                   style: TextStyle(
                                     fontFamily: GoogleFonts.openSans().fontFamily,
                                     color:const Color.fromARGB(
                                         255, 255, 255, 255),
                                     fontSize: 30.0,
                                     decoration: TextDecoration.none,
                                     fontWeight: FontWeight.w300,
                                   ),
                                 ),
                                 Text(
                                   "Stay Tuned",
                                   style: TextStyle(
                                     fontFamily: GoogleFonts.openSans().fontFamily,
                                     color:const Color.fromARGB(
                                         192, 255, 255, 255),
                                     fontSize: 20.0,
                                     decoration: TextDecoration.none,
                                     fontWeight: FontWeight.w300,
                                   ),
                                 ),
                               ],
                             ),
                           ),
                           Center(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Text(
                                   "Coming Soon!!!",
                                   style: TextStyle(
                                     fontFamily: GoogleFonts.openSans().fontFamily,
                                     color:const Color.fromARGB(
                                         255, 255, 255, 255),
                                     fontSize: 30.0,
                                     decoration: TextDecoration.none,
                                     fontWeight: FontWeight.w300,
                                   ),
                                 ),
                                 Text(
                                   "Stay Tuned",
                                   style: TextStyle(
                                     fontFamily: GoogleFonts.openSans().fontFamily,
                                     color:const Color.fromARGB(
                                         192, 255, 255, 255),
                                     fontSize: 20.0,
                                     decoration: TextDecoration.none,
                                     fontWeight: FontWeight.w300,
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ],
                         onPageChanged: (int index){
                          setState((){
                            _currentPage = index;
                          });
                         },
                       ),
                       Positioned(
                           bottom: 10.0,
                           left: 0.0,
                           right: 0.0,
                           child:DotsIndicator(
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
                    color: Color.fromARGB(255, 60, 86, 243),
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
                   const SizedBox(height:10.0),
                   Stack(
                    children: [
                      LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(60.0),
                        minHeight: 20.0,
                        value: 0.85,
                        backgroundColor: Colors.transparent,
                        color:Colors.yellow,
                      ),
                      LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(60.0),
                        minHeight: 20.0,
                        value: 0.75,
                        backgroundColor: Colors.transparent,
                        color: Colors.greenAccent[200],
                      ),
                      LinearProgressIndicator(
                        borderRadius: BorderRadius.circular(60.0),
                        minHeight: 20.0,
                        value: 0.5,
                        backgroundColor: Colors.transparent,
                        color: Colors.blue,
                      ),
                    ],
                  ),
                      SizedBox(height:20),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.blue,
                                radius:10,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(8.0,0.0,0.0,0.0),
                                child: StreamBuilder<QuerySnapshot>(
                                  stream: data,
                                  builder: (
                                      BuildContext context,
                                      AsyncSnapshot<QuerySnapshot> snapshot,
                                  ){
                                    if(snapshot.hasError){
                                      return Text("Something went wrong");
                                    }
                                    if(snapshot.connectionState == ConnectionState.waiting){
                                      return CircularProgressIndicator();
                                    }
                                    final datA = snapshot.requireData;
                                    final percentage = datA.docs.isNotEmpty ? ["percentage"] as int
                                        : 0;
                                    return Text("${datA.docs[percentage]}");
                                  }
                                ),
                              ),
                            ],
                          ),
                          Text(
                            "Field Amount",
                            style:TextStyle(
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              color: Color.fromARGB(224, 17, 36, 79),
                              fontSize:18.0,
                              decoration: TextDecoration.none,
                            ),),
                        ],
                      ),
                      SizedBox(height:10),
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
                                radius:10,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(8.0,0.0,0.0,0.0),
                                child: Text(
                                  "Field-2",
                                  style:TextStyle(
                                    fontFamily: GoogleFonts.openSans().fontFamily,
                                    color: Color.fromARGB(224, 17, 36, 79),
                                    fontSize:18.0,
                                    decoration: TextDecoration.none,
                                  ),),
                              ),
                            ],
                          ),
                          Text(
                            "Field Amount",
                            style:TextStyle(
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              color: Color.fromARGB(224, 17, 36, 79),
                              fontSize:18.0,
                              decoration: TextDecoration.none,
                            ),),
                        ],
                      ),
                      SizedBox(height:10),
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              CircleAvatar(
                                backgroundColor: Colors.greenAccent[200],
                                radius:10,
                              ),
                              Padding(
                                padding: const EdgeInsetsDirectional.fromSTEB(8.0,0.0,0.0,0.0),
                                child: Text(
                                  "Field-3",
                                  style:TextStyle(
                                    fontFamily: GoogleFonts.openSans().fontFamily,
                                    color: Color.fromARGB(224, 17, 36, 79),
                                    fontSize:18.0,
                                    decoration: TextDecoration.none,
                                  ),),
                              ),
                            ],
                          ),
                          Text(
                            "Field Amount",
                            style:TextStyle(
                              fontFamily: GoogleFonts.openSans().fontFamily,
                              color: Color.fromARGB(224, 17, 36, 79),
                              fontSize:18.0,
                              decoration: TextDecoration.none,
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

  Future<Map<String,dynamic>> getData() async{
    final db = FirebaseFirestore.instance;
    final docRef = db.collection("goals").get().then(
          (querySnapshot) {
            Map<String, dynamic> dataMap = {};
        print("Successfully completed");
        for (var docSnapshot in querySnapshot.docs) {
          dataMap[docSnapshot.id] = docSnapshot.data();
          print('${docSnapshot.id} => ${docSnapshot.data()}');
        }
            return dataMap;
      },
      onError: (e) => print("Error completing: $e"),
    );
    return {};
  }
}