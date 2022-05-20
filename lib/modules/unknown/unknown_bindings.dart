import 'package:get/get.dart';
import './unknown_controller.dart';

class UnknownBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(UnknownController());
    }
}