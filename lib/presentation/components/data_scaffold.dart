import 'package:flutter/material.dart';
import 'package:xafe/presentation/components/spacer.dart';
import 'package:xafe/presentation/components/xafe_text.dart';
import 'package:xafe/styles/colors.dart';
import 'package:xafe/styles/text.dart';
import 'package:xafe/utils/type_defs.dart';
import 'package:xafe/utils/extensions.dart';

import 'form_button.dart';

class DataScaffold extends StatefulWidget {
  final List<Widget> fields;
  final Widget title;
  final Widget leading;
  final String subTitle;
  final String btnText;
  final TextAlign titleAlignment;
  final OnPressed onSubmit;
  final bool isExpanded;
  final OnPressed onBack;
  final Color backgroundColor;
  final bool hideBtn;
  final bool _titleInAppBar;

  DataScaffold({
    @required this.fields,
    @required this.title,
    this.btnText,
    this.onSubmit,
    this.backgroundColor,
    this.onBack,
    this.leading,this.isExpanded = false,
    this.subTitle,
    this.titleAlignment = TextAlign.center,
    this.hideBtn = false,
  })  : assert(fields != null && fields.isNotEmpty),
        assert(title != null),
        _titleInAppBar = false;

  DataScaffold.withAppbar({
    @required this.fields,
    @required this.title,
    this.btnText,
    this.onSubmit,
    this.onBack,this.isExpanded = false,
    this.leading,
    this.backgroundColor,
    this.subTitle,
    this.titleAlignment = TextAlign.center,
    this.hideBtn = false,
  })  : assert(fields != null && fields.isNotEmpty),
        assert(title != null),
        _titleInAppBar = true;

  @override
  State<StatefulWidget> createState() => _DataScaffoldState();
}

class _DataScaffoldState extends State<DataScaffold> {
  final GlobalKey<FormState> formKey = GlobalKey();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final scaler = context.scaler;
    return GestureDetector(
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: widget.backgroundColor,
        body: Form(
          key: formKey,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: widget._titleInAppBar,
                floating: true,
                centerTitle: false,
                elevation: 0,
                backgroundColor: widget.backgroundColor,
                leading: widget.leading,
                title: (widget._titleInAppBar) ? widget.title : null,
              ),
              SliverPadding(
                padding: scaler.insets.symmetric(
                  horizontal: 5,
                ),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      XafeSizedBox(height: 1),
                      if (!widget._titleInAppBar) widget.title,
                      if (widget.subTitle != null) XafeSizedBox(height: 1),
                      if (widget.subTitle != null)
                        XafeText(
                          widget.subTitle,
                          textAlign: widget.titleAlignment,
                          style: XafeTextStyle.light,
                        ),
                    ],
                  ),
                ),
              ),
              SliverPadding(
                padding: scaler.insets.symmetric(
                  horizontal: widget.isExpanded ? 0 :5,
                  vertical: 3,
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (_, idx) {
                      return widget.fields[idx];
                    },
                    childCount: widget?.fields?.length ?? 0,
                  ),
                ),
              ),
              SliverPadding(
                padding: scaler.insets.symmetric(
                  horizontal: 5,
                ),
                sliver: SliverList(
                  delegate: SliverChildListDelegate([
                    XafeSizedBox(height: widget.hideBtn ? 0 : 4),
                    if (!widget.hideBtn)
                      Builder(
                        builder: (context) {
                          return XafeButton(
                            text: widget.btnText,
                            onPressed: widget.onSubmit == null
                                ? null
                                : () {
                                    if (formKey.currentState.validate())
                                      widget.onSubmit();
                                  },
                          );
                        },
                      ),
                    if (!widget.hideBtn) XafeSizedBox(height: 2)
                  ]),
                ),
              ),
            ],
          ),
        ),
      ),
      onTap: () {
        FocusScope.of(context).requestFocus(FocusNode());
      },
    );
  }
}
