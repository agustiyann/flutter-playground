import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';
import 'package:km_test/model/user_list.dart';
import 'package:km_test/model/user_model.dart';
import 'package:km_test/services/api_service.dart';

class ThirdController extends GetxController {
  List<User> users = <User>[];
  bool isLoading = false;
  ApiService apiService = ApiService();
  late UserList userList;

  Future getUsers() async {
    dio.Response response;
    try {
      isLoading = true;
      response = await apiService.getRequest('/api/users?page=1&per_page=12');
      isLoading = false;

      if (response.statusCode == 200) {
        userList = UserList.fromJson(response.data);
        users = userList.data!;
        update();
      } else {
        print('There is some problem from network!');
        update();
      }
    } on Exception catch (e) {
      isLoading = false;
      print(e);
      update();
    }
  }
}
