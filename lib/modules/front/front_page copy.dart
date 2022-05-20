// import 'package:get/get.dart';
// import 'package:flutter/material.dart';
// import 'package:toilet_app/modules/widget/Appbar.dart';
// import './front_controller.dart';

// class FrontPage extends GetView<FrontController> {
//   const FrontPage({Key? key}) : super(key: key);






//   // Widget _buildbtn(   
//   //   Icon Icons,
//   //   Function 

//   // ){
//   //   return Container(
//   //     width: 100,
//   //     height: 100,
//   //     decoration: 
//   //       BoxDecoration(
//   //         border: ,
//   //         BorderRadius: ,
//   //         ),
//   //     child: Icons
      

//   //   );
//   // }



//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //appBar: CustomAppBar(pushed: ),
//       body: Container(
//         child: Column(
//           children: [
//             Container(
//                 height: Get.height * 0.370,
//                 width: Get.width,
//                 color: Colors.cyan,
//                 child: Center(
//                     child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text("hello")
//                   ],
//                 ))),
//             // _buildCards(controller),
//             _buildCatagories(),
//             Divider(
//               height: 10,
//               color: Colors.black26,
//               thickness: 1,
//               indent: Get.width*0.025,
//               endIndent: Get.width*0.025,              
//               ),
//             _buildrecommends(),
//           ],
//         ),
//       ),
//     );
//   }


//   Widget _buildCards(controller) {
//     return Container(
//         height: Get.height * 0.380,
//         width: Get.width,
//         color: Colors.cyan,
//         child: Obx(() => Center(
//                 child: Column(
//               children: [
//                 Text("Lng : ${controller.gps_lng.toString()}"),
//                 Text("Lat : ${controller.gps_lat.toString()}")
//               ],
//             ))));
  
//   }





//   Widget _buildCatagories() {
//     return Container(
//       height: Get.height * 0.3,
//       width: Get.width,
//       // ignore: sort_child_properties_last
//       child: Center(
//           child: InkWell(
//               onTap: () {
//                 //Get.to(BoardPage());
//               },
//               child: Text("Catagories"))),
//       color: Colors.white,
//     );
//   }

//   Widget _buildareaCard(){
//    return Container(
//      child: Column(
//        children: [
//          Expanded(child: Text("1"),flex: 1,),
//          Expanded(child: Text("2"),flex: 3,),
//      ]),
//    );
//   }



//   Widget _buildrecommends() {
//     return Padding(
//       padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
//       child: Container(
//         height: Get.height * 0.20,
//         width: Get.width,
//         //color: Colors.white,
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 Text("이곳은 어떠신가요?",
//                   style:TextStyle(
//                     fontSize: 15,
//                   )
//                   ),
//                 InkWell(
//                   child: Text("더보기"),
//                   onTap: (){},
//                   ),
//                   _buildareaCard()
//               ],
//             )
//           ],
//         ),
//         decoration: BoxDecoration(
//           border: Border.all(
//             width:1,
//             color:Colors.amber, 
//             ),),
        
//           //borderRadius:BorderRadius.all(),
          
//       ),
//     );
//   }
















// }





