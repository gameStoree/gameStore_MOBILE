import 'package:get/get.dart';
import 'package:project/ipconfig.dart';

class LoginProvider extends GetConnect {
  Future<Response> PostUser(var data) {
    var myHeader = {
      'Accept': 'application/json',
    };
    return post('${Ipconfig.baseUrl}/login', data, headers: myHeader);
  }
}
