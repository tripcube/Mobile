import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';

class fcmController {
  static Future<void> sendFCMToken(String accessToken, String FCMToken) async{
    print(accessToken);
    Map data = { "fcmToken" : FCMToken };
    var response = await http.post(
      Uri.parse('http://sw.uos.ac.kr:8080/users/fcmToken'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization' : accessToken,
      },
      body: json.encode(data),
    );
    print(response.body.toString());
    print("Response status: ${response.statusCode}");
  }
}