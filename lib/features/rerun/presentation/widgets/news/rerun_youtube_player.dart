import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class RerunYoutubePlayer extends StatelessWidget {
  final String youtubeHtml;

  const RerunYoutubePlayer({super.key, required this.youtubeHtml});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 210,
      child: InAppWebView(
        initialData: InAppWebViewInitialData(
          data: '''
            <html>
              <head><meta name="viewport" content="width=device-width"></head>
              <body style="margin:0;padding:0;">$youtubeHtml</body>
            </html>
          ''',
        ),
        initialSettings: InAppWebViewSettings(
          javaScriptEnabled: true,
          mediaPlaybackRequiresUserGesture: false,
        ),
      ),
    );
  }
}
