
import 'package:json_annotation/json_annotation.dart';

part 'prnews_response_model.g.dart';

@JsonSerializable()
class PrNewsResponseModel {
  bool? status;
  String? message;
  Data? data;

  PrNewsResponseModel({this.status, this.message, this.data});

  PrNewsResponseModel.fromJson(Map<String, dynamic> json) {
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
  List<Promotion>? promotion;
  List<Prnews>? prnews;

  Data({this.promotion, this.prnews});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['promotion'] != null) {
      promotion = <Promotion>[];
      json['promotion'].forEach((v) {
        promotion!.add(Promotion.fromJson(v));
      });
    }
    if (json['prnews'] != null) {
      prnews = <Prnews>[];
      json['prnews'].forEach((v) {
        prnews!.add(Prnews.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (promotion != null) {
      data['promotion'] = promotion!.map((v) => v.toJson()).toList();
    }
    if (prnews != null) {
      data['prnews'] = prnews!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Promotion {
  String? thumbnail;
  String? linkUrl;
  String? name;

  Promotion({this.thumbnail, this.linkUrl, this.name});

  Promotion.fromJson(Map<String, dynamic> json) {
    thumbnail = json['thumbnail'];
    linkUrl = json['link_url'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['thumbnail'] = thumbnail;
    data['link_url'] = linkUrl;
    data['name'] = name;
    return data;
  }
}

class Prnews {
  int? id;
  String? title;
  String? img;
  String? url;

  Prnews({this.id, this.title, this.img, this.url});

  Prnews.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    img = json['img'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['img'] = img;
    data['url'] = url;
    return data;
  }
}
