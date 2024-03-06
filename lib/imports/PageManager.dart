import 'package:flutter/material.dart';

abstract class PageWidget<T> extends Widget{
  final T controller;

  PageWidget(this.controller);
}

class PageManager<T>{
  List<PageWidget<T>> pages;

  PageManager(this.pages);
}