import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '_importer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kIconColor,
        indicatorColor: kIndicatorColor,
        bottomSheetTheme: BottomSheetThemeData(
          backgroundColor: kIconColor,
        ),
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black87)
            .copyWith(background: kBackgroundColor),
      ),
      home: HomePresenter(),
    );
  }
}
