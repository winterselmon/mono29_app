import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_news_response_model.dart';
import 'package:MONO29/features/rerun/presentation/dialog/rerun_highlight_dialog.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NewsHighlightList extends StatelessWidget {
  final List<GeneralData> newsList;
  const NewsHighlightList({required this.newsList, super.key});

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
    return Center(
      child: ListView.separated(
        physics: NeverScrollableScrollPhysics(),
        itemCount: newsList.length,
        itemBuilder: (context, index) {
          GeneralData newsHighlight = newsList[index];
          return InkWell(
            onTap: () {
              _showNewsDetailDialog(
                context,
                newsHighlight.pid!,
                newsHighlight.id.toString(),
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
                      imageUrl: newsList[index].img ?? '',
                      errorWidget: (_, __, ___) => const Icon(Icons.error),
                      placeholder: (_, __) => Image.asset(
                        'assets/images/default-thumbnail320.jpg',
                      ),
                    ),
                    addHorizontalSpace(10),
                    Expanded(
                      child: Text(
                        newsList[index].title!,
                        style: TextStyle(color: AppColors.whiteColor),
                      ),
                    )
                  ],
                )),
          );
        },
        separatorBuilder: (context, index) => SizedBox(
          height: 10,
        ),
        shrinkWrap: true,
      ),
    );
  }
}
