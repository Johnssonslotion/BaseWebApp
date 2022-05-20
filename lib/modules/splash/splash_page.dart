import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './splash_controller.dart';

class SplashPage extends GetView<SplashService> {
    
    const SplashPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            body: Center(
              child: Column(
                 mainAxisSize: MainAxisSize.min,
                children: [
                  Obx(
              () => Text(
                controller.welcomeStr[controller.activeStr.value],
                style: TextStyle(fontSize: 20),
              ),
            ),
            CircularProgressIndicator(),
                ],
              ),
            ),
        );
    }
}