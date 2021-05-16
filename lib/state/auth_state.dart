import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:xafe/models/auth/auth_response.dart';
import 'package:xafe/models/auth/create_account.dart';
import 'package:xafe/models/enums/auth.dart';
import 'package:xafe/models/enums/stepper.dart';
import 'package:xafe/services/auth/auth.dart';

class AuthState with ChangeNotifier {
  static AuthState _instance;
  ValueNotifier<XafeStepperEnum> pageIndex =
      ValueNotifier(XafeStepperEnum.IS_FIRST);
  static AuthState get instance {
    if (_instance == null) {
      _instance = AuthState();
    }
    return _instance;
  }

  Future<AuthResponse> handleSignUp(CreateAccountRequest data) async {
    AuthResponse res;
    await AuthService.register(data).then((value) {
      res = value;
    });

    return res;
  }

  Future<AuthResponse> handleSignIn(String email, String password) async {
    AuthResponse authRes =
        await AuthService.signInWithEmailAndPassword(email, password);
    log('data --- ${authRes.response}');
    return authRes;
  }

  handlePageChange({XafeStepperEnum page}) {
    log("handled");
    pageIndex.value = page;
    notifyListeners();
  }
}
