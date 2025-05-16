import 'package:MONO29/features/rerun/data/models/response/rerun_news_response_model.dart';
import 'package:MONO29/features/rerun/data/models/response/rerun_news_single_response_model.dart';

List<GeneralData> getAllNewsCategory(RerunNewsResposneModel model) {
  final List<GeneralData> allTerms = [];

  final newsCategory = model.data?.newsCategory;

  if (newsCategory != null) {
    final allCategories = [
      newsCategory.newsGeneral,
      newsCategory.newsEntertainment,
      newsCategory.newsPolitics,
      newsCategory.newsEconomics,
      newsCategory.newsForeign,
      newsCategory.newsSport,
      newsCategory.newsVarity,
    ];

    for (var category in allCategories) {
      if (category != null && category.isNotEmpty) {
        allTerms.addAll(category);
      }
    }
  }

  return allTerms;
}

List<String> getNewsType(RerunNewsResposneModel model) {
  final List<String> newsCategoryList = [];

  newsCategoryList.add('ทั้งหมด');

  final newsCategory = model.data?.newsCategory;

  if (newsCategory != null) {
    final allCategories = [
      newsCategory.newsGeneral,
      newsCategory.newsEntertainment,
      newsCategory.newsPolitics,
      newsCategory.newsEconomics,
      newsCategory.newsForeign,
      newsCategory.newsSport,
      newsCategory.newsVarity,
    ];

    for (var category in allCategories) {
      if (category != null && category.isNotEmpty) {
        newsCategoryList.add(category.first.pterm!);
      }
    }
  }

  return newsCategoryList;
}

List<RerunNewsItem> parseRelatedItems(Map<String, dynamic> json) {
  final related = json['related'] as Map<String, dynamic>?;

  if (related == null) return [];

  return related.values
      .map((itemJson) =>
          RerunNewsItem.fromJson(itemJson as Map<String, dynamic>))
      .toList();
}
