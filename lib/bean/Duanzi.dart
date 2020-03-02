import 'dart:convert' show json;

class Duanzi {

  int code;
  String msg;
  List<duanzi1> data;

  Duanzi.fromParams({this.code, this.msg, this.data});

  factory Duanzi(jsonStr) => jsonStr == null ? null : jsonStr is String ? new Duanzi.fromJson(json.decode(jsonStr)) : new Duanzi.fromJson(jsonStr);

  Duanzi.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']){
      data.add(dataItem == null ? null : new duanzi1.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"code": $code,"msg": ${msg != null?'${json.encode(msg)}':'null'},"data": $data}';
  }
}

class duanzi1 {

  String img;
  String title;

  duanzi1.fromParams({this.img, this.title});

  duanzi1.fromJson(jsonRes) {
    img = jsonRes['img'];
    title = jsonRes['title'];
  }

  @override
  String toString() {
    return '{"img": ${img != null?'${json.encode(img)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'}}';
  }
}

