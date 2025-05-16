import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:MONO29/core/constants/app_colors.dart';
import 'package:MONO29/core/constants/width_height.dart';
import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/features/schedule/bloc/schedule_bloc.dart';
import 'package:MONO29/features/schedule/data/schedule_data_source.dart';
import 'package:MONO29/features/schedule/data/schedule_repository_impl.dart';
import 'package:MONO29/features/schedule/presentation/widgets/schedule_page_view.dart';
import 'package:MONO29/widgets/custom_app_bar.dart';

class ScheduleScreen extends StatelessWidget {
  const ScheduleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ScheduleBloc(
        ScheduleRepositoryImpl(
          ScheduleDataSource(ApiService()),
        ),
      )..add(FetchScheduleEvent()),
      child: Scaffold(
        backgroundColor: AppColors.hightlightScreen,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(WidthHeight.appBarHeight),
          child: const CustomAppBar(
            title: 'ผังรายการ',
            currentIndex: 3,
          ),
        ),
        body: const SchedulePageView(),
      ),
    );
  }
}
