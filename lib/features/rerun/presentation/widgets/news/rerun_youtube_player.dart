import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class RerunYoutubePlayer extends StatelessWidget {
  final String youtubeHtml;
  final String type;

  const RerunYoutubePlayer(
      {super.key, required this.youtubeHtml, required this.type});

  @override
  Widget build(BuildContext context) {
    YoutubePlayerController controller = YoutubePlayerController(
      initialVideoId: YoutubePlayer.convertUrlToId(youtubeHtml) ?? '',
      flags: YoutubePlayerFlags(
        autoPlay: true,
      ),
    );

    return SizedBox(
      height: 210,
      child: YoutubePlayer(
        controller: controller,
        showVideoProgressIndicator: true,
      ),
    );
    // return SizedBox(
    //   height: 210,
    //   child: InAppWebView(
    //     initialData: InAppWebViewInitialData(
    //       data: '''
    //         <html>
    //           <head><meta name="viewport" content="width=device-width"></head>
    //           <body style="margin:0;padding:0;">$youtubeHtml</body>
    //         </html>
    //       ''',
    //     ),
    //     initialSettings: InAppWebViewSettings(
    //       javaScriptEnabled: true,
    //       mediaPlaybackRequiresUserGesture: false,
    //     ),
    //   ),
    // );
  }
}
