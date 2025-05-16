import 'package:MONO29/features/live/data/models/video_stream_response_model.dart';

abstract class LiveRepository {
  Future<VideoStreamResponse> fetchStreamFeed();
}
