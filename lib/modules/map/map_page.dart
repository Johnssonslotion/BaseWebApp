import 'dart:html';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:toilet_app/modules/home/home_controller.dart';
import 'package:toilet_app/modules/map/map_controller.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MapPage extends GetView<MapController> {
   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("T"),
        leading: IconButton(
          icon: Icon(
            Icons.menu,color: Colors.black,
            ),          
          onPressed: (){},
          )
          ,
        elevation: 0,
        backgroundColor: Colors.transparent,
        //toolbarOpacity: 0.3,
      ),
      body: WebViewMap(),
      extendBodyBehindAppBar:true,    
          );
        }  
  }

class WebViewMap extends StatefulWidget {
  const WebViewMap({ Key? key }) : super(key: key);

  @override
  State<WebViewMap> createState() => _WebViewMapState();
}

class _WebViewMapState extends State<WebViewMap> {
    bool isLoading = true;
        
    @override  
   void initState() {
     super.initState();
     // Enable virtual display.
     //if (Platform.isAndroid) WebView.platform = AndroidWebView();
   }
  

  
  Widget _Layout(context){
    MediaQueryData media = MediaQuery.of(context);

    return Positioned(
      top: 150,
      left: 100,
      child: Container(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //textBaseline: ,
          children: [
            Text("  x    : ${media.size.height}"),
            Text("  y    : ${media.size.width}"),
            Text("raito : ${media.size.aspectRatio}"),
          ]),
      ),      
      );
  }



  @override
  Widget build(BuildContext context) {
    return Stack(
          alignment: AlignmentDirectional.center,
          children: [ 
              Container(
              //width: Get.width*0.95,
              //height: Get.height*0.95,
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              child: WebView(
                //initialUrl: 'https://pub.dev',
                initialUrl: 'http://34.125.208.214:2000/map/',
                javascriptMode: JavascriptMode.unrestricted,
                onPageFinished: (finish){
                  setState(() {
                    isLoading=false;
                  });
                },),),
              isLoading? Center(
                child: CircularProgressIndicator(),
               ):Stack(),
               _Layout(context),      
      ]
    );
  }
}

////
///http://34.125.208.214:2000/map/
///http 설정 // ios
///<key>io.flutter.embedded_views_preview</key>
///<string>YES</string>
///https://codewithandrea.com/tips/speed-up-cloud-firestore-xcode-builds/
///debug