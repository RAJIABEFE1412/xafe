import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xafe/models/focus.dart';
import 'package:xafe/styles/colors.dart';
import 'package:xafe/styles/text.dart';
import 'package:xafe/utils/type_defs.dart';
import 'package:xafe/utils/extensions.dart';

class XafeTextField extends StatefulWidget {
  final TextEditingController controller;
  final bool isEnabled;
  final TextInputAction textInputAction;
  final TextCapitalization textCapitalization;
  final bool showLabel;
  final Function onTap;
  final bool obscureText;
  final String hintText;
  final Widget suffix;
  final Widget suffixIcon;
  final Widget prefix;
  final OnValidate<String> validator;
  final TextInputType keyboardType;
  final List<TextInputFormatter> inputFormatters;
  final int maxLines;
  final int maxLength;
  final Function(String) onChanged;
  final TextStyle style;
  final TextAlign textAlign;
  final String semanticsLabel;

  TextEditingController get ctrl {
    return controller ?? TextEditingController();
  }

  const XafeTextField({
    Key key,
    this.semanticsLabel,
    this.textInputAction,
    this.textCapitalization,
    this.controller,
    this.isEnabled,
    this.inputFormatters,
    this.onTap,
    this.showLabel = true,
    this.hintText,
    this.textAlign = TextAlign.start,
    this.maxLines,
    this.maxLength,
    this.onChanged,
    this.obscureText = false,
    this.suffix,
    this.suffixIcon,
    this.prefix,
    this.validator,
    this.keyboardType,
    this.style,
  }) : super(key: key);

  @override
  _XafeTextFieldState createState() => _XafeTextFieldState();
}

class _XafeTextFieldState extends State<XafeTextField>
    with WidgetsBindingObserver {
  final _inputFocus = FocusNode();
  final ValueNotifier<FocusState> _hasFocus =
      ValueNotifier(FocusState(isFocused: true));

  @override
  void initState() {
    super.initState();

    _inputFocus.addListener(
      () {
        _hasFocus.value = FocusState(
          hasText:
              widget.ctrl != null && (widget.ctrl?.text?.isNotEmpty ?? false),
          isFocused: _inputFocus.hasFocus,
        );
      },
    );
  }

  InputDecoration get decoration {
    return InputDecoration(
      filled: false,
      fillColor: XafeColors.fillColor,
      border: UnderlineInputBorder(
        borderSide: BorderSide(
          color: XafeColors.transparent,
          width: 0,
        ),
      ),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: XafeColors.transparent,
          width: 0,
        ),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: XafeColors.transparent,
          width: 0,
        ),
      ),
      errorBorder: UnderlineInputBorder(
        borderSide: BorderSide(
          color: XafeColors.transparent,
          width: 0,
        ),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: XafeColors.transparent,
          width: 0,
        ),
      ),
      labelText: widget?.hintText ?? "",
      labelStyle: TextStyle(
        color: XafeColors.black.withOpacity(.4),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return IgnorePointer(
      ignoring: !(widget?.isEnabled ?? true),
      child: Semantics(
        label: widget?.semanticsLabel ?? "Input Field",
        child: ValueListenableBuilder(
          valueListenable: _hasFocus,
          builder: (context, FocusState value, child) {
            return InkWell(
              onTap: () => FocusScope.of(context).requestFocus(_inputFocus),
              child: Container(
                padding:
                    scaler.insets.symmetric(vertical: value.hasError ? 0 : .5),
                margin: scaler.insets.zero,
                decoration: BoxDecoration(
                  border: Border.all(
                    color: value.hasError
                        ? XafeColors.red
                        : value.isFocused
                            ? XafeColors.blue
                            : XafeColors.grayBorder,
                  ),
                  borderRadius: BorderRadius.circular(
                    scaler.fontSizer.sp(15),
                  ),
                ),
                child: child,
              ),
            );
          },
          child: TextFormField(
            showCursor: true,
            textAlign: widget.textAlign,
            focusNode: _inputFocus,
            onTap: () {
              FocusScope.of(context).requestFocus(_inputFocus);
            },
            textInputAction: widget?.textInputAction ?? TextInputAction.done,
            textCapitalization:
                widget?.textCapitalization ?? TextCapitalization.none,
            style: widget.style ??
                XafeTextStyle.bold.copyWith(
                  fontSize: scaler.fontSizer.sp(55),
                  color: XafeColors.background,
                ),
            maxLength: widget.maxLength,
            controller: widget.ctrl,
            enabled: true,
            obscureText: widget.obscureText,
            keyboardType: widget.keyboardType ?? TextInputType.text,
            inputFormatters: widget.inputFormatters,
            maxLines: widget.maxLines ?? 1,
            cursorColor: XafeColors.black,
            onChanged: widget.onChanged,
            decoration: decoration.copyWith(
              labelStyle: XafeTextStyle.light.copyWith(
                fontSize: scaler.fontSizer.sp(60),
                color: XafeColors.black.withOpacity(.4),
              ),
              suffix: widget.suffix,
              suffixIcon:
                  widget.suffixIcon != null ? widget.suffixIcon : Offstage(),
              prefix: widget.prefix,
              counter: null,
              contentPadding: scaler.insets.symmetric(
                horizontal: 3,
                // vertical: 1.5,
              ),
            ),
            validator: (String text) {
              if (widget.validator != null) {
                final error = widget.validator(text);
                _hasFocus.value = FocusState(
                  hasError: error != null,
                  hasText: _hasFocus?.value?.hasText ?? false,
                  isFocused: _hasFocus?.value?.isFocused ?? false,
                );
                return error;
              }
              _hasFocus.value = FocusState(
                hasError: false,
                hasText: _hasFocus?.value?.hasText ?? false,
                isFocused: _hasFocus?.value?.isFocused ?? false,
              );
              return null;
            },
          ),
        ),
      ),
    );
  }
}
