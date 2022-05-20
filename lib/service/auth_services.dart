import 'package:firebase_auth/firebase_auth.dart';
import 'package:toilet_app/firebase_options.dart';
import 'package:get/get.dart';


class AuthService extends GetxService {
  static AuthService get to => Get.find();


  /// Mocks a login process
  final isLoggedIn = false.obs;
  bool get isLoggedInValue => isLoggedIn.value;


  void login() {
    isLoggedIn.value = true;
  }

  void logout() {
    isLoggedIn.value = false;
  }
}






/// service로 들고 있어도 될까? controller 로 빼도 될까? 
/// 고민해보자
/// Getx 메모리 관리문제 






///