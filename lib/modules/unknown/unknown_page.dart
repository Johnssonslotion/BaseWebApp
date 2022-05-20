import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './unknown_controller.dart';

class UnknownPage extends GetView<UnknownController> {
    
    const UnknownPage({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('UnknownPage'),),
            body: Container(),
        );
    }
}