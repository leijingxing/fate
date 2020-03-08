import 'dart:convert' show json;

class XiaoHua {

  int error_code;
  String reason;
  List<xiahua> result;

  XiaoHua.fromParams({this.error_code, this.reason, this.result});

  factory XiaoHua(jsonStr) => jsonStr == null ? null : jsonStr is String ? new XiaoHua.fromJson(json.decode(jsonStr)) : new XiaoHua.fromJson(jsonStr);

  XiaoHua.fromJson(jsonRes) {
    error_code = jsonRes['error_code'];
    reason = jsonRes['reason'];
    result = jsonRes['result'] == null ? null : [];

    for (var resultItem in result == null ? [] : jsonRes['result']){
      result.add(resultItem == null ? null : new xiahua.fromJson(resultItem));
    }
  }

  @override
  String toString() {
    return '{"error_code": $error_code,"reason": ${reason != null?'${json.encode(reason)}':'null'},"result": $result}';
  }
}

class xiahua {

  int unixtime;
  String content;
  String hashId;

  xiahua.fromParams({this.unixtime, this.content, this.hashId});

  xiahua.fromJson(jsonRes) {
    unixtime = jsonRes['unixtime'];
    content = jsonRes['content'];
    hashId = jsonRes['hashId'];
  }

  @override
  String toString() {
    return '{"unixtime": $unixtime,"content": ${content != null?'${json.encode(content)}':'null'},"hashId": ${hashId != null?'${json.encode(hashId)}':'null'}}';
  }
}

