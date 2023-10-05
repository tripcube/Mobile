import "package:image_picker/image_picker.dart";
import 'dart:convert';
import 'dart:typed_data';

class imageController {
  static Future<String> getImage() async{
    final ImagePicker picker = ImagePicker();
    XFile? file = await picker.pickImage(source: ImageSource.gallery);

    if (file != null) {
      Uint8List bytes = await file.readAsBytes();
      String base64 = base64Encode(bytes);
      return base64;
    }
    return "";
  }
}