import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_news_response_model.dart';
import 'package:MONO29/features/rerun/presentation/widgets/news/news_highlight_list.dart';
import 'package:MONO29/features/rerun/presentation/widgets/news/news_type_header.dart';
import 'package:flutter/material.dart';

class NewsBody extends StatelessWidget {
  final List<GeneralData> newsList;
  final List<String> newsTypes;
  final String currentType;

  const NewsBody(
      {required this.newsList,
      required this.newsTypes,
      required this.currentType,
      super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        NewsHighlightList(
          newsList: newsList,
        ),
        addVerticalSpace(10),
        Text(
          'รายการข่าว',
          style: TextStyle(color: AppColors.whiteColor),
        ),
        addVerticalSpace(6),
        NewsTypeHeader(
          currentType: currentType,
          newsTypes: newsTypes,
        ),
      ],
    );
  }
}
