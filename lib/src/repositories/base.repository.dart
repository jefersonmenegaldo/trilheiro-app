import 'package:dio/dio.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:trilheiro/src/app.widget.dart';
import 'package:trilheiro/src/shared/interceptor/auth.interceptor.dart';
import 'package:trilheiro/src/shared/state/user_state.dart';
import '../shared/config.dart';

class BaseRepository {
  late Dio dio;
  
  BaseRepository() : dio = Dio() {
    final context = scaffoldMessengerKey.currentContext!;
    final user = Provider.of<UserState>(context, listen: false).user;
    if (user?.token != '' &&  user?.token != null) {
      dio.interceptors.add(AuthInterceptor(user!.token!));
    }
  }

  Future<String> _getToken() async {
    var prefs = await SharedPreferences.getInstance();
    return prefs.getString('token') ?? '';
  }

  makeURL(String endpoint) {
    return Config.baseUrl + endpoint;
  }

  Future<Map<String, String>> makeAuth() async {
    String token = await _getToken();
    return {
      "Content-Type": "application/json",
      "Authorization": "Bearer $token"
    };
  }
}
