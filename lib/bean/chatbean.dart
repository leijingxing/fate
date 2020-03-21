import 'dart:convert' show json;

class Chats {

  int status;
  String msg;
  chatuser result;

  Chats.fromParams({this.status, this.msg, this.result});

  factory Chats(jsonStr) => jsonStr == null ? null : jsonStr is String ? new Chats.fromJson(json.decode(jsonStr)) : new Chats.fromJson(jsonStr);

  Chats.fromJson(jsonRes) {
    status = jsonRes['status'];
    msg = jsonRes['msg'];
    result = jsonRes['result'] == null ? null : new chatuser.fromJson(jsonRes['result']);
  }

  @override
  String toString() {
    return '{"status": $status,"msg": ${msg != null?'${json.encode(msg)}':'null'},"result": $result}';
  }
}

class chatuser {

  Object relquestion;
  String content;
  String type;

  chatuser.fromParams({this.relquestion, this.content, this.type});

  chatuser.fromJson(jsonRes) {
    relquestion = jsonRes['relquestion'];
    content = jsonRes['content'];
    type = jsonRes['type'];
  }

  @override
  String toString() {
    return '{"relquestion": $relquestion,"content": ${content != null?'${json.encode(content)}':'null'},"type": ${type != null?'${json.encode(type)}':'null'}}';
  }
}

