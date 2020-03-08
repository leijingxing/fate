import 'dart:convert' show json;

class Book {

  int error_code;
  String reason;
  String resultcode;
  Book1 result;

  Book.fromParams({this.error_code, this.reason, this.resultcode, this.result});

  factory Book(jsonStr) => jsonStr == null ? null : jsonStr is String ? new Book.fromJson(json.decode(jsonStr)) : new Book.fromJson(jsonStr);

  Book.fromJson(jsonRes) {
    error_code = jsonRes['error_code'];
    reason = jsonRes['reason'];
    resultcode = jsonRes['resultcode'];
    result = jsonRes['result'] == null ? null : new Book1.fromJson(jsonRes['result']);
  }

  @override
  String toString() {
    return '{"error_code": $error_code,"reason": ${reason != null?'${json.encode(reason)}':'null'},"resultcode": ${resultcode != null?'${json.encode(resultcode)}':'null'},"result": $result}';
  }
}

class Book1 {

  int pn;
  int rn;
  String totalNum;
  List<Book2> data;

  Book1.fromParams({this.pn, this.rn, this.totalNum, this.data});

  Book1.fromJson(jsonRes) {
    pn = jsonRes['pn'];
    rn = jsonRes['rn'];
    totalNum = jsonRes['totalNum'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']){
      data.add(dataItem == null ? null : new Book2.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"pn": $pn,"rn": $rn,"totalNum": ${totalNum != null?'${json.encode(totalNum)}':'null'},"data": $data}';
  }
}

class Book2 {

  String bytime;
  String catalog;
  String img;
  String online;
  String reading;
  String sub1;
  String sub2;
  String tags;
  String title;

  Book2.fromParams({this.bytime, this.catalog, this.img, this.online, this.reading, this.sub1, this.sub2, this.tags, this.title});

  Book2.fromJson(jsonRes) {
    bytime = jsonRes['bytime'];
    catalog = jsonRes['catalog'];
    img = jsonRes['img'];
    online = jsonRes['online'];
    reading = jsonRes['reading'];
    sub1 = jsonRes['sub1'];
    sub2 = jsonRes['sub2'];
    tags = jsonRes['tags'];
    title = jsonRes['title'];
  }

  @override
  String toString() {
    return '{"bytime": ${bytime != null?'${json.encode(bytime)}':'null'},"catalog": ${catalog != null?'${json.encode(catalog)}':'null'},"img": ${img != null?'${json.encode(img)}':'null'},"online": ${online != null?'${json.encode(online)}':'null'},"reading": ${reading != null?'${json.encode(reading)}':'null'},"sub1": ${sub1 != null?'${json.encode(sub1)}':'null'},"sub2": ${sub2 != null?'${json.encode(sub2)}':'null'},"tags": ${tags != null?'${json.encode(tags)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'}}';
  }
}

