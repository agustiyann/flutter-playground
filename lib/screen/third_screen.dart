import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:km_test/model/user_list.dart';
import 'package:km_test/model/user_model.dart';
import 'package:km_test/services/api_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThirdScreen extends StatefulWidget {
  const ThirdScreen({Key? key}) : super(key: key);

  @override
  State<ThirdScreen> createState() => _ThirdScreenState();
}

class _ThirdScreenState extends State<ThirdScreen> {
  List<User> _users = <User>[];
  bool _isLoading = false;
  late ApiService _apiService;
  late UserList _userList;

  Future getUsers() async {
    Response response;
    try {
      _isLoading = true;
      response = await _apiService.getRequest('/api/users?page=1&per_page=12');
      _isLoading = false;

      if (response.statusCode == 200) {
        setState(() {
          _userList = UserList.fromJson(response.data);
          _users = _userList.data!;
        });
      } else {
        print('There is some problem from network!');
      }
    } on Exception catch (e) {
      _isLoading = false;
      print(e);
    }
  }

  @override
  void initState() {
    super.initState();
    _apiService = ApiService();
    getUsers();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Third Screen',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
              itemCount: _users.length,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () async {
                    final prefs = await SharedPreferences.getInstance();
                    prefs.setString(
                        'selected-user',
                        _users[index].firstName! +
                            ' ' +
                            _users[index].lastName!);
                  },
                  child: Container(
                    height: 80,
                    decoration: const BoxDecoration(
                      border: Border(
                        bottom:
                            BorderSide(width: 0.5, color: Color(0xFFE2E3E4)),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        const SizedBox(width: 18),
                        Container(
                          width: 49,
                          height: 49,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                _users[index].avatar!,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _users[index].firstName! +
                                  ' ' +
                                  _users[index].lastName!,
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              _users[index].email!,
                              textAlign: TextAlign.left,
                              style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
    );
  }
}
