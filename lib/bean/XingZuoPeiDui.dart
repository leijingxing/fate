import 'dart:convert' show json;

class XZPD {

  int error_code;
  String reason;
  xingzuopeidui result;

  XZPD.fromParams({this.error_code, this.reason, this.result});

  factory XZPD(jsonStr) => jsonStr == null ? null : jsonStr is String ? new XZPD.fromJson(json.decode(jsonStr)) : new XZPD.fromJson(jsonStr);

  XZPD.fromJson(jsonRes) {
    error_code = jsonRes['error_code'];
    reason = jsonRes['reason'];
    result = jsonRes['result'] == null ? null : new xingzuopeidui.fromJson(jsonRes['result']);
  }

  @override
  String toString() {
    return '{"error_code": $error_code,"reason": ${reason != null?'${json.encode(reason)}':'null'},"result": $result}';
  }
}

class xingzuopeidui {

  String bizhong;
  String jieguo;
  String lianai;
  String men;
  String tcdj;
  String women;
  String xiangyue;
  String zhishu;
  String zhuyi;

  xingzuopeidui.fromParams({this.bizhong, this.jieguo, this.lianai, this.men, this.tcdj, this.women, this.xiangyue, this.zhishu, this.zhuyi});

  xingzuopeidui.fromJson(jsonRes) {
    bizhong = jsonRes['bizhong'];
    jieguo = jsonRes['jieguo'];
    lianai = jsonRes['lianai'];
    men = jsonRes['men'];
    tcdj = jsonRes['tcdj'];
    women = jsonRes['women'];
    xiangyue = jsonRes['xiangyue'];
    zhishu = jsonRes['zhishu'];
    zhuyi = jsonRes['zhuyi'];
  }

  @override
  String toString() {
    return '{"bizhong": ${bizhong != null?'${json.encode(bizhong)}':'null'},"jieguo": ${jieguo != null?'${json.encode(jieguo)}':'null'},"lianai": ${lianai != null?'${json.encode(lianai)}':'null'},"men": ${men != null?'${json.encode(men)}':'null'},"tcdj": ${tcdj != null?'${json.encode(tcdj)}':'null'},"women": ${women != null?'${json.encode(women)}':'null'},"xiangyue": ${xiangyue != null?'${json.encode(xiangyue)}':'null'},"zhishu": ${zhishu != null?'${json.encode(zhishu)}':'null'},"zhuyi": ${zhuyi != null?'${json.encode(zhuyi)}':'null'}}';
  }
}

