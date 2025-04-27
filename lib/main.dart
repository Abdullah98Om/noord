import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await InAppWebViewController.setWebContentsDebuggingEnabled(true);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WebViewPage(),
    );
  }
}

class WebViewPage extends StatefulWidget {
  const WebViewPage({super.key});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late InAppWebViewController webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("موقعي"),
        centerTitle: true,
        backgroundColor: Colors.teal,
      ),
      body: InAppWebView(
        initialUrlRequest: URLRequest(
          url: WebUri.uri(
              Uri.parse("https://noord-store.com")), // ← غيّرها إلى رابطك
        ),
        onWebViewCreated: (controller) {
          webViewController = controller;
        },
        onLoadStart: (controller, url) {
          debugPrint("بدأ التحميل: $url");
        },
        onLoadStop: (controller, url) {
          debugPrint("اكتمل التحميل: $url");
        },
      ),
    );
  }
}
