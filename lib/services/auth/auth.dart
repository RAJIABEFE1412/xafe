import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:xafe/models/auth/auth_response.dart';
import 'package:xafe/models/auth/create_account.dart';
import 'package:xafe/models/enums/auth.dart';
import 'package:xafe/services/auth/crud.dart';
import 'package:xafe/values/strings.dart';

class AuthService {
  static FirebaseAuth _auth = FirebaseAuth.instance;
  static Future<AuthResponse> register(CreateAccountRequest data) async {
    log('auth --- ${_auth?.currentUser ?? 'error'}');
    try {
      final User user = (await _auth.createUserWithEmailAndPassword(
        email: data.email,
        password: data.password,
      ))
          .user;
      if (user != null) {
        // AuthResponse authRes =

        // log('res --- ${authRes.response} ${authRes.message}');
        return await AuthCRUDService.registerUser(data, user.uid);
      } else {
        return AuthResponse(
            response: AuthEnum.Failure, message: "Couldn't register user.");
        // _success = false;
      }
    } on FirebaseAuthException catch (e) {
      return AuthResponse(
          response: AuthEnum.Failure,
          message: "${e?.message ?? 'no is missing'}");
    } catch (e) {
      log("here --- $e");
      return AuthResponse(
          response: AuthEnum.Failure,
          message: "${e ?? 'Error registering user.'}");
    }
  }

  static Future<AuthResponse> signInWithEmailAndPassword(
      String email, String password) async {
    try {
      final User user = (await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      ))
          .user;
      if (user != null) {
        log('here -- ${user.uid}');
        AuthResponse data = await AuthCRUDService.readUserData(user.uid);
        log('data -------- ${data.response}');
        return data;
      } else {
        return AuthResponse(
            response: AuthEnum.Failure, message: "Couldn't register user.");
        // _success = false;
      }
    } on FirebaseAuthException catch (e) {
      return AuthResponse(response: AuthEnum.Failure, message: "${e?.message}");
    } catch (e) {
      return AuthResponse(
        response: AuthEnum.Failure,
        message: e?.toString() ?? XafeStrings.serverErr,
      );
    }
  }
}
