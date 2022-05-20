import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:toilet_app/modules/widget/SearchAppBar.dart';
import 'package:toilet_app/modules/widget/text_input_field.dart';
import './front_controller.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;
//import 'package:fsearch/fsearch.dart';

 

class FrontPage extends GetView<FrontController> {
  //const FrontPage({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();
  FrontPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    //final width_ = context.width >= 800.0 ?? 800.0 : context.width;
    return Scaffold(
      body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  width: context.width,
                  height: context.height*0.15,
                  //height: 
                  color: Colors.amber,
                  child: Row(
              
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        width: context.width*0.8,
                        //padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.white,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon:Icon(Icons.location_on,color: Colors.amber,),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none
                      ),
                      hintText: "위치를 검색해주세요.${context.width}" 
                    ),
                  ),
                ),
              // SizedBox(
              //   height: Get.width*0.05,
              //   width: Get.width*0.05,
              //   ),
              InkWell(
                child: Container(
                  width: controller.width_*0.1,
                  height: controller.width_*0.1,
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: Colors.white
                  ),
                  child: Icon(Icons.mic, color: Colors.black38,),
                ),
                onTap: (){},
              )


            ]),
          ),
          _buildTarget(context,controller),
          Container(
            child: Text("hello"),
          )
        ],
      ),);
  }
}






Widget _buildTarget(context,controller){
  return Container(
    height: Get.height*0.2,
    width: Get.width,
    color: Colors.amber,
    child: Column(
      children: [
        Text("여긴 어디? ${controller.height_}")
      ]
      ),
  );
}


