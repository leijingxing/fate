import 'dart:convert' show json;

class User {

  int status;
  String msg;
  User1 result;

  User.fromParams({this.status, this.msg, this.result});

  factory User(jsonStr) => jsonStr == null ? null : jsonStr is String ? new User.fromJson(json.decode(jsonStr)) : new User.fromJson(jsonStr);

  User.fromJson(jsonRes) {
    status = jsonRes['status'];
    msg = jsonRes['msg'];
    result = jsonRes['result'] == null ? null : new User1.fromJson(jsonRes['result']);
  }

  @override
  String toString() {
    return '{"status": $status,"msg": ${msg != null?'${json.encode(msg)}':'null'},"result": $result}';
  }
}

class User1 {

  int pagenum;
  int pagesize;
  int total;
  List<User2> list;

  User1.fromParams({this.pagenum, this.pagesize, this.total, this.list});

  User1.fromJson(jsonRes) {
    pagenum = jsonRes['pagenum'];
    pagesize = jsonRes['pagesize'];
    total = jsonRes['total'];
    list = jsonRes['list'] == null ? null : [];

    for (var listItem in list == null ? [] : jsonRes['list']){
      list.add(listItem == null ? null : new User2.fromJson(listItem));
    }
  }

  @override
  String toString() {
    return '{"pagenum": $pagenum,"pagesize": $pagesize,"total": $total,"list": $list}';
  }
}

class User2 {

  String addtime;
  String content;
  String url;

  User2.fromParams({this.addtime, this.content, this.url});

  User2.fromJson(jsonRes) {
    addtime = jsonRes['addtime'];
    content = jsonRes['content'];
    url = jsonRes['url'];
  }

  @override
  String toString() {
    return '{"addtime": ${addtime != null?'${json.encode(addtime)}':'null'},"content": ${content != null?'${json.encode(content)}':'null'},"url": ${url != null?'${json.encode(url)}':'null'}}';
  }
}

