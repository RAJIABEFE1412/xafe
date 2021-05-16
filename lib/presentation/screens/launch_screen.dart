import 'package:flutter/material.dart';
import 'package:xafe/presentation/components/form_button.dart';
import 'package:xafe/presentation/components/spacer.dart';
import 'package:xafe/presentation/components/xafe_rich_text.dart';
import 'package:xafe/presentation/components/xafe_text.dart';
import 'package:xafe/styles/colors.dart';
import 'package:xafe/styles/text.dart';

import 'package:xafe/utils/extensions.dart';
import 'package:xafe/values/conts.dart';
import 'package:xafe/values/routes.dart';

class LaunchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizer = context.scaler;
    return Scaffold(
      backgroundColor: XafeColors.background,
      body: Container(
        height: sizer.sizer.height,
        width: sizer.sizer.width,
        child: Padding(
          padding: EdgeInsets.symmetric(
              horizontal: sizer.sizer.width * XafeConts.launchPadding),
          child: Column(
            children: [
              XafeSizedBox(
                height: 40,
              ),
              XafeText(
                "Xafe",
                style: XafeTextStyle.xbold,
              ),
              XafeSizedBox(
                height: 2.5,
              ),
              XafeText(
                "Smart Budgeting",
                style: XafeTextStyle.sbold,
              ),
              XafeSizedBox(
                height: 15,
              ),
              Row(
                children: [
                  Expanded(
                    child: XafeButton(
                      onPressed: () {
                        Navigator.pushNamed(context, XafeRoutes.login);
                      },
                      text: 'Login',
                    ),
                  ),
                ],
              ),
              XafeSizedBox(
                height: 2.5,
              ),
              XafeRichText(
                "New here?",
                "Create an account",
                style: XafeTextStyle.medium,
                styleData: XafeTextStyle.bold,
                tap: () {
                  Navigator.pushNamed(context, XafeRoutes.email);
                },
              ),
              XafeSizedBox(
                height: 5.5,
              ),
              XafeText(
                "By continuing, you agree to xafe's terms of user\nand privacy policy",
                style: XafeTextStyle.light,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
