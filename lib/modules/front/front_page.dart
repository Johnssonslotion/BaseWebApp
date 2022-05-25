import 'dart:ffi';

import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:toilet_app/modules/Root/Root_controller.dart';
import 'package:toilet_app/modules/search/search_controller.dart';
import 'package:toilet_app/modules/search/search_view.dart';
import 'package:toilet_app/routes/app_routes.dart';
import '../home/home_controller.dart';
import './front_controller.dart';
import 'package:speech_to_text/speech_to_text.dart' as stt;

//// 참고 : Top to Bottom // 2270 // 890

class FrontPage extends GetView<FrontController> {
  //const FrontPage({Key? key}) : super(key: key);

  const FrontPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final delegateInHome = context.navigation.navigatorKey;
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
              color:  Color(0xffFCB01D),
              // decoration:
              //     BoxDecoration(border: Border.all(color: Colors.black)),
              child: SearchAction(
                context: context,
              )), //실험용을 wrap
          //_buildTarget(context, controller),
          Container(
            height: Get.height * 0.33,
            child: FrontMenuTab(),
          ),
          Divider(
            color: Colors.black54,
            indent: Get.width * 0.05,
            endIndent: Get.width * 0.05,
          ),
          Container(
            child: Text("card_preview"),
          )
        ],
      ),
    );
  }
}

////

class SearchAction extends StatelessWidget {
  SearchAction({
    Key? key,
    required context,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FrontController());
    return Container(
        padding: EdgeInsets.all(15),
        width: context.width,
        height: context.height * 0.4,
        //height:
        //color: Color(0xffFCB01D),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              //Text("ongoing"),
              GetBuilder<FrontController>(builder: (context) {
                return Expanded(
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: controller.width_ * 0.8,
                          height: controller.width_ * 0.1,
                          alignment: Alignment.bottomCenter,
                          //padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Colors.white,
                          ),
                          child: TextField(
                              textAlign: TextAlign.start,
                              textAlignVertical: TextAlignVertical.bottom,
                              decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.location_on,
                                    color: Colors.amber,
                                  ),
                                  border: OutlineInputBorder(
                                      borderSide: BorderSide.none),
                                  hintText: "위치를 검색해주세요."),
                              onChanged: (var input) {
                                print("call : ${input}");
                                controller.onchanged(input);
                              }),
                        ),
                        InkWell(
                          child: Container(
                            width: controller.width_ * 0.1,
                            height: controller.width_ * 0.1,
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: Colors.white),
                            child: Icon(
                              Icons.mic,
                              color: Colors.black38,
                            ),
                          ),
                          onTap: () {},
                        )
                      ]),
                  flex: controller.flex_animator.value,
                );
              }),
              Expanded(
                child: FrontTopView(),
                flex: 10000
              ),
            ]));
  }
}














class FrontTopView extends StatelessWidget {
  const FrontTopView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _controller = Get.put(FrontController());
    return GetBuilder<FrontController>(
      init: FrontController(),
      builder: (context) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // SizedBox(
            //   width: Get.width * 0.01,
            // ),
            _controller.on_searching.value ? SearchResult() : Preview(),
            SizedBox(
              width: Get.width * 0.02,
            ),
          ],
        );
      },
    );
  }
}

class SearchResult extends StatelessWidget {
  const SearchResult({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FrontController());
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
            )),
        alignment: Alignment(0, 0),
        width: Get.width * 0.7,
        height: Get.height * 0.3,
        child: Stack(
          children: [
            CircularProgressIndicator(),
          ],
        ));
  }
}

