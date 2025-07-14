import 'package:MONO29/features/schedule/bloc/schedule_bloc.dart';
import 'package:MONO29/features/schedule/presentation/widgets/schedule_day_header.dart';
import 'package:MONO29/features/schedule/presentation/widgets/schedule_grid_item.dart';
import 'package:MONO29/features/schedule/utils/schedule_combiner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SchedulePageView extends StatelessWidget {
  const SchedulePageView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ScheduleBloc, ScheduleState>(
      builder: (context, state) {
        if (state is ScheduleLoaded) {
          final allScheduleList = getScheduleList(state.scheduleResponseModel);
          return Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("assets/images/bg-schedule.jpg"),
            //     fit: BoxFit.cover,
            //   ),
            // ),
            child: PageView.builder(
              itemCount: allScheduleList.length,
              itemBuilder: (context, index) {
                final dailySchedule = allScheduleList[index];
                return SingleChildScrollView(
                  child: Column(
                    children: [
                      ScheduleDayHeader(title: dailySchedule.headSchedule),
                      ScheduleGridItem(dailySchedule: dailySchedule),
                    ],
                  ),
                );
              },
            ),
          );
        } else if (state is ScheduleLoading) {
          return const Center(child: CircularProgressIndicator());
        } else {
          return const Center(child: Text('ไม่สามารถโหลดข้อมูลได้'));
        }
      },
    );
  }
}
