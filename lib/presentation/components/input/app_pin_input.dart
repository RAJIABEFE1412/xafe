import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:xafe/styles/colors.dart';
import 'package:xafe/styles/text.dart';
import 'package:xafe/utils/type_defs.dart';
import 'package:xafe/utils/extensions.dart';

class XafePinInput extends StatefulWidget {
  final TextEditingController controller;
  final OnChanged<String> onChanged;
  final OnChanged<String> onCompleted;
  final bool autoFocus;
  final TextStyle textStyle;

  XafePinInput({
    this.controller,
    this.onChanged,
    @required this.onCompleted,
    this.autoFocus = true,
    this.textStyle,
  }) : assert(onCompleted != null);

  @override
  State<StatefulWidget> createState() {
    return _XafePinInputState();
  }
}

class _XafePinInputState extends State<XafePinInput> {
  FocusNode _primaryFocus = FocusNode();
  TextEditingController _ctrl;

  @override
  void initState() {
    if (widget.controller != null &&
        widget.controller.text != null &&
        widget.controller.text.isNotEmpty) {
      widget.controller.value = TextEditingValue.empty;
    }
    _ctrl = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;

    return Table(
      defaultVerticalAlignment: TableCellVerticalAlignment.middle,
      columnWidths: {
        0: FlexColumnWidth(.5),
        1: FlexColumnWidth(9),
        2: FlexColumnWidth(.5),
      },
      children: [
        TableRow(
          children: [
            SizedBox(),
            PinCodeTextField(
              autoDisposeControllers: false,
              focusNode: _primaryFocus,
              obsecureText: false,
              controller: _ctrl,
              textStyle: XafeTextStyle.bold.copyWith(
                fontSize: scaler.fontSizer.sp(80),
              ),
              autoFocus: widget.autoFocus,
              length: 6,
              borderWidth: scaler.sizer.setHeight(.1),
              activeColor: XafeColors.transparent,
              selectedColor: XafeColors.black,
              inactiveColor: XafeColors.black.withOpacity(.4),
              shape: PinCodeFieldShape.underline,
              backgroundColor: XafeColors.white,
              borderRadius: BorderRadius.zero,
              onChanged: (val) {
                if (widget.onChanged != null) {
                  widget.onChanged(val);
                }
                if (widget.controller != null) {
                  widget.controller.text = val;
                }
              },
              onCompleted: (val) {
                FocusScope.of(context).requestFocus(FocusNode());
                if (widget.controller != null) {
                  widget.controller.text = val;
                }
                if (widget.onCompleted != null) {
                  widget.onCompleted(val);
                }
              },
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              textInputType: TextInputType.number,
            ),
            SizedBox(),
          ],
        )
      ],
    );
  }
}
