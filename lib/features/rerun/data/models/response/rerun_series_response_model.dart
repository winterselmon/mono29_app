import 'package:json_annotation/json_annotation.dart';

part 'rerun_series_response_model.g.dart';

@JsonSerializable()
class RerunSeriesResposneModel {
  bool? status;
  String? message;
  Data? data;

  RerunSeriesResposneModel({this.status, this.message, this.data});

  RerunSeriesResposneModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  Null n7daySeries;
  List<ThaiSeries>? thaiSeries;
  List<HollywoodSeries>? hollywoodSeries;
  List<ChinaSeries>? chinaSeries;
  List<Anime>? anime;

  Data(
      {this.n7daySeries,
      this.thaiSeries,
      this.hollywoodSeries,
      this.chinaSeries,
      this.anime});

  Data.fromJson(Map<String, dynamic> json) {
    n7daySeries = json['7day_series'];
    if (json['thai_series'] != null) {
      thaiSeries = <ThaiSeries>[];
      json['thai_series'].forEach((v) {
        thaiSeries!.add(ThaiSeries.fromJson(v));
      });
    }
    if (json['hollywood_series'] != null) {
      hollywoodSeries = <HollywoodSeries>[];
      json['hollywood_series'].forEach((v) {
        hollywoodSeries!.add(HollywoodSeries.fromJson(v));
      });
    }
    if (json['china_series'] != null) {
      chinaSeries = <ChinaSeries>[];
      json['china_series'].forEach((v) {
        chinaSeries!.add(ChinaSeries.fromJson(v));
      });
    }
    if (json['anime'] != null) {
      anime = <Anime>[];
      json['anime'].forEach((v) {
        anime!.add(Anime.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['7day_series'] = n7daySeries;
    if (thaiSeries != null) {
      data['thai_series'] = thaiSeries!.map((v) => v.toJson()).toList();
    }
    if (hollywoodSeries != null) {
      data['hollywood_series'] =
          hollywoodSeries!.map((v) => v.toJson()).toList();
    }
    if (chinaSeries != null) {
      data['china_series'] = chinaSeries!.map((v) => v.toJson()).toList();
    }
    if (anime != null) {
      data['anime'] = anime!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ThaiSeries implements SeriesItem {
  @override
  String? id;
  @override
  String? title;
  @override
  int? numclips;
  @override
  String? thumbnailUrl;
  @override
  Channel? channel;
  @override
  String? category;
  @override
  String? hash;
  @override
  String? htmlThumbnail;

  ThaiSeries(
      {this.id,
      this.title,
      this.numclips,
      this.thumbnailUrl,
      this.channel,
      this.category,
      this.hash,
      this.htmlThumbnail});

  ThaiSeries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    numclips = json['numclips'];
    thumbnailUrl = json['thumbnail_url'];
    channel =
        json['channel'] != null ? Channel.fromJson(json['channel']) : null;
    category = json['category'];
    hash = json['hash'];
    htmlThumbnail = json['html_thumbnail'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['numclips'] = numclips;
    data['thumbnail_url'] = thumbnailUrl;
    if (channel != null) {
      data['channel'] = channel!.toJson();
    }
    data['category'] = category;
    data['hash'] = hash;
    data['html_thumbnail'] = htmlThumbnail;
    return data;
  }
}

class HollywoodSeries implements SeriesItem {
  @override
  String? id;
  @override
  String? title;
  @override
  int? numclips;
  @override
  String? thumbnailUrl;
  @override
  Channel? channel;
  @override
  String? category;
  @override
  String? hash;
  @override
  String? htmlThumbnail;

  HollywoodSeries(
      {this.id,
      this.title,
      this.numclips,
      this.thumbnailUrl,
      this.channel,
      this.category,
      this.hash,
      this.htmlThumbnail});

  HollywoodSeries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    numclips = json['numclips'];
    thumbnailUrl = json['thumbnail_url'];
    channel =
        json['channel'] != null ? Channel.fromJson(json['channel']) : null;
    category = json['category'];
    hash = json['hash'];
    htmlThumbnail = json['html_thumbnail'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['numclips'] = numclips;
    data['thumbnail_url'] = thumbnailUrl;
    if (channel != null) {
      data['channel'] = channel!.toJson();
    }
    data['category'] = category;
    data['hash'] = hash;
    data['html_thumbnail'] = htmlThumbnail;
    return data;
  }
}

class ChinaSeries implements SeriesItem {
  @override
  String? id;
  @override
  String? title;
  @override
  int? numclips;
  @override
  String? thumbnailUrl;
  @override
  Channel? channel;
  @override
  String? category;
  @override
  String? hash;
  @override
  String? htmlThumbnail;

  ChinaSeries(
      {this.id,
      this.title,
      this.numclips,
      this.thumbnailUrl,
      this.channel,
      this.category,
      this.hash,
      this.htmlThumbnail});

  ChinaSeries.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    numclips = json['numclips'];
    thumbnailUrl = json['thumbnail_url'];
    channel =
        json['channel'] != null ? Channel.fromJson(json['channel']) : null;
    category = json['category'];
    hash = json['hash'];
    htmlThumbnail = json['html_thumbnail'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['numclips'] = numclips;
    data['thumbnail_url'] = thumbnailUrl;
    if (channel != null) {
      data['channel'] = channel!.toJson();
    }
    data['category'] = category;
    data['hash'] = hash;
    data['html_thumbnail'] = htmlThumbnail;
    return data;
  }
}

class Anime implements SeriesItem {
  @override
  String? id;
  @override
  String? title;
  @override
  int? numclips;
  @override
  String? thumbnailUrl;
  @override
  Channel? channel;
  @override
  String? category;
  @override
  String? hash;
  @override
  String? htmlThumbnail;

  Anime(
      {this.id,
      this.title,
      this.numclips,
      this.thumbnailUrl,
      this.channel,
      this.category,
      this.hash,
      this.htmlThumbnail});

  Anime.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    numclips = json['numclips'];
    thumbnailUrl = json['thumbnail_url'];
    channel =
        json['channel'] != null ? Channel.fromJson(json['channel']) : null;
    category = json['category'];
    hash = json['hash'];
    htmlThumbnail = json['html_thumbnail'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['numclips'] = numclips;
    data['thumbnail_url'] = thumbnailUrl;
    if (channel != null) {
      data['channel'] = channel!.toJson();
    }
    data['category'] = category;
    data['hash'] = hash;
    data['html_thumbnail'] = htmlThumbnail;
    return data;
  }
}

class SeriesItem {
  String? id;
  String? title;
  int? numclips;
  String? thumbnailUrl;
  Channel? channel;
  String? category;
  String? hash;
  String? htmlThumbnail;

  SeriesItem(
      {this.id,
      this.title,
      this.numclips,
      this.thumbnailUrl,
      this.channel,
      this.category,
      this.hash,
      this.htmlThumbnail});

  SeriesItem.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    numclips = json['numclips'];
    thumbnailUrl = json['thumbnail_url'];
    channel =
        json['channel'] != null ? Channel.fromJson(json['channel']) : null;
    category = json['category'];
    hash = json['hash'];
    htmlThumbnail = json['html_thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['numclips'] = numclips;
    data['thumbnail_url'] = thumbnailUrl;
    if (channel != null) {
      data['channel'] = channel!.toJson();
    }
    data['category'] = category;
    data['hash'] = hash;
    data['html_thumbnail'] = htmlThumbnail;
    return data;
  }
}

class Channel {
  ChannelData? data;

  Channel({this.data});

  Channel.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? ChannelData.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ChannelData {
  int? id;
  String? title;
  String? slug;
  String? description;
  String? coverUrl;
  String? logoUrl;

  ChannelData(
      {this.id,
      this.title,
      this.slug,
      this.description,
      this.coverUrl,
      this.logoUrl});

  ChannelData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    slug = json['slug'];
    description = json['description'];
    coverUrl = json['cover_url'];
    logoUrl = json['logo_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['slug'] = slug;
    data['description'] = description;
    data['cover_url'] = coverUrl;
    data['logo_url'] = logoUrl;
    return data;
  }
}
