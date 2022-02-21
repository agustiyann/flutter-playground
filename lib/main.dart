import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:km_test/routes/page_route.dart';

import 'package:km_test/screen/first_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'KM Test App',
      home: FirstScreen(),
      getPages: AppPageRoute.pages,
    );
  }
}
