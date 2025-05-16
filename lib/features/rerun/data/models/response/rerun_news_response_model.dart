import 'package:json_annotation/json_annotation.dart';

part 'rerun_news_response_model.g.dart';

@JsonSerializable()
class RerunNewsResposneModel {
  bool? status;
  String? message;
  Data? data;

  RerunNewsResposneModel({this.status, this.message, this.data});

  RerunNewsResposneModel.fromJson(Map<String, dynamic> json) {
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
  List<GeneralData>? highlight;
  List<GeneralData>? newsPrograms;
  NewsCategory? newsCategory;

  Data({this.highlight, this.newsPrograms, this.newsCategory});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['highlight'] != null) {
      highlight = <GeneralData>[];
      json['highlight'].forEach((v) {
        highlight!.add(GeneralData.fromJson(v));
      });
    }
    if (json['news_programs'] != null) {
      newsPrograms = <GeneralData>[];
      json['news_programs'].forEach((v) {
        newsPrograms!.add(GeneralData.fromJson(v));
      });
    }
    newsCategory = json['news_category'] != null
        ? NewsCategory.fromJson(json['news_category'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (highlight != null) {
      data['highlight'] = highlight!.map((v) => v.toJson()).toList();
    }
    if (newsPrograms != null) {
      data['news_programs'] = newsPrograms!.map((v) => v.toJson()).toList();
    }
    if (newsCategory != null) {
      data['news_category'] = newsCategory!.toJson();
    }
    return data;
  }
}

class GeneralData {
  int? id;
  String? title;
  String? img;
  String? url;
  String? youtube;
  String? stream;
  String? pc;
  String? pid;
  String? pterm;
  String? ptitle;
  String? purl;
  String? createDate;

  GeneralData(
      {this.id,
      this.title,
      this.img,
      this.url,
      this.youtube,
      this.stream,
      this.pc,
      this.pid,
      this.pterm,
      this.ptitle,
      this.purl,
      this.createDate});

  GeneralData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    img = json['img'];
    url = json['url'];
    youtube = json['youtube'];
    stream = json['stream'];
    pc = json['pc'];
    pid = json['pid'];
    pterm = json['pterm'];
    ptitle = json['ptitle'];
    purl = json['purl'];
    createDate = json['create_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['img'] = img;
    data['url'] = url;
    data['youtube'] = youtube;
    data['stream'] = stream;
    data['pc'] = pc;
    data['pid'] = pid;
    data['pterm'] = pterm;
    data['ptitle'] = ptitle;
    data['purl'] = purl;
    data['create_date'] = createDate;
    return data;
  }
}

class NewsCategory {
  List<GeneralData>? newsGeneral;
  List<GeneralData>? newsEntertainment;
  List<GeneralData>? newsPolitics;
  List<GeneralData>? newsEconomics;
  List<GeneralData>? newsForeign;
  List<GeneralData>? newsSport;
  List<GeneralData>? newsVarity;

  NewsCategory(
      {this.newsGeneral,
      this.newsEntertainment,
      this.newsPolitics,
      this.newsEconomics,
      this.newsForeign,
      this.newsSport,
      this.newsVarity});

  NewsCategory.fromJson(Map<String, dynamic> json) {
    if (json['news_general'] != null) {
      newsGeneral = <GeneralData>[];
      json['news_general'].forEach((v) {
        newsGeneral!.add(GeneralData.fromJson(v));
      });
    }
    if (json['news_entertainment'] != null) {
      newsEntertainment = <GeneralData>[];
      json['news_entertainment'].forEach((v) {
        newsEntertainment!.add(GeneralData.fromJson(v));
      });
    }
    if (json['news_politics'] != null) {
      newsPolitics = <GeneralData>[];
      json['news_politics'].forEach((v) {
        newsPolitics!.add(GeneralData.fromJson(v));
      });
    }
    if (json['news_economics'] != null) {
      newsEconomics = <GeneralData>[];
      json['news_economics'].forEach((v) {
        newsEconomics!.add(GeneralData.fromJson(v));
      });
    }
    if (json['news_foreign'] != null) {
      newsForeign = <GeneralData>[];
      json['news_foreign'].forEach((v) {
        newsForeign!.add(GeneralData.fromJson(v));
      });
    }
    if (json['news_sport'] != null) {
      newsSport = <GeneralData>[];
      json['news_sport'].forEach((v) {
        newsSport!.add(GeneralData.fromJson(v));
      });
    }
    if (json['news_varity'] != null) {
      newsVarity = <GeneralData>[];
      json['news_varity'].forEach((v) {
        newsVarity!.add(GeneralData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (newsGeneral != null) {
      data['news_general'] = newsGeneral!.map((v) => v.toJson()).toList();
    }
    if (newsEntertainment != null) {
      data['news_entertainment'] =
          newsEntertainment!.map((v) => v.toJson()).toList();
    }
    if (newsPolitics != null) {
      data['news_politics'] = newsPolitics!.map((v) => v.toJson()).toList();
    }
    if (newsEconomics != null) {
      data['news_economics'] = newsEconomics!.map((v) => v.toJson()).toList();
    }
    if (newsForeign != null) {
      data['news_foreign'] = newsForeign!.map((v) => v.toJson()).toList();
    }
    if (newsSport != null) {
      data['news_sport'] = newsSport!.map((v) => v.toJson()).toList();
    }
    if (newsVarity != null) {
      data['news_varity'] = newsVarity!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
