import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:toilet_app/modules/front/front_controller.dart';
import './search_controller.dart';

class SearchView extends GetView<SearchController> {
    
    const SearchView({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('SearchPage'),),
            body: Container(),
        );
    }
}
