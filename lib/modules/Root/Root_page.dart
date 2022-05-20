import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:toilet_app/routes/app_routes.dart';
import './Root_controller.dart';

class RootPage extends GetView<RootController> {
  RootPage({Key? key}) : super(key: key);

  //final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return RouterOutlet.builder(
        delegate: Get.nestedKey(null),
        builder: (context) {
          return Scaffold(
              //appBar: ,
              drawer: Drawer(),
              body: 
                GetRouterOutlet(
                  initialRoute: Routes.HOME,
                  delegate: Get.nestedKey(null),
                  anchorRoute: Routes.ROOT,
                  filterPages: (afterAnchor) {
                    return afterAnchor.take(1);
                  },
                ),
            );
        });
      }
    }



// class RootPage extends GetView<RootController> {
//     const RootPage({Key? key}) : super(key: key);
    

//     @override
//     Widget build(BuildContext context) {
//       var nestkey = Get.nestedKey(Routes.ROOT);
//       return Scaffold(
//             body: GetRouterOutlet(
//               initialRoute: Routes.FRONT,
//               key: nestkey,
//               ),
//       );
//     }
// }




