import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:flutter_webview_pro/webview_flutter.dart';
import 'package:permission_handler/permission_handler.dart';

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
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
          mediaPlaybackRequiresUserGesture: false, javaScriptEnabled: true),
      ios: IOSInAppWebViewOptions(
          allowsInlineMediaPlayback: true,
          allowsAirPlayForMediaPlayback: true));

  @override
  void initState() {
    super.initState();
    permission();
  }

  Future<void> permission() async {
    // Map<Permission, PermissionStatus> statuses =
    await [
      Permission.camera,
      Permission.storage,
      Permission.bluetooth,
      Permission.microphone
    ].request();
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
        title: const Text('InAppWebView'),
      ),
      body: SizedBox(
        width: 300,
        height: 500,
        child: InAppWebView(
          initialUrlRequest: URLRequest(
            // 'https://foreverspring98.com/mindcatch/index.html'
            url: Uri.parse('https://codepen.io/rocksetta/pen/BPbaxQ'),
          ),
          initialOptions: options,
          androidOnPermissionRequest: (InAppWebViewController controller,
              String origin, List<String> resources) async {
            return PermissionRequestResponse(
                resources: resources,
                action: PermissionRequestResponseAction.GRANT);
          },
          onWebViewCreated: (controller) async {
            // webViewController = controller;
          },
        ),
      ),
    );
  }

  // /// flutter webview pro
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('InAppWebView Example'),
  //     ),
  //     body: Builder(builder: (BuildContext context) {
  //       return WebView(
  //         initialUrl: 'https://foreverspring98.com/mindcatch/index.html',
  //         javascriptMode: JavascriptMode.unrestricted,
  //       );
  //     }),
  //   );
  // }
}
