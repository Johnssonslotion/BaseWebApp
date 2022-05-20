import 'package:get/get.dart';
import 'auth_controller.dart';

class MemberBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(AuthController());
    }
}