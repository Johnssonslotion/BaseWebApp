import 'package:firebase_core/firebase_core.dart';
import 'package:toilet_app/service/gps_services.dart';
import 'firebase_options.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
//import 'package:toilet_app/modules/member/auth_controllers.dart';
import 'package:toilet_app/modules/splash/splash_controller.dart';
import 'package:toilet_app/modules/splash/splash_page.dart';
//import 'package:toilet_app/modules/unknown/unknown_page.dart';
import 'package:toilet_app/routes/app_routes.dart';
import 'package:toilet_app/service/auth_services.dart';
import 'package:toilet_app/service/localdb_services.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp( 
    options:DefaultFirebaseOptions.currentPlatform,  // -> authService 쪽으로 merge
  ).then((_) 
      {
              Get.put(SplashService());
              Get.put(AuthService());
              Get.put(DBServices());
              Get.put(GPSService());
              // await Get.putAsync(() => DbService().init());
      });
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Toilet_base_line",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      builder: (context,child){
        return FutureBuilder<void>(                     //FutureBuilder 사용법, snapshot이 
          key: const ValueKey('initFuture'),
          future: Get.find<SplashService>().init(),
          builder: (context,snapshot){
            if (snapshot.connectionState == ConnectionState.done) {return child ?? const SizedBox.shrink();}
          return const SplashPage();
            },
          );
      },
    );
  }
}


///
/// upgrade_tool: ^1.0.2
/// -> 참고 instance가 null free <- in flutter 3.0