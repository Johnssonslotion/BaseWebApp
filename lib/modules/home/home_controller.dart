import 'package:get/get.dart';
import 'package:geolocator/geolocator.dart';


class HomeController extends GetxController {
//  GetxController _gcontroller = Get.put();

  RxDouble gps_lat = 0.0.obs;
  RxDouble gps_lng = 0.0.obs;
  RxString requestPermission = "".obs;

  int index = 0;

  final LocationSettings locationSettings = LocationSettings(
    accuracy: LocationAccuracy.high,
    distanceFilter: 100,
  );


  @override
  Future<void> onInit() async {
    // TODO: implement onInit
    super.onInit();
    //LocationPermission info = await Geolocator.requestPermission();
  }


  void onTapNav(var _index){
    index=_index;
    update();
  }

}