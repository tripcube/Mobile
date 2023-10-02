import 'package:http/http.dart' as http;
import 'dart:convert';

class fcmController {
  static Future<void> sendFCMToken(String accessToken, String FCMToken) async{
    var response = await http.post(
      Uri.parse('http://sw.uos.ac.kr:8080/users/fcmToken'),
      headers: <String, String>{
        'Content-Type': 'application/json',
        'Authorization' : accessToken,
      },
      body: jsonEncode({
        "fcmToken", FCMToken
      }),
    );
    print(response.body.toString());
  }
}