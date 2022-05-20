import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:toilet_app/routes/app_routes.dart';
import './home_controller.dart';
import 'package:floating_bottom_navigation_bar/floating_bottom_navigation_bar.dart';

class HomePage extends GetView<HomeController> {
  const HomePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetRouterOutlet.builder(
      routerDelegate: Get.nestedKey(Routes.HOME),
      builder: (context){
      final delegate = context.navigation;
      final currentLocation = context.location;
      var currentIndex=0;
      if (currentLocation.startsWith(Routes.MAP) == true){
        currentIndex = 1;
      }
      if (currentLocation.startsWith(Routes.BOARD) == true){
        currentIndex = 2;
      } 
      return Scaffold(
        body: GetRouterOutlet(
          initialRoute: Routes.FRONT,
          anchorRoute: Routes.HOME,
          ),
        extendBody: true,
        bottomNavigationBar:  FloatingNavbar(
              selectedBackgroundColor: Colors.white,
              iconSize: 24,
              borderRadius: 20,
              width: Get.width * 0.5,
              currentIndex: controller.index,
              onTap: (currentIndex) {
                controller.onTapNav(currentIndex);
                switch (currentIndex){
                  case 0:
                    delegate.toNamed(Routes.HOME);
                    break;
                  case 1:
                    delegate.toNamed(Routes.MAP);
                    break;
                  case 2:
                    delegate.toNamed(Routes.BOARD);
                    break;
                  default:
                  }
                },
              backgroundColor: Colors.amber,
              items: [
                FloatingNavbarItem(icon: Icons.home),
                FloatingNavbarItem(icon: Icons.map_outlined,),
                FloatingNavbarItem(icon: Icons.bookmarks_outlined,),
              ],
            ),
           );
        },
      );
    }
  }










// 회원가입 drawer나 enddrawer는 어떻게 넣지?
// 일단 사이즈는 고려하지말자. (추후 고려)