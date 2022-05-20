import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toilet_app/modules/Root/Root_controller.dart';

class DebugWindow extends GetView<RootController> {
  int width  = 200;
  int height = 150;
  // BuildContext? context_root;
  String? currentLocation;
  DebugWindow({
    // required BuildContext context_root,
    required String? currentLocation,
   Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
        top: controller.DebugY.value,
        left:controller.DebugX.value,
        child: Container(
                      width: 200,
                      height: 150,
                      decoration: BoxDecoration(
                        border:Border.all(width: 1),
                        ),
                      child: Column(
                        children: [
                          Text("For debug",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                          SizedBox(width: 10,height: 10,),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('cTree : ${currentLocation}'),
                              Text('cIdex : ${controller.index.toString()}'),
                              Text('gps status : false'),
                              Text('gps axis : 35.123 / 135.234'),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                  }
                }





  


  
  

  //Positioned(
                //   top: 100,
                //   left: 10,
                //   width: 200,
                //   height: 150,                  
                //   //right: 100,
                //   child: Container(
                //     decoration: BoxDecoration(border:Border.all(width: 1)),
                //     child: Column(
                //       children: [
                //         Text("For debug",style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                //         SizedBox(width: 10,height: 10,),
                //         Column(
                //           mainAxisAlignment: MainAxisAlignment.center,
                //           crossAxisAlignment: CrossAxisAlignment.start,
                //           children: [
                //             Text('currentLocation : ${currentLocation.toString()}'),
                //             Text('currentIdex : ${controller.index.toString()}'),
                //             Text('gps status : '),
                //             Text('gps status : '),
                //           ],
                //         ),
                //       ],
                //     ),
                //   ),
                // )



