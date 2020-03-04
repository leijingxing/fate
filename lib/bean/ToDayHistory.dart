import 'dart:convert' show json;

class ToDayHistory {

  int error_code;
  String reason;
  List<ToDayHistoryuser> result;

  ToDayHistory.fromParams({this.error_code, this.reason, this.result});

  factory ToDayHistory(jsonStr) => jsonStr == null ? null : jsonStr is String ? new ToDayHistory.fromJson(json.decode(jsonStr)) : new ToDayHistory.fromJson(jsonStr);

  ToDayHistory.fromJson(jsonRes) {
    error_code = jsonRes['error_code'];
    reason = jsonRes['reason'];
    result = jsonRes['result'] == null ? null : [];

    for (var resultItem in result == null ? [] : jsonRes['result']){
      result.add(resultItem == null ? null : new ToDayHistoryuser.fromJson(resultItem));
    }
  }

  @override
  String toString() {
    return '{"error_code": $error_code,"reason": ${reason != null?'${json.encode(reason)}':'null'},"result": $result}';
  }
}

class ToDayHistoryuser {

  String content;
  String e_id;
  String picNo;
  String title;
  List<HistoryPic> picUrl;

  ToDayHistoryuser.fromParams({this.content, this.e_id, this.picNo, this.title, this.picUrl});

  ToDayHistoryuser.fromJson(jsonRes) {
    content = jsonRes['content'];
    e_id = jsonRes['e_id'];
    picNo = jsonRes['picNo'];
    title = jsonRes['title'];
    picUrl = jsonRes['picUrl'] == null ? null : [];

    for (var picUrlItem in picUrl == null ? [] : jsonRes['picUrl']){
      picUrl.add(picUrlItem == null ? null : new HistoryPic.fromJson(picUrlItem));
    }
  }

  @override
  String toString() {
    return '{"content": ${content != null?'${json.encode(content)}':'null'},"e_id": ${e_id != null?'${json.encode(e_id)}':'null'},"picNo": ${picNo != null?'${json.encode(picNo)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"picUrl": $picUrl}';
  }
}

class HistoryPic {

  int id;
  String pic_title;
  String url;

  HistoryPic.fromParams({this.id, this.pic_title, this.url});

  HistoryPic.fromJson(jsonRes) {
    id = jsonRes['id'];
    pic_title = jsonRes['pic_title'];
    url = jsonRes['url'];
  }

  @override
  String toString() {
    return '{"id": $id,"pic_title": ${pic_title != null?'${json.encode(pic_title)}':'null'},"url": ${url != null?'${json.encode(url)}':'null'}}';
  }
}

