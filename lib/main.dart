import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'controller/webview_controller.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  // 반응형 상태 관리 controller 등록
  Get.put(WebviewMainController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //WebviewMainController의 controller를 호출
    late final controller = WebviewMainController.to.getController();

    return MaterialApp(
      home: Scaffold(
        appBar: PreferredSize(
            //앱 바는 필요하지 않았기에 0으로
            preferredSize: const Size.fromHeight(0),
            // elevation = 필요하지 않은 그림자 효과
            child: AppBar(elevation: 0)),
        //WebViewWidget에 controller를 parameter로 넘겨준다
        body: WebViewWidget(controller: controller),
      ),
    );

  }
}