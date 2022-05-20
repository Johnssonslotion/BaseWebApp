import 'package:get/get.dart';
import './map_controller.dart';

class MapBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(MapController());
    }
}