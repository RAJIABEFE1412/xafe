import 'package:flutter/material.dart';
import 'package:xafe/presentation/components/spacer.dart';
import 'package:xafe/presentation/components/xafe_text.dart';
import 'package:xafe/styles/colors.dart';

import 'app_loader.dart';
import '../form_button.dart';

enum MessageType {
  Error,
  Warning,
  Success,
  Info,
  Pending,
}

class DialogMessage extends StatelessWidget {
  final dynamic message;
  final MessageType messageType;
  final TextAlign textAlign;
  final bool _isConfirm;

  DialogMessage({
    @required this.message,
    this.messageType = MessageType.Info,
    this.textAlign = TextAlign.center,
  }) : _isConfirm = false;

  DialogMessage.confirm({
    @required this.message,
    this.messageType = MessageType.Info,
    this.textAlign = TextAlign.center,
  }) : _isConfirm = true;

  String _parsedMessage() {
    if (message is String) {
      return message;
    } else if (message is Map || message is List) {
      final List<String> messageArr = message is Map
          ? message.values.map((it) => "$it").toList()
          : message.map((it) => "$it").toList();
      return messageArr.join("; ");
    } else {
      return "";
    }
  }

  Widget _messageIcon() {
    switch (messageType) {
      case MessageType.Error:
        return Icon(
          Icons.error_outline,
          size: 30,
          color: XafeColors.red,
        );
        break;
      case MessageType.Success:
        return Icon(
          Icons.sentiment_satisfied,
          size: 30,
          color: XafeColors.green,
        );
        break;
      case MessageType.Warning:
        return Icon(
          Icons.warning,
          size: 30,
          color: XafeColors.red.withGreen(100),
        );
        break;
      case MessageType.Pending:
        return const Apploader();
        break;
      default:
        return Icon(
          Icons.notifications,
          size: 30,
          color: XafeColors.black,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: _isConfirm ? CrossAxisAlignment.stretch : CrossAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        if (!_isConfirm)
        _messageIcon(),
        const XafeSizedBox(height: 1),
        Flexible(
          child: XafeText(
            _parsedMessage(),
            textAlign: TextAlign.center,
          ),
        ),
        if (_isConfirm) const XafeSizedBox(height: 3),
        if (_isConfirm)
          XafeButton(
            text: "Proceed",
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          )
      ],
    );
  }
}
