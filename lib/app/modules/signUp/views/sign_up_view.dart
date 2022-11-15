import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lbp_web/app/modules/login/controllers/auth_controller_controller.dart';
import 'package:lbp_web/app/modules/login/controllers/login_controller.dart';

import '../controllers/sign_up_controller.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.emoji_people,
                    size: 150,
                  ),
                  Text('만나서 반갑습니다.',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 15,
                  ), //여기까지 로고

                  Padding(
                    //로그인 email 창
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Form(
                        key: LoginController().formKey,
                        child: TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          key: ValueKey(3),
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email address.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            LoginController().userEmail = value!;
                          },
                          onChanged: (value){
                            LoginController().userEmail = value;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: Colors.grey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(34.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(35.0),
                              ),
                            ),
                            hintText: 'User email',
                            hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey),
                            contentPadding: EdgeInsets.all(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    //password 창
                    padding: const EdgeInsets.symmetric(horizontal: 25.0),
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.grey[200],
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child: Form(
                        key: LoginController().formKey,
                        child: TextFormField(
                          key: ValueKey(4),
                          validator: (value) {
                            if (value!.isEmpty || value.length < 6) {
                              return 'Password must be at least 7 characters long.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            LoginController().userPassword = value!;
                          },
                          onChanged: (value){
                            LoginController().userPassword = value;
                          },
                          decoration: InputDecoration(
                            prefixIcon: Icon(
                              Icons.lock,
                              color: Colors.grey,
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.white),
                              borderRadius: BorderRadius.all(
                                Radius.circular(34.0),
                              ),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.green, width: 2),
                              borderRadius: BorderRadius.all(
                                Radius.circular(35.0),
                              ),
                            ),
                            hintText: 'password',
                            hintStyle:
                                TextStyle(fontSize: 14, color: Colors.grey),
                            contentPadding: EdgeInsets.all(10),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    // onTap: () async {
                    //   // AuthControllerController.instance.signup(
                    //   //   // emailController.text.trim(),
                    //   //   // passwordController.text.trim(),
                    //   // );
                    //   // final newUser = await FirebaseFirestore.instance;
                    // },
                    onTap: () {
                      LoginController().tryValidation;
                    },
                    child: Container(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.0),
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(12)),
                          child: Center(
                            child: Text(
                              '회원가입',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('계정이 이미 있으신가요?'),
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Text(
                          '  뒤로 가기',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
