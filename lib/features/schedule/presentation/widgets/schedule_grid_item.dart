import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/features/schedule/data/models/response/schedule_data.dart';
import 'package:MONO29/features/schedule/data/models/response/schedule_item.dart';
import 'package:MONO29/features/schedule/presentation/widgets/schedule_detail_dialog.dart';
import 'package:MONO29/features/schedule/utils/schedule_combiner.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ScheduleGridItem extends StatelessWidget {
  final DailySchedule dailySchedule;

  const ScheduleGridItem({super.key, required this.dailySchedule});

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);

    return GridView.builder(
      itemCount: dailySchedule.items.length,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        childAspectRatio: 0.4,
        crossAxisSpacing: 4,
        mainAxisSpacing: 4,
      ),
      shrinkWrap: true,
      itemBuilder: (context, index) {
        final ScheduleItem scheduleItem = dailySchedule.items[index]!;

        final start = parseClockTime(scheduleItem.startClock, today);
        final end = parseClockTime(scheduleItem.endClock, today);

        final isNow = start != null &&
            end != null &&
            now.isAfter(start) &&
            now.isBefore(end);

        return InkWell(
          onTap: () {
            showDialog(
              context: context,
              builder: (_) =>
                  ScheduleDetailDialog(postId: scheduleItem.programId),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(6),
            width: width,
            decoration: BoxDecoration(
              color:
                  isNow ? AppColors.programHightLighttab : Colors.transparent,
            ),
            child: Stack(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  spacing: 4,
                  children: [
                    CachedNetworkImage(
                      width: width,
                      height: 160,
                      fit: BoxFit.cover,
                      imageUrl: scheduleItem.image2,
                      errorWidget: (_, __, ___) => const Icon(Icons.error),
                      placeholder: (_, __) => Image.asset(
                        'assets/images/default-thumbnail320.jpg',
                      ),
                    ),
                    Text(
                      scheduleItem.startClock,
                      style: TextStyle(
                        color: isNow
                            ? AppColors.whiteColor
                            : AppColors.okButtonCheck,
                        fontSize: 20,
                      ),
                    ),
                    Text(
                      scheduleItem.programName,
                      style: const TextStyle(color: AppColors.whiteColor),
                    ),
                  ],
                ),
                // Positioned(
                //   top: 5,
                //   right: 4,
                //   child: InkWell(
                //     onTap: () {
                //       // Implement notification logic here
                //     },
                //     child: Container(
                //       alignment: Alignment.center,
                //       height: 30,
                //       width: 30,
                //       decoration: BoxDecoration(
                //         shape: BoxShape.circle,
                //         color: AppColors.forDev1.withAlpha(100),
                //       ),
                //       child: const Icon(
                //         Icons.notifications_none,
                //         color: AppColors.iconNotif,
                //       ),
                //     ),
                //   ),
                // ),
              ],
            ),
          ),
        );
      },
    );
  }
}
