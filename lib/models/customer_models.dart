import 'package:cloud_firestore/cloud_firestore.dart';
import 'dart:core';

class InfoCustomer {
  String uid;
  String name;
  String email;
  String profilePhoto;
  bool?    sex;
  String?  birth;
  String?  affectedDate;
  
  DateTime t;

  InfoCustomer({
    required this.uid,
    required this.name,
    required this.email,
    required this.profilePhoto,
    this.sex,
    this.birth,
    this.affectedDate,
    })
    : t = DateTime.now();
  

  Map<String, dynamic> toJson() =>  //toJson() 차이점 비교필요
     {
      'uid':uid,
      'name':name,
      'email': email,
      'profilePhoto': profilePhoto,
      'sex': sex,
      'birth': birth,
      'affected_date' : affectedDate, 
      //'agree_gps': agree_gps,
      't': t,
    };
  
//fromSnap관련 확인필요 
  @override
  String toString() {
    //return 'infoCustomer{uid: $uid, name: $name, email: $email,  age: $age, sex:$sex, affected_age : $affected_age, agree_gps: $agree_gps}';
    return 'infoCustomer{ uid:$uid, name:$name, email:$email, sex:$sex, birth:$birth, affected_date:$affectedDate, }';
  }

  static InfoCustomer fromSnap(DocumentSnapshot snap){
    var snapshot = snap.data() as Map<String, dynamic>;
    return InfoCustomer(
      uid: snapshot['uid'], 
      name: snapshot['name'], 
      email: snapshot['email'], 
      profilePhoto: snapshot['profilePhoto'], 
      //sex: snapshot['sex']
      );
  }

}

// sqflight 용 수정필요