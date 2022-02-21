import 'package:get/route_manager.dart';
import 'package:km_test/routes/route_name.dart';
import 'package:km_test/screen/first_screen.dart';
import 'package:km_test/screen/second_screen.dart';
import 'package:km_test/screen/third_screen.dart';

class AppPageRoute {
  static final pages = [
    GetPage(
      name: RouteName.firstScreen,
      page: () => FirstScreen(),
    ),
    GetPage(
      name: RouteName.secondScreen,
      page: () => SecondScreen(),
    ),
    GetPage(
      name: RouteName.thirdScreen,
      page: () => ThirdScreen(),
    ),
  ];
}
