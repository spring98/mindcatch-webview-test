// import 'dart:io';
//
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
//
//
// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//
//   if (Platform.isAndroid) {
//     await AndroidInAppWebViewController.setWebContentsDebuggingEnabled(true);
//   }
//
//   runApp(MaterialApp(home: MyApp()));
// }
//
// class MyChromeSafariBrowser extends ChromeSafariBrowser {
//   @override
//   void onOpened() {
//     print("ChromeSafari browser opened");
//   }
//
//   @override
//   void onCompletedInitialLoad() {
//     print("ChromeSafari browser initial load completed");
//   }
//
//   @override
//   void onClosed() {
//     print("ChromeSafari browser closed");
//   }
// }
//
//
// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => new _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   final ChromeSafariBrowser browser = MyChromeSafariBrowser();
//
//   @override
//   void initState() {
//     super.initState();
//     browser.addMenuItem(ChromeSafariBrowserMenuItem(
//         id: 1,
//         label: 'Custom item menu 1',
//         action: (url, title) {
//           print('Custom item menu 1 clicked!');
//         }));
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('ChromeSafariBrowser Example'),
//       ),
//       body: Center(
//         child: ElevatedButton(
//             onPressed: () async {
//               await browser.open(
//                   url: Uri.parse(
//                       'https://foreverspring98.com/mindcatch/index.html'),
//                   options: ChromeSafariBrowserClassOptions(
//                       android: AndroidChromeCustomTabsOptions(
//                           shareState: CustomTabsShareState.SHARE_STATE_OFF),
//                       ios: IOSSafariOptions(barCollapsingEnabled: true)));
//             },
//             child: Text("Open Chrome Safari Browser")),
//       ),
//     );
//   }
// }
