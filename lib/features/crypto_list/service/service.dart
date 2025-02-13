import 'package:bitcoin/model/user.dart';

import 'dart:convert'; // Для работы с JSON
import 'package:http/http.dart' as http;

Future<List<User>> fetchUsers() async {
  final response =
      await http.get(Uri.parse('https://jsonplaceholder.typicode.com/users'));

  if (response.statusCode == 200) {
    // Если запрос успешен, преобразуем JSON в список объектов User
    List<dynamic> data = jsonDecode(response.body);
    return data.map((json) => User.fromJson(json)).toList();
  } else {
    // Если запрос не удался, выбрасываем исключение
    throw Exception('Не удалось загрузить данные');
  }
}
