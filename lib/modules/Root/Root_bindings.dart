import 'package:get/get.dart';
import './Root_controller.dart';

class RootBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(RootController());
    }
}