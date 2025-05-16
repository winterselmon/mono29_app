// lib/core/utils/webview_helper.dart

import 'package:MONO29/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class WebViewHelper {
  static void openInAppWebView(BuildContext context, String url, String title) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => WebViewScreen(
          url: url,
          title: title,
        ),
      ),
    );
  }
}

class WebViewScreen extends StatefulWidget {
  final String url;
  final String title;

  const WebViewScreen({required this.url, required this.title, super.key});

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  double leadingWidth = 150.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.appBar,
          leadingWidth: leadingWidth,
          leading: GestureDetector(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.close,
                    color: AppColors.whiteColor,
                  ),
                ),
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
        ),
        body: InAppWebView(
          initialUrlRequest: URLRequest(url: WebUri(widget.url)),
        ),
      ),
    );
  }
}
