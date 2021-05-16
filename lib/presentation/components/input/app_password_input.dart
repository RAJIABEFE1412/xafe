import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xafe/styles/colors.dart';
import 'package:xafe/utils/type_defs.dart';

import 'app_text_field.dart';

class XafePasswordTextField extends StatefulWidget {
  final TextEditingController controller;
  final OnValidate<String> validator;
  final String hintText;
  final IconData iconData;

  TextEditingController get ctrl {
    return controller ?? TextEditingController();
  }

  const XafePasswordTextField({
    Key key,
    this.controller,
    this.validator,
    this.iconData,
    this.hintText,
  }) : super(key: key);

  @override
  _PasswordTextFieldState createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<XafePasswordTextField>
    with WidgetsBindingObserver {
  final ValueNotifier<bool> _isObscured = ValueNotifier(true);

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isObscured,
      builder: (_, bool obscured, __) {
        return XafeTextField(
          validator: widget.validator,
          controller: widget.ctrl,
          obscureText: obscured,
          hintText: widget.hintText ?? "Password",
          suffixIcon: IconButton(
            icon: Icon(
                obscured
                    ? widget.iconData ?? Icons.visibility
                    : Icons.visibility_off,
                color: XafeColors.darkGray,
                size: obscured
                    ? widget.iconData != null
                        ? 14
                        : 24
                    : 24),
            onPressed: () {
              _isObscured.value = !obscured;
            },
          ),
        );
      },
    );
  }
}
