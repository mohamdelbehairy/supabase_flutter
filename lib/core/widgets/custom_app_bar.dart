import 'package:flutter/material.dart';

AppBar customAppBar(
    {String? title,
    List<Widget>? actions,
    bool automaticallyImplyLeading = true}) {
  return AppBar(
    title: Text(title ?? "Register"),
    automaticallyImplyLeading: automaticallyImplyLeading,
    actions: actions,
  );
}
