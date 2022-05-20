import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:path/path.dart';

class DBServices extends GetxService{
  static DBServices get to => Get.find();
    Future<Database> init() async {
      Database db = await openDatabase(
        join(await getDatabasesPath(),'database.db',),version: 1,
      onCreate: (Database db, int version) async{
            await db.execute(
             'CREATE TABLE infoCustomer ( t TIMESTAMP, id INTEGER PREMARY KEY, name TEXT, sex INTEGER, age REAL, affected_age, agree_gps INTEGER)'
            );
        }
      );
      return db;
    }
}





