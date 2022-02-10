import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:km_test/model/user_model.dart';

Future<List<User>> fetchUsers() async {
  final response = await http.get(Uri.parse('https://reqres.in/api/users'));

  if (response.statusCode == 200) {
    final result = jsonDecode(response.body);
    Iterable list = result['data'];
    return list.map((user) => User.fromJson(user)).toList();
  } else {
    throw Exception('Failed to load users');
  }
}
