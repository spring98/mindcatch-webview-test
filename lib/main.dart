import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
// import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(MaterialApp(
    home: WebViewPage(),
  ));
}

class WebViewPage extends StatefulWidget {
  const WebViewPage({Key? key}) : super(key: key);

  @override
  _WebViewPageState createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  @override
  void initState() {
    super.initState();
    permission();
  }

  Future<void> permission() async {
    // Map<Permission, PermissionStatus> statuses =
    await [Permission.camera, Permission.storage].request();
  }

  /// flutter webview
  // @override
  // Widget build(BuildContext context) {
  //   return const Scaffold(
  //     body: SafeArea(
  //       child: WebView(
  //         // initialUrl: 'https://foreverspring98.com/flutter_rtc/index.html#/',
  //         // initialUrl: 'https://codepen.io/rocksetta/pen/BPbaxQ',
  //         initialUrl: 'https://foreverspring98.com/mindcatch/index.html',
  //
  //         // 'https://webrtc.github.io/samples/src/content/getusermedia/gum/',
  //         // 'http://localhost:61509/',
  //         //'http://localhost:61558/vc7YjlOi2lE=/ws/',
  //         //127.0.0.1:61558/vc7YjlOi2lE=/ws
  //         // initialUrl: 'https://flutter.dev',
  //         javascriptMode: JavascriptMode.unrestricted,
  //       ),
  //     ),
  //   );
  // }

  /// flutter inappview
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InAppWebView Example'),
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
            url: Uri.parse('https://foreverspring98.com/mindcatch/index.html')),
        // initialUrl: "wwww.google.com",
        // onLoadStop: (InAppWebViewController controller, String url) {
        //   if (url == "wwww.google.com") {
        //     //갈곳을 정하고
        //     print("wwww.google.com에 맞는 행동합니다.");
        //     //controller...XXXXX
        //   } else if (url == "wwww.daum.net") {
        //     print("daum.net에 맞는 행동");
        //   }
        // },
        // onWebViewCreated: (InAppWebViewController controller) {
        //   this.controller = controller;
        // },
      ),
    );
  }

  /// flutter webview pro
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('InAppWebView Example'),
  //     ),
  //     body: Builder(builder: (BuildContext context) {
  //       return WebView(
  //         initialUrl: 'https://codepen.io/rocksetta/pen/BPbaxQ',
  //         javascriptMode: JavascriptMode.unrestricted,
  //       );
  //     }),
  //   );
  // }
}
