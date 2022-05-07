import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
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

  /// flutter inappview
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InAppWebView'),
      ),
      body: Column(
        children: [
          SizedBox(
            width: 300,
            height: 500,
            child: InAppWebView(
              initialUrlRequest: URLRequest(
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
          Text('inappwebview package 사용')
        ],
      ),
    );
  }
}
