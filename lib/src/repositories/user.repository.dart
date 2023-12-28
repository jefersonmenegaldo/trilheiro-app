import 'package:trilheiro/src/repositories/base.repository.dart';
import '../models/user.model.dart';
import 'dart:convert' as convert;

class UserRepository extends BaseRepository {
  
  Future<User?> get() async {
    try {
      final response = await dio.get(makeURL('/users'));

      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.data) as Map<String, dynamic>;
        return User.fromJson(jsonResponse);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<User?> login(User user) async {
    try {
      Map<String, dynamic> userData = {
        'email': user.email,
        'password': user.password,
        'device_name': 'app'
      };

      final response = await dio.post(makeURL('/session'), data: userData);

      if (response.statusCode == 200) {
        var jsonResponse = response.data[0];

        return User.fromJson(jsonResponse);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
