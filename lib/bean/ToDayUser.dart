import 'dart:convert' show json;

class ToDay {

  int error_code;
  String reason;
  List<Todayuser> result;

  ToDay.fromParams({this.error_code, this.reason, this.result});

  factory ToDay(jsonStr) => jsonStr == null ? null : jsonStr is String ? new ToDay.fromJson(json.decode(jsonStr)) : new ToDay.fromJson(jsonStr);

  ToDay.fromJson(jsonRes) {
    error_code = jsonRes['error_code'];
    reason = jsonRes['reason'];
    result = jsonRes['result'] == null ? null : [];

    for (var resultItem in result == null ? [] : jsonRes['result']){
      result.add(resultItem == null ? null : new Todayuser.fromJson(resultItem));
    }
  }

  @override
  String toString() {
    return '{"error_code": $error_code,"reason": ${reason != null?'${json.encode(reason)}':'null'},"result": $result}';
  }
}

class Todayuser {

  String date;
  String day;
  String e_id;
  String title;

  Todayuser.fromParams({this.date, this.day, this.e_id, this.title});

  Todayuser.fromJson(jsonRes) {
    date = jsonRes['date'];
    day = jsonRes['day'];
    e_id = jsonRes['e_id'];
    title = jsonRes['title'];
  }

  @override
  String toString() {
    return '{"date": ${date != null?'${json.encode(date)}':'null'},"day": ${day != null?'${json.encode(day)}':'null'},"e_id": ${e_id != null?'${json.encode(e_id)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'}}';
  }
}

