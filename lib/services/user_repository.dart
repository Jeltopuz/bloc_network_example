import 'package:bloc_network_example/models/user.dart';
import 'package:bloc_network_example/services/user_api_provider.dart';

class UsersRepository {
  final _usersProvider = UserProvider();
  Future<List<User>> futureUserList;
  Future<List<User>> getAllUsers() {
    futureUserList ??= _usersProvider.getUser();
    return futureUserList;
  }
}
