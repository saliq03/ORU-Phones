import 'package:shared_preferences/shared_preferences.dart';

class UserPreferences {
  setLoginKey(bool value) async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setBool('isLogin', value);
  }
  Future<bool> isLogin() async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    bool? loginKey= sp.getBool('isLogin');
    if(loginKey==true) {
      return true;
    } else {
      return false;
    }
  }

   saveUserName(String name) async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setString("name",name);
  }

  Future<String?>  getUserName() async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    final name=sp.getString("name");
    return name;
  }
  saveCookie(String cookie) async {

    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setString("cookie",cookie);
  }
  Future<String?>  getCookie() async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    final cookie=sp.getString("cookie");
    print('cookie retrieed');
    print(cookie);
    return cookie;
  }
  saveCsrfToken(String token)async{
    print('csrf saved');
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.setString("csrfToken",token);
  }
  Future<String?>  getCsrfToken() async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    final token=sp.getString("csrfToken");
    return token;
  }



  Future<bool> removeUser() async {
    SharedPreferences sp=await SharedPreferences.getInstance();
    sp.clear();
    return true;
  }
}