import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SecondController extends GetxController {
  var selectedUser = "";

  void loadSelectedUser() async {
    final prefs = await SharedPreferences.getInstance();
    selectedUser = prefs.getString('selected-user') ?? 'Selected User Name';
    update();
  }
}
