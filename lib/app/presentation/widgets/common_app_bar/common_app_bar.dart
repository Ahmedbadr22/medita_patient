

import 'package:flutter/material.dart';


AppBar commonAppBar({
  String? title,
  PreferredSizeWidget? bottom,
  bool isCenteredTitle = false,
  List<Widget>? actions
}) {
  return AppBar(
      title: title == null ? null : Text(title),
      centerTitle: false,
      actions: actions,
      bottom: bottom,
  );
}