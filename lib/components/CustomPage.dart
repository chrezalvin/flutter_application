import 'package:flutter/material.dart';

class CustomPage{
  IconData pageIcon;
  Widget page;
  String pageName;

  CustomPage({IconData? icon, Widget? widget, String? name}):
      page = widget ?? Placeholder(),
      pageName = name ?? "",
      pageIcon = icon ?? Icons.pages;
}