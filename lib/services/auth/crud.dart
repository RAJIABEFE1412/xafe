import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:xafe/models/auth/auth_response.dart';
import 'package:xafe/models/auth/create_account.dart';
import 'package:xafe/models/auth/user_data.dart';
import 'package:xafe/models/enums/auth.dart';
import 'package:xafe/values/strings.dart';

class AuthCRUDService {
  static FirebaseFirestore _crud = FirebaseFirestore.instance;

  static Future<AuthResponse> registerUser(
      CreateAccountRequest data, String uid) async {
    try {
      AuthResponse authRes;
      await _crud
          .collection(XafeStrings.userCollection)
          .doc(uid)
          .set(UserData(
            email: data.email,
            name: data.name,
            uid: uid,
          ).toJson())
          .then((v) {
        log('successful');
        authRes = AuthResponse(
          response: AuthEnum.Successful,
          message: "Succefully registered",
          userData: UserData(
            email: data.email,
            name: data.name,
            uid: uid,
          ),
        );
      });

      return authRes;
    } on FirebaseException catch (e) {
      log('dddd 2');
      return AuthResponse(response: AuthEnum.Failure, message: "${e?.message}");
    } catch (e) {
      log('dddd 2');
      return AuthResponse(
          response: AuthEnum.Failure,
          message: "${e?.message ?? 'Error registering user.'}");
    }
  }

  static Future<AuthResponse> readUserData(String uid) async {
    AuthResponse authRes;
    try {
      await _crud
          .collection(XafeStrings.userCollection)
          .doc(uid)
          .get()
          .then((value) {
        log('done');
        if (value.exists) {
          log('doneeee');
          authRes = AuthResponse(
            response: AuthEnum.Successful,
            message: "Succefully registered",
            userData: UserData.fromJson(value?.data()),
          );
        } else {
          log('not found');
          authRes = AuthResponse(
              response: AuthEnum.Failure, message: "user data doesn't exist.");
        }
        log('check again --- ${authRes.response}');
      });
    } on FirebaseException catch (e) {
      log('error $e');
      authRes =
          AuthResponse(response: AuthEnum.Failure, message: "${e?.message}");
    } catch (e) {
      log('error $e');
      authRes = AuthResponse(
        response: AuthEnum.Failure,
        message: e?.toString() ?? XafeStrings.serverErr,
      );
    }
    return authRes;
  }
}
