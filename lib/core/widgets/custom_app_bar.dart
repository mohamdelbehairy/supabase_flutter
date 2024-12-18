import 'package:flutter/material.dart';

AppBar customAppBar({String? title, List<Widget>? actions}) {
  return AppBar(
    title: Text(title ?? "Register"),
    actions: actions,
  );
}
