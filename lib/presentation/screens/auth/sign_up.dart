import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/canvas/step.dart';
import 'package:xafe/models/auth/create_account.dart';
import 'package:xafe/models/enums/auth.dart';
import 'package:xafe/models/enums/stepper.dart';
import 'package:xafe/presentation/components/form_scaffold.dart';
import 'package:xafe/presentation/components/indicators/steps.dart';
import 'package:xafe/presentation/components/input/app_text_field.dart';
import 'package:xafe/presentation/components/spacer.dart';
import 'package:xafe/presentation/components/tip_tap.dart';
import 'package:xafe/presentation/components/xafe_text.dart';
import 'package:xafe/state/auth_state.dart';
import 'package:xafe/styles/colors.dart';
import 'package:xafe/styles/text.dart';
import 'package:xafe/utils/extensions.dart';
import 'package:xafe/utils/modals.dart';
import 'package:xafe/utils/validators.dart';
import 'package:xafe/values/routes.dart';

class EmailPage extends StatelessWidget {
  TextEditingController _emailCtrl = TextEditingController();
  TextEditingController _passwordCtrl = TextEditingController();
  TextEditingController _nameCtrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final sizer = context.scaler;
    return Consumer<AuthState>(
      builder: (context, authState, _) => XafeStepperListener(
        builder: (context, data) {
          return FormScaffold.withAppbar(
            title: 'Sign up',
            onBack: () {
              if (data == XafeStepperEnum.IS_FIRST) Navigator.pop(context);
              if (data == XafeStepperEnum.IS_SECOND)
                authState.handlePageChange(page: XafeStepperEnum.IS_FIRST);

              if (data == XafeStepperEnum.IS_THIRD)
                authState.handlePageChange(page: XafeStepperEnum.IS_SECOND);
            },
            fields: [
              XafeText(
                data == XafeStepperEnum.IS_THIRD
                    ? "Add a Password"
                    // : data == XafeStepperEnum.IS_THIRD
                    //     ? "Enter the code"
                    : data == XafeStepperEnum.IS_SECOND
                        ? 'What\'s your email?'
                        : 'What\'s your name?',
                style: XafeTextStyle.xbold.copyWith(
                  color: XafeColors.background,
                  fontSize: 90.0,
                ),
              ),
              XafeSizedBox(height: 1.2),
              XafeText(
                "Enter your first name and last name",
                style: XafeTextStyle.lightGrey,
              ),
              XafeSizedBox(height: 4.5),
              if ((data == XafeStepperEnum.IS_FIRST))
                XafeTextField(
                  hintText: "Full name",
                  validator: XafeValidators.nameValidator,
                  controller: _nameCtrl,
                ),
              if ((data == XafeStepperEnum.IS_SECOND))
                XafeTextField(
                  hintText: "Email address",
                  validator: XafeValidators.emailValidator,
                  controller: _emailCtrl,
                ),
              if ((data == XafeStepperEnum.IS_THIRD))
                XafeTextField(
                  hintText: "********",
                  validator: XafeValidators.passwordValidator,
                  controller: _passwordCtrl,
                ),
              if (data == XafeStepperEnum.IS_THIRD) XafeSizedBox(height: 2.5),
              if (data == XafeStepperEnum.IS_THIRD)
                XafeTipTap(hint: "show password?"),
              XafeSizedBox(height: 4.5),
              XafeSizedBox(
                height: 1.31,
                width: sizer.sizer.width,
                child: CustomPaint(
                  painter: StepCanvas(data),
                ),
              ),
            ],
            btnText: 'Next',
            onSubmit: () async {
              if (data == XafeStepperEnum.IS_FIRST)
                authState.handlePageChange(page: XafeStepperEnum.IS_SECOND);
              if (data == XafeStepperEnum.IS_SECOND)
                authState.handlePageChange(page: XafeStepperEnum.IS_THIRD);

              if (data == XafeStepperEnum.IS_THIRD) {
                final doRoute = await formSubmitDialog(
                  context: context,
                  errorMessage: 'Something went wrong',
                  future: authState.handleSignUp(CreateAccountRequest(
                    email: _emailCtrl.text,
                    name: _nameCtrl.text,
                    password: _passwordCtrl.text,
                  )),
                );
                if (doRoute != null &&
                    doRoute.response == AuthEnum.Successful) {
                  Navigator.of(context).pushNamedAndRemoveUntil(XafeRoutes.dashboard, (Route<dynamic> route)=> false);
                } else {
                  log("error _ ${doRoute.response}");
                }
              }
            },
          );
        },
      ),
    );
  }
}
