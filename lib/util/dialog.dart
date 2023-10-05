import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
class Dialogs {
  static void showExitDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (BuildContext ctx) {
          return AlertDialog(
            content: Text("앱을 종료할까요?"),
            actions: [
              TextButton(
                  onPressed: (){
                    SystemNavigator.pop();
                  },
                  child: Text("예", style: TextStyle(
                    color: Colors.black
                  ),)
              ),
              TextButton(
                  onPressed: (){
                    Navigator.pop(ctx);
                  },
                  child: Text("아니오", style: TextStyle(
                    color: Colors.black
                  ))
              ),
            ],
          );
        }
    );
  }
}