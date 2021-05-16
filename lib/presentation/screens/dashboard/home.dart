import 'package:flutter/material.dart';
import 'package:xafe/presentation/components/data_scaffold.dart';
import 'package:xafe/presentation/components/edit_pencil.dart';
import 'package:xafe/presentation/components/form_scaffold.dart';
import 'package:xafe/presentation/components/input/drop_down.dart';
import 'package:xafe/presentation/components/spacer.dart';
import 'package:xafe/styles/colors.dart';

class Home extends StatelessWidget {

 BoxDecoration get decor => BoxDecoration(
              color: XafeColors.white,
              borderRadius: BorderRadius.vertical(top: Radius.circular(40)));
  @override
  Widget build(BuildContext context) {
    return DataScaffold(
      isExpanded: true,
      fields: [
        XafeSizedBox(
          height: 20,
        ),
        Container(
          height: 500,
          decoration: decor,
        ),
      ],
      hideBtn: true,
      title: Row(
        children: [
          XafeDropDown(),
          Spacer(),
          XafeEditPencil(),
        ],
      ),
      backgroundColor: XafeColors.blue,
    );
  }
}
