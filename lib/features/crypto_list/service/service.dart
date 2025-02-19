import 'package:bitcoin/features/crypto_list/model/abstract_user.dart';
import 'package:bitcoin/features/crypto_list/model/user.dart';
import 'package:flutter/services.dart';

import 'dart:convert'; // Для работы с JSON

class UsersRepository implements AbstractUser {
  @override
  Future<List<User>> loadUsers() async {
    final jsonString =
        await rootBundle.loadString('assets/mockData/users.json');
    final List<dynamic> jsonList = jsonDecode(jsonString)['users'];
    return jsonList.map((json) => User.fromJson(json)).toList();
  }
}
