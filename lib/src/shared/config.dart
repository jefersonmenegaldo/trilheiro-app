import 'package:flutter_dotenv/flutter_dotenv.dart';

class Config {
  static String get name => _get('title');
  static String get baseUrl => _get('baseUrl');
  static String get enviroment => _get('enviroment');

  static String _get(String name) => dotenv.env[name] ?? '';
}