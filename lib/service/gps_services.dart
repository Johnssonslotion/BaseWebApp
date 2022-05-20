import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:geolocator/geolocator.dart';


class GPSServices extends GetxService{
  late bool enabled;
  Future init() async{
    enabled = await Geolocator.isLocationServiceEnabled();
    return enabled;
  }
}