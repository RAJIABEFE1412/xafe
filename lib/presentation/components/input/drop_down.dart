import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xafe/styles/colors.dart';
import 'package:xafe/styles/text.dart';

class XafeDropDown extends StatefulWidget {
  @override
  _XafeDropDownState createState() => _XafeDropDownState();
}

class _XafeDropDownState extends State<XafeDropDown> {
  ValueNotifier _value = ValueNotifier('This week');
  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _value,
      builder: (context, future, _) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          decoration: BoxDecoration(
              color: XafeColors.white.withOpacity(0.09),
              borderRadius: BorderRadius.circular(10)),

          // dropdown below..
          child: DropdownButton(
            value: _value.value,
            isDense: true,
            icon: Icon(
              Icons.arrow_drop_down,
              color: XafeColors.white,
            ),
            iconSize: 42,
            underline: SizedBox(),
            onChanged: (newValue) {
              _value.value = newValue;
            },
            dropdownColor: XafeColors.darkGrey.withOpacity(0.09),
            items: <String>['This week', 'Two weeks', 'Three Weeks', 'Four weeks']
                .map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: XafeTextStyle.bold,
                ),
              );
            }).toList(),
          ),
        );
      },
    );
  }
}
