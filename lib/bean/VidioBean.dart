import 'dart:convert' show json;

class VidioList {

  int code;
  String msg;
  List<Vidio1> data;

  VidioList.fromParams({this.code, this.msg, this.data});

  factory VidioList(jsonStr) => jsonStr == null ? null : jsonStr is String ? new VidioList.fromJson(json.decode(jsonStr)) : new VidioList.fromJson(jsonStr);

  VidioList.fromJson(jsonRes) {
    code = jsonRes['code'];
    msg = jsonRes['msg'];
    data = jsonRes['data'] == null ? null : [];

    for (var dataItem in data == null ? [] : jsonRes['data']){
      data.add(dataItem == null ? null : new Vidio1.fromJson(dataItem));
    }
  }

  @override
  String toString() {
    return '{"code": $code,"msg": ${msg != null?'${json.encode(msg)}':'null'},"data": $data}';
  }
}

class Vidio1 {

  Object m3u8Hd_url;
  Object mp4Hd_url;
  int commentStatus;
  int length;
  int playCount;
  int playersize;
  int replyCount;
  int sizeHD;
  int sizeSD;
  int sizeSHD;
  int votecount;
  String cover;
  String description;
  String m3u8_url;
  String mp4_url;
  String ptime;
  String replyBoard;
  String replyid;
  String sectiontitle;
  String title;
  String topicDesc;
  String topicImg;
  String topicName;
  String topicSid;
  String vid;
  String videosource;
  Vidio2 videoTopic;

  Vidio1.fromParams({this.m3u8Hd_url, this.mp4Hd_url, this.commentStatus, this.length, this.playCount, this.playersize, this.replyCount, this.sizeHD, this.sizeSD, this.sizeSHD, this.votecount, this.cover, this.description, this.m3u8_url, this.mp4_url, this.ptime, this.replyBoard, this.replyid, this.sectiontitle, this.title, this.topicDesc, this.topicImg, this.topicName, this.topicSid, this.vid, this.videosource, this.videoTopic});

  Vidio1.fromJson(jsonRes) {
    m3u8Hd_url = jsonRes['m3u8Hd_url'];
    mp4Hd_url = jsonRes['mp4Hd_url'];
    commentStatus = jsonRes['commentStatus'];
    length = jsonRes['length'];
    playCount = jsonRes['playCount'];
    playersize = jsonRes['playersize'];
    replyCount = jsonRes['replyCount'];
    sizeHD = jsonRes['sizeHD'];
    sizeSD = jsonRes['sizeSD'];
    sizeSHD = jsonRes['sizeSHD'];
    votecount = jsonRes['votecount'];
    cover = jsonRes['cover'];
    description = jsonRes['description'];
    m3u8_url = jsonRes['m3u8_url'];
    mp4_url = jsonRes['mp4_url'];
    ptime = jsonRes['ptime'];
    replyBoard = jsonRes['replyBoard'];
    replyid = jsonRes['replyid'];
    sectiontitle = jsonRes['sectiontitle'];
    title = jsonRes['title'];
    topicDesc = jsonRes['topicDesc'];
    topicImg = jsonRes['topicImg'];
    topicName = jsonRes['topicName'];
    topicSid = jsonRes['topicSid'];
    vid = jsonRes['vid'];
    videosource = jsonRes['videosource'];
    videoTopic = jsonRes['videoTopic'] == null ? null : new Vidio2.fromJson(jsonRes['videoTopic']);
  }

  @override
  String toString() {
    return '{"m3u8Hd_url": $m3u8Hd_url,"mp4Hd_url": $mp4Hd_url,"commentStatus": $commentStatus,"length": $length,"playCount": $playCount,"playersize": $playersize,"replyCount": $replyCount,"sizeHD": $sizeHD,"sizeSD": $sizeSD,"sizeSHD": $sizeSHD,"votecount": $votecount,"cover": ${cover != null?'${json.encode(cover)}':'null'},"description": ${description != null?'${json.encode(description)}':'null'},"m3u8_url": ${m3u8_url != null?'${json.encode(m3u8_url)}':'null'},"mp4_url": ${mp4_url != null?'${json.encode(mp4_url)}':'null'},"ptime": ${ptime != null?'${json.encode(ptime)}':'null'},"replyBoard": ${replyBoard != null?'${json.encode(replyBoard)}':'null'},"replyid": ${replyid != null?'${json.encode(replyid)}':'null'},"sectiontitle": ${sectiontitle != null?'${json.encode(sectiontitle)}':'null'},"title": ${title != null?'${json.encode(title)}':'null'},"topicDesc": ${topicDesc != null?'${json.encode(topicDesc)}':'null'},"topicImg": ${topicImg != null?'${json.encode(topicImg)}':'null'},"topicName": ${topicName != null?'${json.encode(topicName)}':'null'},"topicSid": ${topicSid != null?'${json.encode(topicSid)}':'null'},"vid": ${vid != null?'${json.encode(vid)}':'null'},"videosource": ${videosource != null?'${json.encode(videosource)}':'null'},"videoTopic": $videoTopic}';
  }
}

class Vidio2 {

  String alias;
  String ename;
  String tid;
  String tname;
  String topic_icons;

  Vidio2.fromParams({this.alias, this.ename, this.tid, this.tname, this.topic_icons});

  Vidio2.fromJson(jsonRes) {
    alias = jsonRes['alias'];
    ename = jsonRes['ename'];
    tid = jsonRes['tid'];
    tname = jsonRes['tname'];
    topic_icons = jsonRes['topic_icons'];
  }

  @override
  String toString() {
    return '{"alias": ${alias != null?'${json.encode(alias)}':'null'},"ename": ${ename != null?'${json.encode(ename)}':'null'},"tid": ${tid != null?'${json.encode(tid)}':'null'},"tname": ${tname != null?'${json.encode(tname)}':'null'},"topic_icons": ${topic_icons != null?'${json.encode(topic_icons)}':'null'}}';
  }
}

