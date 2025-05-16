import 'package:MONO29/features/rerun/data/models/response/rerun_series_response_model.dart';

List<SeriesItem> getAllSeries(RerunSeriesResposneModel model) {
  final List<SeriesItem> all = [];
  if (model.data?.thaiSeries != null) all.addAll(model.data!.thaiSeries!);
  if (model.data?.hollywoodSeries != null) {
    all.addAll(model.data!.hollywoodSeries!);
  }
  if (model.data?.chinaSeries != null) all.addAll(model.data!.chinaSeries!);
  if (model.data?.anime != null) all.addAll(model.data!.anime!);
  return all;
}

List<String> getSeriesType(RerunSeriesResposneModel model) {
  final List<String> seriesTypeList = [];

  seriesTypeList.add('ทั้งหมด');

  if (model.data?.thaiSeries != null && model.data!.thaiSeries!.isNotEmpty) {
    seriesTypeList.add(model.data!.thaiSeries![0].category!);
  }

  if (model.data?.hollywoodSeries != null &&
      model.data!.hollywoodSeries!.isNotEmpty) {
    seriesTypeList.add(model.data!.hollywoodSeries![0].category!);
  }

  if (model.data?.chinaSeries != null && model.data!.chinaSeries!.isNotEmpty) {
    seriesTypeList.add(model.data!.chinaSeries![0].category!);
  }

  if (model.data?.anime != null && model.data!.anime!.isNotEmpty) {
    seriesTypeList.add(model.data!.anime![0].category!);
  }

  return seriesTypeList;
}
