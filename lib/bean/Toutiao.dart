import 'dart:convert' show json;

class Toutiao {

  int error_code;
  String reason;
  toutiao result;

  Toutiao.fromParams({this.error_code, this.reason, this.result});

  factory Toutiao(jsonStr) => jsonStr == null ? null : jsonStr is String ? new Toutiao.fromJson(json.decode(jsonStr)) : new Toutiao.fromJson(jsonStr);

  Toutiao.fromJson(jsonRes) {
    error_code = jsonRes['error_code'];
    reason = jsonRes['reason'];
    result = jsonRes['result'] == null ? null : new toutiao.fromJson(jsonRes['result']);
  }

  @override
  String toString() {
    return '{"error_code": $error_code,"reason": ${reason != null?'${json.encode(reason)}':'null'},"result": $result}';
  }
}

class toutiao {

  String stat;
  List<TouTiaouser> data;

  toutiao.fromParams({this.stat, this.data});

  toutiao.fromJson(jsonRes) {
    stat = jsonRes['stat'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']){
      data.add(dataItem == null ? null : new TouTiaouser.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"stat": ${stat != null?'${json.encode(stat)}':'null'},"data": $data}';
  }
}

class TouTiaouser {

  String author_name;
  String category;
  String date;
  String thumbnail_pic_s;
  String thumbnail_pic_s02;
  String thumbnail_pic_s03;
  String title;
  String uniquekey;
  String url;

  TouTiaouser.fromParams({this.author_name, this.category, this.date, this.thumbnail_pic_s, this.thumbnail_pic_s02, this.thumbnail_pic_s03, this.title, this.uniquekey, this.url});

  TouTiaouser.fromJson(jsonRes) {
    author_name = jsonRes['author_name'];
    category = jsonRes['category'];
    date = jsonRes['date'];
    thumbnail_pic_s = jsonRes['thumbnail_pic_s'];
    thumbnail_pic_s02 = jsonRes['thumbnail_pic_s02'];
    thumbnail_pic_s03 = jsonRes['thumbnail_pic_s03'];
    title = jsonRes['title'];
    uniquekey = jsonRes['uniquekey'];
    url = jsonRes['url'];
  }

  @override
  String toString() {
    return '{"author_name": ${author_name != null?'${json.encode(author_name)}':'null'},"category": ${category != null?'${json.encode(category)}':'null'},"date": ${date != null?'${json.encode(date)}':'null'},"thumbnail_pic_s": ${thumbnail_pic_s != null?'${json.encode(thumbnail_pic_s)}':'null'},"thumbnail_pic_s02": ${thumbnail_pic_s02 != null?'${json.encode(thumbnail_pic_s02)}':'null'},"thumbnail_pic_s03": ${thumbnail_pic_s03 != null?'${json.encode(thumbnail_pic_s03)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"uniquekey": ${uniquekey != null?'${json.encode(uniquekey)}':'null'},"url": ${url != null?'${json.encode(url)}':'null'}}';
  }
}

