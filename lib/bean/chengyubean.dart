import 'dart:convert' show json;

class Chengyu {

  int error_code;
  String reason;
  chengyu1 result;

  Chengyu.fromParams({this.error_code, this.reason, this.result});

  factory Chengyu(jsonStr) => jsonStr == null ? null : jsonStr is String ? new Chengyu.fromJson(json.decode(jsonStr)) : new Chengyu.fromJson(jsonStr);

  Chengyu.fromJson(jsonRes) {
    error_code = jsonRes['error_code'];
    reason = jsonRes['reason'];
    result = jsonRes['result'] == null ? null : new chengyu1.fromJson(jsonRes['result']);
  }

  @override
  String toString() {
    return '{"error_code": $error_code,"reason": ${reason != null?'${json.encode(reason)}':'null'},"result": $result}';
  }
}

class chengyu1 {

  String bushou;
  String chengyujs;
  String ciyujs;
  String example;
  String from_;
  String head;
  String pinyin;
  String yinzhengjs;
  String yufa;
  List<String> fanyi;
  List<String> tongyi;

  chengyu1.fromParams({this.bushou, this.chengyujs, this.ciyujs, this.example, this.from_, this.head, this.pinyin, this.yinzhengjs, this.yufa, this.fanyi, this.tongyi});

  chengyu1.fromJson(jsonRes) {
    bushou = jsonRes['bushou'];
    chengyujs = jsonRes['chengyujs'];
    ciyujs = jsonRes['ciyujs'];
    example = jsonRes['example'];
    from_ = jsonRes['from_'];
    head = jsonRes['head'];
    pinyin = jsonRes['pinyin'];
    yinzhengjs = jsonRes['yinzhengjs'];
    yufa = jsonRes['yufa'];
    fanyi = jsonRes['fanyi'] == null ? null : [];

    for (var fanyiItem in fanyi == null ? [] : jsonRes['fanyi']){
      fanyi.add(fanyiItem);
    }

    tongyi = jsonRes['tongyi'] == null ? null : [];

    for (var tongyiItem in tongyi == null ? [] : jsonRes['tongyi']){
      tongyi.add(tongyiItem);
    }
  }

  @override
  String toString() {
    return '{"bushou": ${bushou != null?'${json.encode(bushou)}':'null'},"chengyujs": ${chengyujs != null?'${json.encode(chengyujs)}':'null'},"ciyujs": ${ciyujs != null?'${json.encode(ciyujs)}':'null'},"example": ${example != null?'${json.encode(example)}':'null'},"from_": ${from_ != null?'${json.encode(from_)}':'null'},"head": ${head != null?'${json.encode(head)}':'null'},"pinyin": ${pinyin != null?'${json.encode(pinyin)}':'null'},"yinzhengjs": ${yinzhengjs != null?'${json.encode(yinzhengjs)}':'null'},"yufa": ${yufa != null?'${json.encode(yufa)}':'null'},"fanyi": $fanyi,"tongyi": $tongyi}';
  }
}

