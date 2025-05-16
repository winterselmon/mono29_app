import 'package:MONO29/features/prnews/data/models/prnews_response_model.dart';
import 'package:MONO29/features/prnews/data/prnews_data_source.dart';
import 'package:MONO29/features/prnews/domain/repositories/prnews_repository.dart';

class PrnewsRepositoryImpl implements PrnewsRepository {
  final PrnewsDataSource dataSource;

  PrnewsRepositoryImpl(this.dataSource);

  @override
  Future<PrNewsResponseModel> fetchPrnews() async {
    return await dataSource.fetchPenews();
  }
}
