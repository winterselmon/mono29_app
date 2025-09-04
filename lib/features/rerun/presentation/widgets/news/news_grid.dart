import 'package:MONO29/core/analytics/analytics_service.dart';
import 'package:MONO29/core/analytics/injection.dart';
import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_yt_playlist_response_model.dart';
import 'package:MONO29/features/rerun/presentation/dialog/rerun_yt_news_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  final List<YtPlaylistData> items;

  const NewsList({super.key, required this.items});

  void _showNewsDetailDialog(
      BuildContext context, YtPlaylistData ytPlaylistData, String type) {
    showCupertinoModalPopup(
      context: context,
      builder: (context) => RerunYtNewsDialog(
        ytPlaylistData: ytPlaylistData,
        type: type,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final analytics = getIt<AnalyticsService>();

    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => SizedBox(
        height: 10,
      ),
      itemCount: items.length,
      itemBuilder: (_, index) {
        YtPlaylistData gridItem = items[index];
        return GestureDetector(
          onTap: () {
            analytics.logEvent('tab_rerun_news_detail', parameters: {
              'news_id': items[index].videoId ?? '',
              'news_title': items[index].title ?? '',
            });
            _showNewsDetailDialog(
              context,
              gridItem,
              'video',
            );
          },
          child: Container(
              height: 110,
              width: double.infinity,
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Row(
                children: [
                  CachedNetworkImage(
                    width: 160,
                    fit: BoxFit.cover,
                    imageUrl: items[index].thumbnails ?? '',
                    errorWidget: (_, __, ___) => const Icon(Icons.error),
                    placeholder: (_, __) => Image.asset(
                      'assets/images/Mono_29_Logo.png',
                    ),
                  ),
                  addHorizontalSpace(10),
                  Expanded(
                    child: Text(
                      '${items[index].title}',
                      style: TextStyle(color: AppColors.whiteColor),
                    ),
                  )
                ],
              )),
        );
      },
    );
  }
}
