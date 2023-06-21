import 'package:flutter/material.dart';
import '../_importer.dart';

PreferredSizeWidget AppBarWidget(String title) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.transparent,
    title: Text(
      title,
      style: TextStyle(
        color: kTextBrightColor,
      ),
    ),
  );
}