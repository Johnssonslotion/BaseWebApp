import 'package:get/get.dart';
import './board_controller.dart';

class BoardBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(BoardController());
    }
}