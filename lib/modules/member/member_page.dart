
import 'package:toggle_switch/toggle_switch.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:toilet_app/modules/widget/text_input_field.dart';
import 'package:toilet_app/routes/app_routes.dart';
import 'auth_controller.dart';
import 'package:date_time_picker/date_time_picker.dart';

class SignInPage extends GetView<AuthController> {
    
    //const SignUpPage({Key? key}) : super(key: key);

    final TextEditingController _emailController = TextEditingController();
    final TextEditingController _passwordController = TextEditingController();

    var buttonColor = Color.fromARGB(255, 202, 210, 43);

    @override
    Widget build(BuildContext context) {
        return Scaffold(
            appBar: AppBar(title: const Text('MemberPage'),),
            body: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                
                Text(
              'OUREST',
              style: TextStyle(
                fontSize: 35,
                color: buttonColor,
                fontWeight: FontWeight.w900,
              ),
            ),
            const Text(
              'Login',
              style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.w700,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _emailController,
                labelText: 'Email',
                icon: Icons.email,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: TextInputField(
                controller: _passwordController,
                labelText: 'Password',
                icon: Icons.lock,
                isObscure: true,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: MediaQuery.of(context).size.width - 40,
              height: 50,
              decoration: BoxDecoration(
                color: buttonColor,
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: InkWell(
                onTap: (){
                  controller.loginUser(
                    _emailController.text,
                    _passwordController.text
                    );
                    
                },
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.FORGOT);
                  },
                  child: const Text("비밀번호를 잊으셨나요?"),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(Routes.SIGNIN);
                  },
                  child: const Text("회원가입을 하시겠습니까?"),
                      
                )
              ],
            //////////////////////// SNS Login /////////////////////
            ),
            const SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {                    
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: 
                      BoxDecoration(
                        //color:Colors.amber,
                        border: Border.all(color: Colors.black54),
                        borderRadius:BorderRadius.circular(20.0)
                        ),
                  child: Icon(Icons.g_mobiledata),
                  ),
                ),
                InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {                    
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: 
                      BoxDecoration(
                        //color:Colors.amber,
                        border: Border.all(color: Colors.black54),
                        borderRadius:BorderRadius.circular(20.0)
                        ),
                  child: const Icon(Icons.facebook),
                  ),
                ),

                InkWell(
                  customBorder: const CircleBorder(),
                  onTap: () {                    
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    decoration: 
                      BoxDecoration(
                        //color:Colors.amber,
                        border: Border.all(color: Colors.black54),
                        borderRadius:BorderRadius.circular(20.0)
                        ),
                  child: const Icon(Icons.apple),
                  ),
                )
              ],
            ),
                
                            
                
                ],
              ),
            ),
        );
    }
}


class SignUpPage extends GetView<AuthController> {
    
    //const SignInPage({Key? key}) : super(key: key);

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _birthcontroller = TextEditingController();
  final TextEditingController _othercontroller = TextEditingController();
  bool? _sex;
  


  final buttonColor= Colors.amber;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              Text(
                'Proto_',
                style: TextStyle(
                  fontSize: 35,
                  color: buttonColor,
                  fontWeight: FontWeight.w900,
                ),
              ),
              const Text(
                'Register',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w700,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              Stack(
                children: [
                  const CircleAvatar(
                    radius: 64,
                    backgroundImage: NetworkImage(
                        'https://www.pngitem.com/pimgs/m/150-1503945_transparent-user-png-default-user-image-png-png.png'),
                    backgroundColor: Colors.black,
                  ),
                  Positioned(
                    bottom: -10,
                    left: 80,
                    child: IconButton(
                      onPressed: () => controller.pickImage(),
                      icon: const Icon(
                        Icons.add_a_photo,
                      ),
                    ),
                  ),
                  
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _usernameController,
                  labelText: 'Username',
                  icon: Icons.person,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _emailController,
                  labelText: 'Email',
                  icon: Icons.email,
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: TextInputField(
                  controller: _passwordController,
                  labelText: 'Password',
                  icon: Icons.lock,
                  isObscure: true,
                ),
              ),
              Divider( height: 20,),
              Container(
                
                //color: Colors.cyan,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                  Container(
                    child: ToggleSwitch(
                    minWidth: 90.0,
                    minHeight: 30.0,
                    fontSize: 13.0,
                    initialLabelIndex: 0,
                    activeBgColor: [Colors.green],
                    activeFgColor: Colors.white,
                    inactiveBgColor: Colors.black38,
                    inactiveFgColor: Colors.grey[900],
                    totalSwitches: 2,
                    labels: ['man', 'woman' ],
                    onToggle: (sex) {
                      print('switched to: $sex');
                      _sex = (sex==0)?false:true; // 0,false 이 남성  / 1,true 이 여성,
                    },
                  )),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: Get.width * 0.5,
                          padding:EdgeInsets.all(10),
                          child: DateTimePicker(
                                
                                type: DateTimePickerType.date,
                                dateMask: 'yyyy/MM/d',
                                controller: _birthcontroller,
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2030),
                                dateLabelText: "생일",
                                onChanged: (val)=>print(val),
                              ),
                        ),
                            Container(
                              width: Get.width * 0.5,
                              padding:  EdgeInsets.all(10),
                              child: DateTimePicker(
                                type: DateTimePickerType.date,
                                dateMask: 'yyyy/MM/d',
                                firstDate: DateTime(1950),
                                lastDate: DateTime(2030),
                                dateLabelText: "두번째 생일",
                                controller: _othercontroller,
                                onChanged: (val)=> print(val),
                                
                              ),
                            ) 
                      ],
                  ),


                ]),
              ),
            ElevatedButton(
              onPressed: () {
                controller.registerUser(
                  _usernameController.text, 
                  _emailController.text, 
                  _passwordController.text, 
                  controller.profilePhote, 
                  _sex, 
                  _birthcontroller.text, 
                  _othercontroller.text
                  );
              } 
              , 
              child: Text("등록"))

            ]
          ),
        ),
      ),
    );
  }
}











class ForgotPage extends StatelessWidget {
  const ForgotPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      
    );
  }
}



