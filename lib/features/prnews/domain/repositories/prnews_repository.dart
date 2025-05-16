import 'package:MONO29/features/prnews/data/models/prnews_response_model.dart';

abstract class PrnewsRepository {
  Future<PrNewsResponseModel> fetchPrnews();
}
