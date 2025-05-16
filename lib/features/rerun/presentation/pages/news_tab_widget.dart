import 'package:MONO29/core/network/api_service.dart';
import 'package:MONO29/core/utils/function_widgets.dart';
import 'package:MONO29/features/rerun/bloc/rerun_bloc.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_news_response_model.dart';
import 'package:MONO29/features/rerun/data/rerun_data_source.dart';
import 'package:MONO29/features/rerun/data/rerun_repository_impl.dart';
import 'package:MONO29/features/rerun/presentation/widgets/news/news_body.dart';
import 'package:MONO29/features/rerun/presentation/widgets/news/news_grid.dart';
import 'package:MONO29/features/rerun/utils/news_combiner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NewsTabWidget extends StatefulWidget {
  const NewsTabWidget({super.key});

  @override
  State<NewsTabWidget> createState() => _NewsTabWidgetState();
}

class _NewsTabWidgetState extends State<NewsTabWidget> {
  final ApiService _apiService = ApiService();
  RerunNewsResposneModel? _cachedModel;
  List<String> newsTypes = [];
  String currentType = 'ทั้งหมด';
  List<GeneralData> allNewsList = [];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          RerunBloc(RerunRepositoryImpl(RerunDataSource(_apiService)))
            ..add(FetchTabData(2)),
      child: BlocListener<RerunBloc, RerunState>(
        listener: (context, state) {
          if (state is RerunNewsLoaded) {
            _cachedModel = state.rerunNewsResposneModel;
            newsTypes = getNewsType(_cachedModel!);
            allNewsList = getAllNewsCategory(_cachedModel!);
          } else if (state is SelectNewsTypeState) {
            currentType = state.selectedType;
            allNewsList = currentType == 'ทั้งหมด'
                ? getAllNewsCategory(_cachedModel!)
                : getAllNewsCategory(_cachedModel!)
                    .where((item) => item.pterm == currentType)
                    .toList();
          }
        },
        child: BlocBuilder<RerunBloc, RerunState>(
          builder: (context, state) {
            if (_cachedModel == null) {
              return const Center(child: CircularProgressIndicator());
            }

            final newsList = _cachedModel!.data?.highlight ?? [];

            return SingleChildScrollView(
              padding: const EdgeInsets.all(6.0),
              child: Column(
                children: [
                  NewsBody(
                    newsList: newsList,
                    newsTypes: newsTypes,
                    currentType: currentType,
                  ),
                  addVerticalSpace(10),
                  NewsList(items: allNewsList)
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
