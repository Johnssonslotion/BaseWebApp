import 'package:flutter/material.dart';
import 'package:get/get.dart';
import './../../routes/app_routes.dart';

class RootController extends GetxController {
  
  


  RxString location = "".obs;
  int index = 0;

  RxDouble DebugX = 10.0.obs;
  RxDouble DebugY = 100.0.obs;

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  } 

  void onTapNav(var _index){
    index=_index;
    update();
  }

}


