import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lbp_web/app/modules/home/views/home_view.dart';
import 'package:lbp_web/app/modules/signUp/views/sign_up_view.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);

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
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.groups,
                    size: 100,
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text('Hurry Up!',
                      style: TextStyle(
                        fontSize: 36.0,
                        fontWeight: FontWeight.bold,
                      )),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    '매일 10분으로 허리 건강을 지켜드립니다.',
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1),
                  ),
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
                          key: ValueKey(1),
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return 'Please enter a valid email address.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            LoginController().userEmail = value!;
                          },
                          onChanged: (value) {
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
                  ), //로그인 email 창
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
                          key: ValueKey(2),
                          validator: (value) {
                            if (value!.isEmpty || value.length < 6) {
                              return 'Password must be at least 7 characters long.';
                            }
                            return null;
                          },
                          onSaved: (value) {
                            LoginController().userPassword = value!;
                          },
                          onChanged: (value) {
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
                  ), //password 창
                  SizedBox(
                    height: 10,
                  ),
                  GestureDetector(
                    //circular indicator 보여주는 코드 + 로그인 버튼
                    onTap: () {
                      LoginController().tryValidation;
                      // LoginController.instance.signin(emailController.text.trim(),
                      //           passwordController.text.trim());
                    //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    //       content: Text(LoginController().userEmail +
                    //           '/' +
                    //           LoginController().userPassword)));
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
                              '로그인',
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
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('계정이 없으신가요?'),
                      GestureDetector(
                        onTap: () => Get.to(() => SignUpView()),
                        child: Text(
                          ' 가입하기',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('체험하러 오셨나요?'),
                      GestureDetector(
                        onTap: () => Get.to(() => HomeView()),
                        child: Text(
                          ' 체험하기',
                          style: TextStyle(
                              color: Colors.blue, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
