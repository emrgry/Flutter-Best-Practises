// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:mvvm_bp/basic_mvvm/basic_model.dart';
import 'package:mvvm_bp/basic_mvvm/basic_view.dart';

mixin BasicViewMixin on State<BasicView> {
  final TextEditingController _userNameController = TextEditingController();
  ValueNotifier<bool> isValidForTextController = ValueNotifier<bool>(false);

  TextEditingController get userNameController => _userNameController;
  String get valueByUserNameController => _userNameController.value.text;
  BasicModel get basicRequestModel => BasicModel(valueByUserNameController);

  // it's update to value notifer for looking bussines lgoic
  void onControllerChange(String value) {
    // 1- Validasyon yapilacak -> text'in uzunlugu 3ten buyuk olmali ister
    isValidForTextController.value = value.length > 3;
  }

  Future<void> controlToResult({bool result = false}) async {
    if (result) {
      // if backend return result, we will redirct to home page for user
      // await context.navigateToPage(const HomeExampleView());
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error'),
        ),
      );
    }
  }

  @override
  void dispose() {
    super.dispose();
    userNameController.dispose();
  }
}
