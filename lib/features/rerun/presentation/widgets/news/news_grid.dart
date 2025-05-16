import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_news_response_model.dart';
import 'package:MONO29/features/rerun/presentation/dialog/rerun_highlight_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsList extends StatelessWidget {
  final List<GeneralData> items;

  const NewsList({super.key, required this.items});

  void _showNewsDetailDialog(
      BuildContext context, String playlistId, String videoId) {
    showCupertinoModalPopup(
      context: context,
      builder: (_) => RerunHighlightDialog(
        playlistId: playlistId,
        videoId: videoId,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      separatorBuilder: (context, index) => SizedBox(
        height: 10,
      ),
      itemCount: items.length,
      itemBuilder: (_, index) {
        GeneralData gridItem = items[index];
        return GestureDetector(
          onTap: () {
            _showNewsDetailDialog(
              context,
              gridItem.pid!,
              gridItem.id.toString(),
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
                    imageUrl: items[index].img ?? '',
                    errorWidget: (_, __, ___) => const Icon(Icons.error),
                    placeholder: (_, __) => Image.asset(
                      'assets/images/default-thumbnail320.jpg',
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
