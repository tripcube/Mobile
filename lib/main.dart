import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:firebase_core/firebase_core.dart';

import 'controller/webview_controller.dart';
import 'util/fcmSetting.dart';
import 'controller/location_controller.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  String? firebaseToken = await fcmSetting();

  // 반응형 상태 관리 controller 등록
  Get.put(WebviewMainController());
  WebviewMainController.fcmToken = firebaseToken.toString();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //WebviewMainController의 controller를 호출
    late final controller = WebviewMainController.to.getController();
    // SystemChrome.setEnabledSystemUIOverlays([]);

    return MaterialApp(
      theme: ThemeData(
          appBarTheme: AppBarTheme(
            systemOverlayStyle: SystemUiOverlayStyle.dark,
          )
      ),
      home: WillPopScope(
        child: Scaffold(
          appBar: PreferredSize(
            //앱 바는 필요하지 않았기에 0으로
              preferredSize: const Size.fromHeight(0),
              // elevation = 필요하지 않은 그림자 효과
              child: AppBar(elevation: 0, backgroundColor: Colors.white,)
          ),
          //WebViewWidget에 controller를 parameter로 넘겨준다
          body: WebViewWidget(
              controller: controller,
          ),
        ),
        onWillPop: () {
          var future = controller!.canGoBack();
          future.then((cnaGoBack) {
            if (cnaGoBack) {
              controller!.goBack();
            } else {
              SystemNavigator.pop();
            }
          });
          return Future.value(false);
        },
      ),
    );

  }
}