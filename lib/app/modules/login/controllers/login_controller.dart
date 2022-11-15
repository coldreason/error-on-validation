import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  // bool isSignupScreen = true;

  String userEmail = '';
  String userPassword = '';
  final _formKey = GlobalKey<FormState>();
  void _tryValidation() {
    final isValid = _formKey.currentState!.validate();
    //만약 모든 form들이 유효할 때엔 value들이 null값을 return 할 것임, 이후 사용자가 입력한 밸류값들을 이용해서 실제적인 validation기능을 해야 함
    if (isValid) {
      _formKey.currentState!.save();
      print('form submitted');
      //이 saved 메소드가 호출되면, form 전체의 state 값을 저장하게 되는데, 이 때 모든 텍스트폼필드가 가지고 있는 onSaved 메소드를 작동시킴
    }
  }
  get formKey{
    return _formKey;
  }
  get tryValidation{
    return _tryValidation();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
