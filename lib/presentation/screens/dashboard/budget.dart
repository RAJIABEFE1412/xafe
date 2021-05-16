import 'package:flutter/material.dart';
import 'package:xafe/presentation/components/budget_card.dart';
import 'package:xafe/presentation/components/data_scaffold.dart';
import 'package:xafe/presentation/components/spacer.dart';
import 'package:xafe/presentation/components/xafe_text.dart';
import 'package:xafe/styles/colors.dart';
import 'package:xafe/styles/text.dart';
import 'package:xafe/utils/dimen.dart';
import 'package:xafe/utils/extensions.dart';

class Budget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final sizer = context.scaler;
    return DataScaffold(
      fields: [
        XafeSizedBox(
          height: sizer.sizer.height - 120,
          child: GridView.builder(
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, childAspectRatio: 1.78),
            itemCount: 5,
            itemBuilder: (context, index) => XafeBudgetCard(
              length: index * 2,
            ),
          ),
        )
      ],
      hideBtn: true,
      title: Text(
        '‍💻 Budgets',
        style: XafeTextStyle.bold.copyWith(
          fontSize: XafeFontSizer(context).sp(60),
        ),
      ),
      backgroundColor: XafeColors.blue,
    );
  }
}
