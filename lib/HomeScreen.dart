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
             mainAxisSize: MainAxisSize.min,
             mainAxisAlignment: MainAxisAlignment.start,
             children: [
               Text("Goal")
             ], 
            ),
          ],
        ),
      ),
    );
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Theme.of(context).colorScheme.inversePrimary,
    //   ),
    //   body: Center(
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.center,
    //       children: <Widget>[
    //         const Text(
    //           'You have pushed the button this many times:',
    //         ),
    //         Text(
    //           '$_counter',
    //           style: Theme.of(context).textTheme.headlineMedium,
    //         ),
    //       ],
    //     ),
    //   ),
    //   floatingActionButton: FloatingActionButton(
    //     onPressed: _incrementCounter,
    //     tooltip: 'Increment',
    //     child: const Icon(Icons.add),
    //   ),
    // );
  }
}