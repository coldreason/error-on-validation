import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lbp_web/app/modules/login/controllers/auth_controller_controller.dart';

import '../controllers/settings_controller.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SettingsView'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          IconButton(
            onPressed: () {
              AuthControllerController.instance.logout();
            },
            icon: const Icon(Icons.login_outlined),
          ),
        ],
      )
    );
  }
}
