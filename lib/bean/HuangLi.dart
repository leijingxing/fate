import 'dart:convert' show json;

class HuangLi {

  int error_code;
  String reason;
  huangli1 result;

  HuangLi.fromParams({this.error_code, this.reason, this.result});

  factory HuangLi(jsonStr) => jsonStr == null ? null : jsonStr is String ? new HuangLi.fromJson(json.decode(jsonStr)) : new HuangLi.fromJson(jsonStr);

  HuangLi.fromJson(jsonRes) {
    error_code = jsonRes['error_code'];
    reason = jsonRes['reason'];
    result = jsonRes['result'] == null ? null : new huangli1.fromJson(jsonRes['result']);
  }

  @override
  String toString() {
    return '{"error_code": $error_code,"reason": ${reason != null?'${json.encode(reason)}':'null'},"result": $result}';
  }
}

class huangli1 {

  String baiji;
  String chongsha;
  String id;
  String ji;
  String jishen;
  String wuxing;
  String xiongshen;
  String yangli;
  String yi;
  String yinli;

  huangli1.fromParams({this.baiji, this.chongsha, this.id, this.ji, this.jishen, this.wuxing, this.xiongshen, this.yangli, this.yi, this.yinli});

  huangli1.fromJson(jsonRes) {
    baiji = jsonRes['baiji'];
    chongsha = jsonRes['chongsha'];
    id = jsonRes['id'];
    ji = jsonRes['ji'];
    jishen = jsonRes['jishen'];
    wuxing = jsonRes['wuxing'];
    xiongshen = jsonRes['xiongshen'];
    yangli = jsonRes['yangli'];
    yi = jsonRes['yi'];
    yinli = jsonRes['yinli'];
  }

  @override
  String toString() {
    return '{"baiji": ${baiji != null?'${json.encode(baiji)}':'null'},"chongsha": ${chongsha != null?'${json.encode(chongsha)}':'null'},"id": ${id != null?'${json.encode(id)}':'null'},"ji": ${ji != null?'${json.encode(ji)}':'null'},"jishen": ${jishen != null?'${json.encode(jishen)}':'null'},"wuxing": ${wuxing != null?'${json.encode(wuxing)}':'null'},"xiongshen": ${xiongshen != null?'${json.encode(xiongshen)}':'null'},"yangli": ${yangli != null?'${json.encode(yangli)}':'null'},"yi": ${yi != null?'${json.encode(yi)}':'null'},"yinli": ${yinli != null?'${json.encode(yinli)}':'null'}}';
  }
}

