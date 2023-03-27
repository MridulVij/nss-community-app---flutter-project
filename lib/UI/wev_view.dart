import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webView extends StatefulWidget {
  const webView({super.key});
  //webView({this.url});

  @override
  State<webView> createState() => _webViewState();
}

class _webViewState extends State<webView> {
  final String url1 = 'https://nssjmieti.netlify.app';
  //final url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: WebView(
        initialUrl: url1,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    ));
  }
}

class appGuide extends StatefulWidget {
  const appGuide({super.key});
  //webView({this.url});

  @override
  State<appGuide> createState() => _appGuideState();
}

class _appGuideState extends State<appGuide> {
  final String url2 =
      'https://developercreatify.blogspot.com/2023/03/nss-jmieti-app-guide.html';
  //final url;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: WebView(
        initialUrl: url2,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    ));
  }
}