class Preview extends StatelessWidget {
  const Preview({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FrontController());
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
         Container(
          width: Get.width * 0.35,
           child: Column(
             mainAxisAlignment: MainAxisAlignment.center,
             crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "${controller.preview_item.value["name"]}\n${controller.preview_item.value["sort"]}화장실", 
                  maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: GoogleFonts.notoSans(
                  textStyle: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                  ),
                )
                
                  ),
                SizedBox(
                  height: 10,
                ),
              Text(
                  "평점 ${controller.preview_item.value["score"]}인 \n최고급 화장실입니다.",
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15,
                  )),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                child: Text("더 알아보기", style: TextStyle(color: Colors.amber)),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.white,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10))),
                onPressed: () {
                    Get.toNamed(Routes.MAP);
                  },
                )
            ],
          ),
         ),
         SizedBox(
              width: Get.width * 0.05,
            ),
         Container(
          width: Get.width * 0.35,
          alignment: Alignment(0, 0),
          child: Image.asset("assets/png/pin.png")
            )  
      ],
    );
  }
}

//// Front Top view

class FrontMenuTab extends StatefulWidget {
  FrontMenuTab({Key? key}) : super(key: key);

  @override
  State<FrontMenuTab> createState() => _FrontMenuTabState();
}

class _FrontMenuTabState extends State<FrontMenuTab>
    with TickerProviderStateMixin {
  late TabController controller_;
  late TabBar tabbar_;
  @override
  void initState() {
    // TODO: implement initState

    controller_ = TabController(vsync: this, length: 3);
    tabbar_ = TabBar(controller: controller_, tabs: [
      Tab(
        child: Text(
          "지도",
          style: TextStyle(
            color: Colors.black,
            backgroundColor: Colors.white,
          ),
        ),
      ),
      Tab(
        child: Text(
          "다락방",
          style: TextStyle(
            color: Colors.black,
            backgroundColor: Colors.white,
          ),
        ),
      ),
      Tab(
        child: Text(
          "쇼핑몰",
          style: TextStyle(
            color: Colors.black,
            backgroundColor: Colors.white,
          ),
        ),
      ),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
            preferredSize: tabbar_.preferredSize,
            child: Card(color: Colors.white, child: tabbar_)),
        body:
            TabBarView(controller: controller_, viewportFraction: 1, children: [
          menu_base(),
          Center(child: Text("공사중입니다.")),
          Center(child: Text("공사중입니다.")),
        ]));
  }
  }

class menu_base extends StatelessWidget {
  const menu_base({
    Key? key,
  }) : super(key: key);

  Widget _buildButton({
    required IconData icons,
    required String text,
    required Color color,
    required String target,
    required String sort,
  }) {
    return TextButton(
      onPressed: () {
        Get.toNamed(target, arguments: sort);
      },
      child: Container(
        width: Get.width * 0.195,
        height: Get.width * 0.23,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: Get.width * 0.15,
              height: Get.width * 0.15,
              child: Icon(
                icons,
                color: Colors.black54,
                size: 30,
              ),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Text(text, style: TextStyle(color: Colors.black54))
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      //첫번째 탭
      //width: Get.width,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Wrap(
          spacing: 1.0,
          runSpacing: 1.0,
          direction: Axis.horizontal,
          verticalDirection: VerticalDirection.down,
            children: [
            _buildButton(
                icons: Icons.family_restroom,
                text: "가족화장실",
                color: Color(0xFFFFF9EF),
                target: Routes.MAP,
                sort: ""),
            _buildButton(
                icons: Icons.wc,
                text: "장애인화장실",
                color: Color(0xffFAF4FF),
                target: Routes.MAP,
                sort: ""),
            _buildButton(
                icons: Icons.car_repair,
                text: "주차장",
                color: Color(0xffEFFFF2),
                target: Routes.MAP,
                sort: ""),
            _buildButton(
                icons: Icons.local_cafe,
                text: "추천카폐",
                color: Color(0xffFFEFFC),
                target: Routes.MAP,
                sort: ""),
            _buildButton(
                icons: Icons.restaurant,
                text: "추천식당",
                color: Color(0xffFFEFEF),
                target: Routes.MAP,
                sort: ""),
          ],
              ),
      ),
    );
  }
}
