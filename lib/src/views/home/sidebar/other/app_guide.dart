import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewScreen2 extends StatefulWidget {
  final String url =
      'https://developercreatify.blogspot.com/2023/03/nss-jmieti-app-guide.html';

  const WebViewScreen2({super.key});

  //WebViewScreen({ });

  @override
  _WebViewScreen2State createState() => _WebViewScreen2State();
}

class _WebViewScreen2State extends State<WebViewScreen2> {
  bool isLoading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          WebView(
            initialUrl: widget.url,
            javascriptMode: JavascriptMode.unrestricted,
            onPageStarted: (url) {
              setState(() {
                isLoading = true;
              });
            },
            onPageFinished: (url) {
              setState(() {
                isLoading = false;
              });
            },
            onWebViewCreated: (WebViewController webViewController) {},
          ),
          if (isLoading)
            const Center(
              child: CircularProgressIndicator(),
            ),
        ],
      ),
    );
  }
}
