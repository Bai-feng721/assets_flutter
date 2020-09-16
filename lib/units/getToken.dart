import 'package:shared_preferences/shared_preferences.dart';

// String Token = "";
getToken() async{
  final prefs = await SharedPreferences.getInstance();
  final _token = prefs.getString('token') ?? '空值';
  return _token;
}