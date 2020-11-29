import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:task/common_widgets/platfrom_widgets.dart';
import 'package:webview_flutter/webview_flutter.dart';

class PlatformAlertDialog extends PlatFormWidgets {
  PlatformAlertDialog(
      {@required this.title,
      this.cancelActionText,
      this.content,
      this.defaultActionText})
      : assert(title != null);
  final String title;
  final String content;
  final String defaultActionText;
  final String cancelActionText;

  Future<bool> show(BuildContext context) async {
    return Platform.isIOS
        ? await showCupertinoDialog(
            context: context, builder: (context) => this)
        : await showDialog(
            context: context,
            builder: (context) => this,
            barrierDismissible: false,
          );
  }

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoAlertDialog(
      title: Text(title),
      content: Text(content),
      actions: _buildAction(context),
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return AlertDialog(
      title: Text(title),
      content: WebView(
        initialUrl: 'http://inaclick.online/mtc/aboutus/aboutUs',
        javascriptMode: JavascriptMode.unrestricted,
      ),
      actions: _buildAction(context),
    );
  }

  List<Widget> _buildAction(BuildContext context) {
    final actions = <Widget>[];
    if (cancelActionText != null) {
      actions.add(AlertDialogAction(
        child: Text(cancelActionText),
        onPressed: () {
          Navigator.of(context).pop(false);
        },
      ));
    }
//    actions.add(
//      AlertDialogAction(
//        child: Text(defaultActionText),
//        onPressed: () {
//          Navigator.of(context).pop(true);
//        },
//      ),
//    );
    return actions;
  }
}

class AlertDialogAction extends PlatFormWidgets {
  final Widget child;
  final VoidCallback onPressed;

  AlertDialogAction({this.child, this.onPressed});

  @override
  Widget buildCupertinoWidget(BuildContext context) {
    return CupertinoDialogAction(
      child: child,
      onPressed: onPressed,
    );
  }

  @override
  Widget buildMaterialWidget(BuildContext context) {
    return FlatButton(onPressed: onPressed, child: child);
  }
}
