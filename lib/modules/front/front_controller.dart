import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:toilet_app/modules/front/front_page.dart';
import 'package:toilet_app/service/gps_services.dart';

class FrontController extends GetxController with GetSingleTickerProviderStateMixin{

  RxDouble width_ = Get.context!.width.obs;
  RxDouble height_= Get.context!.height.obs;
  RxBool on_searching = false.obs;

  RxInt flex_animator = 6000.obs;

  //https://app.quicktype.io/  
  final preview_item = Rx<Map<String, dynamic>>({
    'name':'월광빌딩',
    'sort':'가족',
    'score':4.5, 
  });
  
  late bool enable_gps=true;
  late TabController tabCon;
  
  RxString search_keyword = ''.obs;
    //RxDouble searchbar_height = 

@override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    GPSService().enabled = await GPSService().oninit();
    enable_gps = await GPSService().oninit();
    enable_gps?
    log("GPS prepared : ${DateTime.now()}"):
    log("GPS not prepared : ${DateTime.now()}");
    // tabCon = TabController(vsync: this,length: 3);
    // log("TabCon init");
  }

  void onchanged(String input){
    search_keyword=RxString(input);
    on_searching = input.isEmpty? RxBool(false):RxBool(true);
    print("inController:${search_keyword}, onGoing:${on_searching}");
    //change reLayout
    flex_animator=on_searching.isTrue? RxInt(1500):RxInt(6000);
    update();
  }
  


  @override
  void onClose() {
    // TODO: implement onClose
    tabCon.dispose();
    super.onClose();
  }
  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    
    


  }

}