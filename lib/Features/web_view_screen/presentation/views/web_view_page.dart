import 'package:flutter/material.dart';
import 'package:movies_app/core/utils/models/movies_list_model.dart';

import 'package:webview_flutter/webview_flutter.dart';

class WebviewScreen extends StatefulWidget {
  const WebviewScreen({super.key});
  static String id = 'WebVeiw';

  @override
  State<WebviewScreen> createState() => _WebviewScreenState();
}

class _WebviewScreenState extends State<WebviewScreen> {
  late final WebViewController controller;

  @override
  Widget build(BuildContext context) {
     var args = ModalRoute.of(context)!.settings.arguments as Movies ;
    controller = WebViewController()..loadRequest(Uri.parse(args.url ?? ''));

    print('The url is ${args.url}');
    setState(() {});
    return Scaffold(
      
      body: WebViewWidget(controller: controller),
    );
  }
}