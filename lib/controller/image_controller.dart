import "package:image_picker/image_picker.dart";
import 'dart:convert';
import 'dart:typed_data';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
final storage = FirebaseStorage.instance;

class imageController {
  static String image_path = "";

  static Future<String> getImage() async{
    // 휴데폰 이미지 경로 변수
    image_path = "";
    final ImagePicker picker = ImagePicker();
    // 이미지 get
    XFile? file = await picker.pickImage(source: ImageSource.gallery);
    if (file == null) return "";
    File userphoto = File(file.path);

    if (userphoto == null) return "";
    // 현재 시간으로 DB에 업로드할 파일이름 정함
    final now = DateTime.now();
    final filename = now.toString();
    try {
      final ref = storage
          .ref()
          .child('commentImages/$filename');
      await ref.putFile(userphoto);
      var url = await ref.getDownloadURL();
      print(url);
      return url;

    } catch (e) {
      print(e);
    }
    return "";
  }
}