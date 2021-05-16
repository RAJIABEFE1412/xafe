import 'package:flutter/material.dart';
import 'package:xafe/models/auth/user_data.dart';
import 'package:xafe/models/enums/auth.dart';

class AuthResponse{
  final AuthEnum response;
  final String message;
  final UserData userData;

  AuthResponse({@required this.response, this.message,this.userData});
  
}

