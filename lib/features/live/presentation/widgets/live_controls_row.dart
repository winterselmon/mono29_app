// import 'package:better_player_plus/better_player_plus.dart';
// import 'package:flutter/material.dart';
// import 'package:MONO29/core/constants/app_colors.dart';
// import 'package:MONO29/core/utils/function_widgets.dart';

// class LiveControlsRow extends StatelessWidget {
//   final VoidCallback onBack;
//   final VoidCallback onReplay;
//   final String selectedLanguage;
//   final String selectedQuality;
//   final ValueChanged<String> onLanguageChanged;
//   final ValueChanged<String> onQualityChanged;
//   final BetterPlayerController controller;

//   const LiveControlsRow({
//     super.key,
//     required this.onBack,
//     required this.onReplay,
//     required this.selectedLanguage,
//     required this.selectedQuality,
//     required this.onLanguageChanged,
//     required this.onQualityChanged,
//     required this.controller,
//   });

//   @override
//   Widget build(BuildContext context) {
//     const padding = EdgeInsets.symmetric(vertical: 5, horizontal: 8);
//     const languages = ['TH', 'EN'];
//     const qualities = ['240P', '360P', '720P', '1080P'];

//     return Row(
//       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//       children: [
//         IconButton(
//           onPressed: () {
//             onBack;
//             Navigator.pop(context);
//           },
//           icon: const Icon(Icons.arrow_back_ios),
//         ),
//         Row(
//           children: [
//             GestureDetector(
//               onTap: onReplay,
//               child: Container(
//                 color: Colors.green,
//                 padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
//                 child: const Icon(Icons.replay_outlined,
//                     color: AppColors.whiteColor),
//               ),
//             ),
//             addHorizontalSpace(8),

//             // Language buttons
//             ...languages.map((lang) => GestureDetector(
//                   onTap: () => onLanguageChanged(lang),
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 2),
//                     color: selectedLanguage == lang
//                         ? Colors.blue
//                         : AppColors.forDev1,
//                     padding: padding,
//                     child: Text(
//                       lang,
//                       style: const TextStyle(color: AppColors.whiteColor),
//                     ),
//                   ),
//                 )),

//             addHorizontalSpace(8),

//             // Quality buttons
//             ...qualities.map((quality) => GestureDetector(
//                   onTap: () => onQualityChanged(quality),
//                   child: Container(
//                     margin: const EdgeInsets.symmetric(horizontal: 1),
//                     color: selectedQuality == quality
//                         ? Colors.deepOrange
//                         : AppColors.forDev1,
//                     padding: padding,
//                     child: Text(
//                       quality,
//                       style: const TextStyle(color: AppColors.whiteColor),
//                     ),
//                   ),
//                 )),
//           ],
//         ),
//       ],
//     );
//   }
// }

import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:flutter/material.dart';

class LiveControlsRow extends StatefulWidget {
  final VoidCallback onBack;
  final VoidCallback onReplay;
  final String selectedLanguage;
  final String selectedQuality;
  final ValueChanged<String> onLanguageChanged;
  final ValueChanged<String> onQualityChanged;

  const LiveControlsRow({
    super.key,
    required this.onBack,
    required this.onReplay,
    required this.selectedLanguage,
    required this.selectedQuality,
    required this.onLanguageChanged,
    required this.onQualityChanged,
  });

  @override
  State<LiveControlsRow> createState() => _LiveControlsRowState();
}

class _LiveControlsRowState extends State<LiveControlsRow> {
  @override
  Widget build(BuildContext context) {
    const padding = EdgeInsets.symmetric(vertical: 4, horizontal: 6);
    const languages = ['TH', 'EN'];
    const qualities = ['240P', '360P', '720P', '1080P'];

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          onPressed: widget.onBack,
          icon: const Icon(Icons.arrow_back_ios),
        ),
        Row(
          children: [
            GestureDetector(
              onTap: widget.onReplay,
              child: Container(
                color: AppColors.liveReload,
                padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 6),
                child: const Icon(Icons.replay_outlined,
                    color: AppColors.whiteColor),
              ),
            ),
            addHorizontalSpace(8),

            // Language buttons
            ...languages.map((lang) => GestureDetector(
                  onTap: () => widget.onLanguageChanged(lang),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 2),
                    decoration: BoxDecoration(
                      border: widget.selectedLanguage == lang
                          ? Border.all(color: Colors.white, width: 1)
                          : null,
                      color: lang == 'TH' ? AppColors.liveTH : AppColors.liveEN,
                    ),
                    padding: padding,
                    child: Text(
                      lang,
                      style: TextStyle(
                          color: lang == 'TH'
                              ? AppColors.whiteColor
                              : AppColors.black),
                    ),
                  ),
                )),

            addHorizontalSpace(8),

            // Quality buttons
            ...qualities.map((quality) => GestureDetector(
                  onTap: () => widget.onQualityChanged(quality),
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 1),
                    decoration: BoxDecoration(
                      color: AppColors.liveQualitie,
                      border: widget.selectedQuality == quality
                          ? Border.all(color: Colors.white, width: 1)
                          : null,
                    ),
                    padding: padding,
                    child: Text(
                      quality,
                      style: const TextStyle(color: AppColors.whiteColor),
                    ),
                  ),
                )),
          ],
        ),
      ],
    );
  }
}
