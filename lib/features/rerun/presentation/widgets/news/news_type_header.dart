import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/dispatch/rerun_dispatcher.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/features/rerun/presentation/dialog/select_news_dialog.dart';
import 'package:flutter/material.dart';

class NewsTypeHeader extends StatelessWidget {
  final String currentType;
  final List<String> newsTypes;

  const NewsTypeHeader({
    super.key,
    required this.currentType,
    required this.newsTypes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'ประเภทข่าว',
            style: TextStyle(color: AppColors.whiteColor),
          ),
          InkWell(
            onTap: () {
              showNewsTypePickerDialog(
                context: context,
                newsTypes: newsTypes,
                currentType: currentType,
                onSelected: (selectedType) {
                  RerunDispatcher.disPatchIsSelectNewsType(
                      context, selectedType);
                },
              );
            },
            child: Container(
              color: AppColors.whiteColor,
              padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
              child: Row(
                children: [
                  Text(currentType),
                  addHorizontalSpace(5),
                  const Icon(Icons.keyboard_arrow_down),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
