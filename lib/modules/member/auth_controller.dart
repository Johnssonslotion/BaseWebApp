import 'dart:io'; //File 있어야 
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:get/get.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:toilet_app/modules/Root/Root_page.dart';
import 'package:toilet_app/modules/member/member_page.dart';
import 'package:toilet_app/models/customer_models.dart' as model;


class AuthController extends GetxController {
  static AuthController instance = Get.find();

  late Rx<User?> _user;
  late Rx<File?> _pickedImage; //프사기능까지 해둘까?

  File? get profilePhote => _pickedImage.value;
  User get user => _user.value!; //null safety로 !



@override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
    _user=Rx<User?>(FirebaseAuth.instance.currentUser);
    _user.bindStream(FirebaseAuth.instance.authStateChanges());
    ever(_user, _setInitialScreen);
  }

_setInitialScreen(User? user){
  if(user == null){
    Get.offAll(()=> SignInPage()); // login 일때만, 
  } else {
    Get.offAll(()=> RootPage());
  } 
}


  void pickImage() async {
    final PickedImage = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (PickedImage != null){
      Get.snackbar('프로필 사진', '사진이 잘 선택되었습니다.');
    }
    _pickedImage = Rx<File?>(File(PickedImage!.path));
  }


Future<String> _uploadToStorage(File image) async {
  Reference ref = FirebaseStorage.instance.ref()
  .child('profilePics')
  .child(FirebaseAuth.instance.currentUser!.uid);

  UploadTask uploadTask = ref.putFile(image);
  TaskSnapshot snap = await uploadTask;
  String downloadUrl = await snap.ref.getDownloadURL();
  return downloadUrl;
}


void registerUser(
  String username, 
  String email, 
  String password, 
  File? image, 
  bool? sex, 
  String? birth,
  String? affected_date,
) async {
  try {
    if ( username.isNotEmpty && 
          email.isNotEmpty &&
          password.isNotEmpty &&
          image != null){
            UserCredential cred = 
            await FirebaseAuth.instance.createUserWithEmailAndPassword(
              email: email, 
              password: password,
              );
            String downloadUrl = await _uploadToStorage(image);
            model.InfoCustomer user = model.InfoCustomer(
              name:  username,
              email: email,
              profilePhoto: downloadUrl,
              uid: cred.user!.uid,
              sex: sex,
              birth: birth,
              affectedDate: affected_date,
            );
            await FirebaseFirestore.instance
            .collection('users')
            .doc(cred.user!.uid)
            .set(user.toJson()); // null값 어떻게 될까?
          } else {
            Get.snackbar('계정 생성오류', '빈칸을 확인하세요');
          }
  } catch (e) {
    Get.snackbar('계정 생성오류', e.toString(),
    );
  }
}
  
  void loginUser(String email, String password) async {
    try {
      if (email.isNotEmpty && password.isNotEmpty) {
        await FirebaseAuth.instance.signInWithEmailAndPassword(
            email: email, password: password);
      } else {
        Get.snackbar(
          'Error Logging in',
          'Please enter all the fields',
        );
      }
    } catch (e) {
      Get.snackbar(
        'Error Loggin gin',
        e.toString(),
      );
    }
  }
  
void signOut() async {
  await FirebaseAuth.instance.signOut();  
  }
}





  







 