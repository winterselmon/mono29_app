import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/features/rerun/bloc/rerun_bloc.dart';
import 'package:MONO29/features/rerun/data/rerun_data_source.dart';
import 'package:MONO29/features/rerun/data/rerun_repository_impl.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_series_response_model.dart';
import 'package:MONO29/features/rerun/utils/series_combiner.dart';
import 'package:MONO29/features/rerun/presentation/widgets/series/series_header.dart';
import 'package:MONO29/features/rerun/presentation/widgets/series/series_grid.dart';

class SeriesTabWidget extends StatefulWidget {
  const SeriesTabWidget({super.key});

  @override
  State<SeriesTabWidget> createState() => _SeriesTabWidgetState();
}

class _SeriesTabWidgetState extends State<SeriesTabWidget> {
  final ApiService _apiService = ApiService();
  List<SeriesItem> allTypeList = [];
  List<String> seriesTypes = [];
  String currentType = 'ทั้งหมด';
  RerunSeriesResposneModel? _cachedModel;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) =>
          RerunBloc(RerunRepositoryImpl(RerunDataSource(_apiService)))
            ..add(FetchTabData(1)),
      child: BlocListener<RerunBloc, RerunState>(
        listener: (context, state) {
          if (state is RerunSeriesLoaded) {
            _cachedModel = state.rerunSeriesResposneModel;
            seriesTypes = getSeriesType(_cachedModel!);
            allTypeList = getAllSeries(_cachedModel!);
          } else if (state is SelectSeriesTypeState) {
            currentType = state.selectedType;
            allTypeList = currentType == 'ทั้งหมด'
                ? getAllSeries(_cachedModel!)
                : getAllSeries(_cachedModel!)
                    .where((item) => item.category == currentType)
                    .toList();
          }
        },
        child: BlocBuilder<RerunBloc, RerunState>(
          builder: (context, state) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(6.0),
                child: Column(
                  children: [
                    SeriesHeader(
                      currentType: currentType,
                      seriesTypes: seriesTypes,
                    ),
                    addVerticalSpace(5),
                    SeriesGrid(items: allTypeList),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
