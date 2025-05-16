import 'package:MONO29/features/rerun/presentation/dialog/select_series_dialog.dart';
import 'package:flutter/material.dart';
import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/core/dispatch/rerun_dispatcher.dart';

class SeriesHeader extends StatelessWidget {
  final String currentType;
  final List<String> seriesTypes;

  const SeriesHeader({
    super.key,
    required this.currentType,
    required this.seriesTypes,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            'ตัวอย่างซีรีส์',
            style: TextStyle(color: AppColors.whiteColor),
          ),
          InkWell(
            onTap: () {
              showSeriesTypePickerDialog(
                context: context,
                seriesTypes: seriesTypes,
                currentType: currentType,
                onSelected: (selectedType) {
                  RerunDispatcher.disPatchIsSelectSeries(context, selectedType);
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
