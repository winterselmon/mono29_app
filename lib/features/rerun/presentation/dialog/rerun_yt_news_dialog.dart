// import 'package:MONO29/core/constants/app_colors.dart';
// import 'package:MONO29/core/constants/width_height.dart';
// import 'package:MONO29/core/utils/function_widgets.dart';
// import 'package:MONO29/features/rerun/data/models/response/rerun_yt_highlight_response_model.dart';
// import 'package:MONO29/features/rerun/presentation/widgets/news/rerun_youtube_player.dart';
// import 'package:flutter/material.dart';

// class RerunYtHighlightDialog extends StatelessWidget {
//   final RerunYtVideo rerunYtModel;
//   final String type;

//   const RerunYtHighlightDialog(
//       {super.key, required this.rerunYtModel, required this.type});

//   @override
//   Widget build(BuildContext context) {
//     return _RerunHighlightView();
//   }
// }

// class _RerunHighlightView extends StatelessWidget {
//   const _RerunHighlightView();

//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         backgroundColor: AppColors.hightlightScreen,
//         appBar: AppBar(
//           backgroundColor: AppColors.appBar,
//           leadingWidth: 150,
//           centerTitle: true,
//           actionsPadding: const EdgeInsets.symmetric(horizontal: 10),
//           leading: GestureDetector(
//             child: Row(
//               children: [
//                 IconButton(
//                   onPressed: () {
//                     Navigator.pop(context);
//                   },
//                   icon: Icon(
//                     Icons.arrow_back,
//                     color: AppColors.whiteColor,
//                   ),
//                 ),
//                 Text(
//                   '',
//                   style: TextStyle(
//                     fontSize: 18,
//                     color: AppColors.whiteColor,
//                   ),
//                 ),
//               ],
//             ),
//           ),
//           title: const Text('', style: TextStyle(color: AppColors.whiteColor)),
//           actions: [
//             Image.asset(
//               'assets/images/Mono_29_Logo.png',
//               width: WidthHeight.iconWidth,
//               height: WidthHeight.iconHeight,
//             ),
//           ],
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.symmetric(horizontal: 20),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               addVerticalSpace(20),
//               RerunYoutubePlayer(youtubeHtml: ''),
//               addVerticalSpace(10),
//               Text('tsetsetkspeoktspoektposketposkeptoksepotspoetkposektpo',
//                   style: const TextStyle(
//                     fontSize: 16,
//                     fontWeight: FontWeight.bold,
//                     color: AppColors.okButtonNotcheck,
//                   )),
//             ]),
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/constants/width_height.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_yt_playlist_response_model.dart';
import 'package:MONO29/features/rerun/presentation/widgets/news/rerun_youtube_player.dart';
import 'package:flutter/material.dart';

class RerunYtNewsDialog extends StatelessWidget {
  final YtPlaylistData ytPlaylistData;
  final String type;

  const RerunYtNewsDialog(
      {super.key, required this.ytPlaylistData, required this.type});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: AppColors.hightlightScreen,
        appBar: AppBar(
          backgroundColor: AppColors.appBar,
          leadingWidth: 150,
          centerTitle: true,
          actionsPadding: const EdgeInsets.symmetric(horizontal: 10),
          leading: GestureDetector(
            child: Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Icon(
                    Icons.arrow_back,
                    color: AppColors.whiteColor,
                  ),
                ),
                Text(
                  '',
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.whiteColor,
                  ),
                ),
              ],
            ),
          ),
          title: const Text('', style: TextStyle(color: AppColors.whiteColor)),
          actions: [
            Image.asset(
              'assets/images/Mono_29_Logo.png',
              width: WidthHeight.iconWidth,
              height: WidthHeight.iconHeight,
            ),
          ],
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              addVerticalSpace(20),
              Text(ytPlaylistData.title ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.okButtonNotcheck,
                  )),
              addVerticalSpace(20),
              RerunYoutubePlayer(
                  youtubeHtml: ytPlaylistData.url ?? '', type: type),
              addVerticalSpace(20),
              Text(ytPlaylistData.description ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    color: AppColors.whiteColor,
                  )),
            ]),
          ),
        ),
      ),
    );
  }
}
