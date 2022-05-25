//import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import './board_controller.dart';
import 'package:date_time_picker/date_time_picker.dart';

class BoardPage extends GetView<BoardController> {
    
    BoardPage({Key? key}) : super(key: key);
    TextEditingController _con1 = TextEditingController();
    TextEditingController _con2 = TextEditingController();

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('BoardPage'),),
            body: Container(
              width: Get.width,
              child:Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text("Hello_world"),
                  ElevatedButton(
                    onPressed: () {
                      Get.back();
                    },
                    child: Text("Back"))
                    ,
                    Column(
                      children: [
                        Container(
                          width: Get.width * 0.5,
                          padding:EdgeInsets.all(10),
                          child: DateTimePicker(
                                type: DateTimePickerType.date,
                                dateMask: 'yyyy,MM,d',
                                controller: _con2,
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2040),
                                dateLabelText: "BirthDay",
                                onChanged: (val)=>print(val),
                              ),
                        ),
                            Container(
                              width: Get.width * 0.5,
                              padding:  EdgeInsets.all(10),
                              child: DateTimePicker(
                                type: DateTimePickerType.date,
                                dateMask: 'yyyy,MM,d',
                                firstDate: DateTime(1950),
                                lastDate: DateTime(1950),
                                dateLabelText: "2번째 날",
                                controller: _con2,
                                onChanged: (val)=> print(val),
                                
                              ),
                            ) 

                            ,Text("${context}")
                      ],
                    )
                ],
              )

            ),
        );
    }
}