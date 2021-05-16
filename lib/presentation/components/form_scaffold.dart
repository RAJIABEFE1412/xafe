import 'package:flutter/material.dart';
import 'package:xafe/presentation/components/spacer.dart';
import 'package:xafe/presentation/components/xafe_text.dart';
import 'package:xafe/styles/colors.dart';
import 'package:xafe/styles/text.dart';
import 'package:xafe/utils/type_defs.dart';
import 'package:xafe/utils/extensions.dart';

import 'form_button.dart';

class FormScaffold extends StatefulWidget {
  final List<Widget> fields;
  final String title;
  final String subTitle;
  final String btnText;
  final TextAlign titleAlignment;
  final OnPressed onSubmit;
  final OnPressed onBack;
  final bool hideBtn;
  final bool _titleInAppBar;

  FormScaffold({
    @required this.fields,
    @required this.title,
    this.btnText,
    this.onSubmit,
    this.onBack,
    this.subTitle,
    this.titleAlignment = TextAlign.center,
    this.hideBtn = false,
  })  : assert(fields != null && fields.isNotEmpty),
        assert(title != null),
        _titleInAppBar = false;

  FormScaffold.withAppbar({
    @required this.fields,
    @required this.title,
    this.btnText,
    this.onSubmit,
    this.onBack,
    this.subTitle,
    this.titleAlignment = TextAlign.center,
    this.hideBtn = false,
  })  : assert(fields != null && fields.isNotEmpty),
        assert(title != null),
        _titleInAppBar = true;

  @override
  State<StatefulWidget> createState() => _FormScaffoldState();
}

class _FormScaffoldState extends State<FormScaffold> {
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
        body: Form(
          key: formKey,
          child: CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: widget._titleInAppBar,
                floating: true,
                centerTitle: true,
                elevation: 0,
                leading: widget.onBack != null
                    ? IconButton(
                        icon: Icon(Icons.arrow_back_ios_outlined),
                        onPressed: widget.onBack)
                    : null,
                title: (widget._titleInAppBar)
                    ? XafeText(
                        widget.title,
                        textAlign: widget.titleAlignment,
                        style: XafeTextStyle.bold.copyWith(
                            fontSize: 44, color: XafeColors.background),
                      )
                    : null,
              ),
              SliverPadding(
                padding: scaler.insets.symmetric(
                  horizontal: 5,
                ),
                sliver: SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      XafeSizedBox(height: 1),
                      if (!widget._titleInAppBar)
                        XafeText(
                          widget.title,
                          textAlign: widget.titleAlignment,
                          style: XafeTextStyle.bold.copyWith(fontSize: 65),
                        ),
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
                  horizontal: 5,
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
