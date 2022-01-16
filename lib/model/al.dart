class Al {
  Al({
      this.status, 
      this.statuscode, 
      this.version, 
      this.access, 
      this.data,});

  Al.fromJson(dynamic json) {
    status = json['status'];
    statuscode = json['status-code'];
    version = json['version'];
    access = json['access'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  String? status;
  int? statuscode;
  String? version;
  String? access;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['status-code'] = statuscode;
    map['version'] = version;
    map['access'] = access;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.id, 
      this.title, 
      this.summary, 
      this.link, 
      this.published,});

  Data.fromJson(dynamic json) {
    id = json['id'];
    title = json['title'];
    summary = json['summary'];
    link = json['link'];
    published = json['published'];
  }
  int? id;
  String? title;
  String? summary;
  String? link;
  String? published;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['summary'] = summary;
    map['link'] = link;
    map['published'] = published;
    return map;
  }

}