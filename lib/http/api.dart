class Api {

  static const String BASE_URL = "http://assets.wangzhensh.cn/api";

  static const String TEST_URL = "";

  //登录
  static const String LOGIN = "/app/login";

  //获取用户信息
  static const String GETINFO = "/getInfo";

  //我的资产
  static const String MYASSETS = "/myAssets/list";

  //资产详情
  static const String ASSETSDetail = "/myAssets/findAssetsDetails";

  //资产类型字典
  static const String ASSETSCATE = "/findData/getCateName";

  //资产类型字典
  static const String ASSETSADRESS = "/findData/getStorageName";

  //部门资产
  static const String DEPARTASSETS = "/deptAssets/list";

  //资产状态
  static const String ASSETSSTATUS = "/findData/selectGetName";

  //资产维修申请
  static const String REPAIR = "/repairApi/repairAdd";

  //资产资产移交
  static const String ASSETSOVER = "/transfer/transfer";

  //资产报废申请
  static const String SCRAP = "/repairApi/scrapAdd";

  //移交类型字典
  static const String ASSET_TRANSFER_TYPE = "/findData/selectGetName";

  //消息列表
  static const String MESS = "/message/list";

  //消息详情
  static const String MESSDETAIL = "/message/findMessageDetails";

  //通知公告
  static const String NOTICE = "/announcement/list";

  //通知详情
  static const String NOTICEDETAIL = "/announcement/findNoticeDetails";

  //申请记录
  static const String APPLYRECORD = "/myAssetsApi/applicationList";

  //申请记录详情
  static const String RECORDDETAIL = "/myAssetsApi/applicationItemList";



}