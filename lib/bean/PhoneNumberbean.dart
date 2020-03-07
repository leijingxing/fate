import 'dart:convert' show json;

class Phone {

  int error_code;
  String reason;
  String resultcode;
  phoneuser result;

  Phone.fromParams({this.error_code, this.reason, this.resultcode, this.result});

  factory Phone(jsonStr) => jsonStr == null ? null : jsonStr is String ? new Phone.fromJson(json.decode(jsonStr)) : new Phone.fromJson(jsonStr);

  Phone.fromJson(jsonRes) {
    error_code = jsonRes['error_code'];
    reason = jsonRes['reason'];
    resultcode = jsonRes['resultcode'];
    result = jsonRes['result'] == null ? null : new phoneuser.fromJson(jsonRes['result']);
  }

  @override
  String toString() {
    return '{"error_code": $error_code,"reason": ${reason != null?'${json.encode(reason)}':'null'},"resultcode": ${resultcode != null?'${json.encode(resultcode)}':'null'},"result": $result}';
  }
}

class phoneuser {

  String areacode;
  String card;
  String city;
  String company;
  String province;
  String zip;

  phoneuser.fromParams({this.areacode, this.card, this.city, this.company, this.province, this.zip});

  phoneuser.fromJson(jsonRes) {
    areacode = jsonRes['areacode'];
    card = jsonRes['card'];
    city = jsonRes['city'];
    company = jsonRes['company'];
    province = jsonRes['province'];
    zip = jsonRes['zip'];
  }

  @override
  String toString() {
    return '{"areacode": ${areacode != null?'${json.encode(areacode)}':'null'},"card": ${card != null?'${json.encode(card)}':'null'},"city": ${city != null?'${json.encode(city)}':'null'},"company": ${company != null?'${json.encode(company)}':'null'},"province": ${province != null?'${json.encode(province)}':'null'},"zip": ${zip != null?'${json.encode(zip)}':'null'}}';
  }
}

