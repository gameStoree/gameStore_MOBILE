import 'package:get/get.dart';


class LoginProvider extends GetConnect{
  

  Future<Response> PostUser(var data) {
    var myHeader = {
      'Accept' : 'Application/json',
    };
    return post('http://10.0.2.2:8000/api/login', data, headers: myHeader);
  }
    
}