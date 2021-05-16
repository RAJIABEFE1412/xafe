import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/fonts/xafeicons_icons.dart';
import 'package:xafe/models/enums/auth.dart';
import 'package:xafe/presentation/components/form_scaffold.dart';
import 'package:xafe/presentation/components/input/app_password_input.dart';
import 'package:xafe/presentation/components/input/app_text_field.dart';
import 'package:xafe/presentation/components/spacer.dart';
import 'package:xafe/presentation/components/tip_tap.dart';
import 'package:xafe/presentation/components/xafe_text.dart';
import 'package:xafe/state/auth_state.dart';
import 'package:xafe/styles/colors.dart';
import 'package:xafe/styles/text.dart';
import 'package:xafe/utils/modals.dart';
import 'package:xafe/utils/validators.dart';
import 'package:xafe/values/routes.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _passwordCtrl= TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Consumer<AuthState>(
      builder: (context, authState, _) => FormScaffold.withAppbar(
        title: '',
       
        fields: [
          XafeText(
            'Welcome back',
            style: XafeTextStyle.xbold.copyWith(
              color: XafeColors.background,
              fontSize: 60.0,
            ),
          ),
          XafeSizedBox(height: 1.2),
          XafeText(
            "Login to your account",
            style: XafeTextStyle.lightGrey,
          ),
          XafeSizedBox(height: 4.5),
          XafeTextField(
            hintText: 'email address',
            validator: XafeValidators.emailValidator,
            controller: _emailCtrl,
          ),
          XafeSizedBox(height: 3.5),
          XafePasswordTextField(
            hintText: '********',
            controller: _passwordCtrl,
            validator: XafeValidators.passwordValidator,
            iconData: XafeIcons.eye,
          ),
          XafeSizedBox(height: 2.5),
          XafeTipTap(
            hint: "forget password?",
          ),
          XafeSizedBox(height: 4.5),
        ],
        btnText: 'Login',
        onSubmit: () async {
          final doRoute = await formSubmitDialog(
            context: context,
            future: authState.handleSignIn(
              _emailCtrl.text,
              _passwordCtrl.text,
            ),
          );
          if (doRoute != null && doRoute.response == AuthEnum.Successful) {
            log('oga 000');
            Navigator.of(context).pushNamed(XafeRoutes.dashboard);
          } else {
            log("daa --- ${doRoute.response}");
          }
        },
      ),
    );
  }
}
