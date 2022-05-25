import 'package:get/get.dart';
import './search_controller.dart';

// ignore: deprecated_member_use
class SearchBindings implements Bindings {
    @override
    void dependencies() {
        Get.put(SearchController());
    }
}