import 'dart:convert' show json;

class WeiXin {

  int error_code;
  String reason;
  wechat result;

  WeiXin.fromParams({this.error_code, this.reason, this.result});

  factory WeiXin(jsonStr) => jsonStr == null ? null : jsonStr is String ? new WeiXin.fromJson(json.decode(jsonStr)) : new WeiXin.fromJson(jsonStr);

  WeiXin.fromJson(jsonRes) {
    error_code = jsonRes['error_code'];
    reason = jsonRes['reason'];
    result = jsonRes['result'] == null ? null : new wechat.fromJson(jsonRes['result']);
  }

  @override
  String toString() {
    return '{"error_code": $error_code,"reason": ${reason != null?'${json.encode(reason)}':'null'},"result": $result}';
  }
}

class wechat {

  int pno;
  int ps;
  int totalPage;
  List<wechatuser> list;

  wechat.fromParams({this.pno, this.ps, this.totalPage, this.list});

  wechat.fromJson(jsonRes) {
    pno = jsonRes['pno'];
    ps = jsonRes['ps'];
    totalPage = jsonRes['totalPage'];
    list = jsonRes['list'] == null ? null : [];

    for (var listItem in list == null ? [] : jsonRes['list']){
      list.add(listItem == null ? null : new wechatuser.fromJson(listItem));
    }
  }

  @override
  String toString() {
    return '{"pno": $pno,"ps": $ps,"totalPage": $totalPage,"list": $list}';
  }
}

class wechatuser {

  String firstImg;
  String id;
  String mark;
  String source;
  String title;
  String url;

  wechatuser.fromParams({this.firstImg, this.id, this.mark, this.source, this.title, this.url});

  wechatuser.fromJson(jsonRes) {
    firstImg = jsonRes['firstImg'];
    id = jsonRes['id'];
    mark = jsonRes['mark'];
    source = jsonRes['source'];
    title = jsonRes['title'];
    url = jsonRes['url'];
  }

  @override
  String toString() {
    return '{"firstImg": ${firstImg != null?'${json.encode(firstImg)}':'null'},"id": ${id != null?'${json.encode(id)}':'null'},"mark": ${mark != null?'${json.encode(mark)}':'null'},"source": ${source != null?'${json.encode(source)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"url": ${url != null?'${json.encode(url)}':'null'}}';
  }
}

