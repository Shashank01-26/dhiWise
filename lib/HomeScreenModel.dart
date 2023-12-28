import 'package:flutter/material.dart';

class HomeScreenModel {
  final unfocusNode = FocusNode();
  PageController? pageViewController;

  int get pageViewCurrentIndex => pageViewController != null &&
        pageViewController!.hasClients &&
        pageViewController!.page != null ?
        pageViewController!.page!.round() : 0;

  void initState(BuildContext context){}

  void dispose(){
    unfocusNode.dispose();
  }

}