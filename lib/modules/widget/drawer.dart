import 'package:curved_drawer_fork/curved_drawer_fork.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:toilet_app/service/auth_services.dart';
import 'package:get/get.dart';

class CustomDrawer extends StatelessWidget {
  CustomDrawer({
  
    Key? key
  }): super(key: key);
  
  final authService = Get.find<AuthService>();

  @override
  Widget build(BuildContext context) {
    return CurvedDrawer(
      color: Colors.white,
      labelColor: Colors.black54,
      width: 75.0,
      items: <DrawerItem>[
        DrawerItem(icon: Icon(Icons.menu)),
        DrawerItem(icon: Icon(Icons.login), label: "login")
        
      ],
      onTap: (index) {
        
        //Handle button tap
      },
    );
  }
}
