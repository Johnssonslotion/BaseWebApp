import 'package:get/get.dart';
import './front_controller.dart';

class FrontBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(FrontController());
    }
}