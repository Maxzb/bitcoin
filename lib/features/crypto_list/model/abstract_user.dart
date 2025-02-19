import 'package:bitcoin/features/crypto_list/model/user.dart';

abstract class AbstractUser {
  Future<List<User>> loadUsers();
}
