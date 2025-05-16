import 'package:json_annotation/json_annotation.dart';

part 'rerun_news_single_response_model.g.dart';

@JsonSerializable()
class RerunNewsSingleResponseModel {
  final bool status;
  final String message;
  final RerunNewsData data;

  RerunNewsSingleResponseModel({
    required this.status,
    required this.message,
    required this.data,
  });

  factory RerunNewsSingleResponseModel.fromJson(Map<String, dynamic> json) {
    return RerunNewsSingleResponseModel(
      status: json['status'] ?? false,
      message: json['message'] ?? '',
      data: RerunNewsData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() => {
        'status': status,
        'message': message,
        'data': data.toJson(),
      };
}

class RerunNewsData {
  final RerunNewsItem video;
  final List<RerunNewsItem> related;
  final List<RerunNewsItem> highlight;

  RerunNewsData({
    required this.video,
    required this.related,
    required this.highlight,
  });

  factory RerunNewsData.fromJson(Map<String, dynamic> json) {
    return RerunNewsData(
      video: RerunNewsItem.fromJson(json['video'] ?? {}),
      related: (json['related'] as Map<String, dynamic>?)
              ?.values
              .map((e) => RerunNewsItem.fromJson(e))
              .toList() ??
          [],
      highlight: (json['highlight'] as List?)
              ?.map((e) => RerunNewsItem.fromJson(e))
              .toList() ??
          [],
    );
  }

  Map<String, dynamic> toJson() => {
        'video': video.toJson(),
        'related': {
          for (int i = 0; i < related.length; i++) '$i': related[i].toJson()
        },
        'highlight': highlight.map((e) => e.toJson()).toList(),
      };
}

class RerunNewsItem {
  final String id;
  final String title;
  final String img;
  final String url;
  final String youtube;
  final String stream;
  final String pc;
  final String pid;
  final String pterm;
  final String ptitle;
  final String purl;
  final String createDate;

  RerunNewsItem({
    required this.id,
    required this.title,
    required this.img,
    required this.url,
    required this.youtube,
    required this.stream,
    required this.pc,
    required this.pid,
    required this.pterm,
    required this.ptitle,
    required this.purl,
    required this.createDate,
  });

  factory RerunNewsItem.fromJson(Map<String, dynamic> json) {
    return RerunNewsItem(
      id: json['id'].toString(),
      title: json['title'] ?? '',
      img: json['img'] ?? '',
      url: json['url'] ?? '',
      youtube: json['youtube'] ?? '',
      stream: json['stream'] ?? '',
      pc: json['pc'] ?? '',
      pid: json['pid'] ?? '',
      pterm: json['pterm'] ?? '',
      ptitle: json['ptitle'] ?? '',
      purl: json['purl'] ?? '',
      createDate: json['create_date'] ?? '',
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'img': img,
        'url': url,
        'youtube': youtube,
        'stream': stream,
        'pc': pc,
        'pid': pid,
        'pterm': pterm,
        'ptitle': ptitle,
        'purl': purl,
        'create_date': createDate,
      };
}
