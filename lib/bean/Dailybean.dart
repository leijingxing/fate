import 'dart:convert' show json;

class DailyBean {

  int code;
  String msg;
  List<Daily> data1;

  DailyBean.fromParams({this.code, this.msg, this.data1});

  factory DailyBean(jsonStr) => jsonStr == null ? null : jsonStr is String ? new DailyBean.fromJson(json.decode(jsonStr)) : new DailyBean.fromJson(jsonStr);

  DailyBean.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data1 = jsonRes['data'] == null ? null : [];

    for (var dataItem in data1 == null ? [] : jsonRes['data']){
      data1.add(dataItem == null ? null : new Daily.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"code": $code,"msg": ${msg != null?'${json.encode(msg)}':'null'},"data": $data1}';
  }
}

class Daily {

  int id;
  String date;
  String description;
  String title;
  String url;

  Daily.fromParams({this.id, this.date, this.description, this.title, this.url});

  Daily.fromJson(jsonRes) {
    id = jsonRes['id'];
    date = jsonRes['date'];
    description = jsonRes['description'];
    title = jsonRes['title'];
    url = jsonRes['url'];
  }

  @override
  String toString() {
    return '{"id": $id,"date": ${date != null?'${json.encode(date)}':'null'},"description": ${description != null?'${json.encode(description)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"url": ${url != null?'${json.encode(url)}':'null'}}';
  }
}

