import 'package:json_annotation/json_annotation.dart';

part 'rerun_highlight_response_model.g.dart';

@JsonSerializable()
class RerunHighlightResposneModel {
  bool? status;
  String? message;
  Data? data;

  RerunHighlightResposneModel({this.status, this.message, this.data});

  RerunHighlightResposneModel.fromJson(Map<String, dynamic> json) {
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
  List<Highlight>? highlight;

  Data({this.n7daySeries, this.highlight});

  Data.fromJson(Map<String, dynamic> json) {
    n7daySeries = json['7day_series'];
    if (json['highlight'] != null) {
      highlight = <Highlight>[];
      json['highlight'].forEach((v) {
        highlight!.add(Highlight.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['7day_series'] = n7daySeries;
    if (highlight != null) {
      data['highlight'] = highlight!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Highlight {
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

  Highlight(
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

  Highlight.fromJson(Map<String, dynamic> json) {
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
