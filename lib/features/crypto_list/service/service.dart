import 'package:bitcoin/model/user.dart';
import 'package:flutter/services.dart';

import 'dart:convert'; // Для работы с JSON

Future<List<User>> loadUsers() async {
  final jsonString = await rootBundle.loadString('assets/mockData/users.json');
  final List<dynamic> jsonList = jsonDecode(jsonString)['users'];
  return jsonList.map((json) => User.fromJson(json)).toList();
}
