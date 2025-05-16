import 'package:MONO29/features/live/data/live_data_source.dart';
import 'package:MONO29/features/live/data/models/video_stream_response_model.dart';
import 'package:MONO29/features/live/domain/repositories/live_repository.dart';

class LiveRepositoryImpl extends LiveRepository {
  late final LiveDataSource _dataSource;

  LiveRepositoryImpl(this._dataSource);

  @override
  Future<VideoStreamResponse> fetchStreamFeed() async {
    return await _dataSource.streamFeed();
  }
}
