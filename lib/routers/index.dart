import 'package:flutter/material.dart';
 
import '../components/Tabs/tabs.dart';
import '../pages/home/drawer/buyApproval.dart';
import '../pages/home/drawer/approvalDetail.dart';
import '../pages/home/assetsBuy.dart';
import '../pages/home/assetsDetail.dart';
import '../pages/home/assetsOver.dart';
import '../pages/home/assetsScrap.dart';
import '../pages/home/assetsTake.dart';
import '../pages/home/addTake.dart';
import '../pages/home/assetsRepair.dart';
import '../pages/home/departAssets.dart';
import '../pages/home/myAssets.dart';
import '../pages/home/repairApply.dart';
import '../pages/home/buyApply.dart';
import '../pages/home/scrapApply.dart';
import '../pages/home/overApply.dart';
import '../pages/home/applyRecord.dart';
import '../pages/home/recordDetail.dart';
import '../pages/login/login.dart';
import '../pages/login/rePassWord.dart';
import '../pages/mess/newDetail.dart';
import '../pages/notice/noticeDetail.dart';


final routes={
      '/':(context)=>Tabs(),
      '/buy':(context,{arguments})=>assetsBuy(arguments:arguments),
      '/buyApply':(context,{arguments})=>buyApply(arguments:arguments),
      '/buyApproval':(context,{arguments})=>buyApproval(),
      '/approvalDetail':(context,{arguments})=>approvalDetail(arguments:arguments),
      '/repairApply':(context,{arguments})=>repairApply(arguments:arguments),
      '/assetsRepair':(context,{arguments})=>assetsRepair(),
      '/assetsScrap':(context,{arguments})=>assetsScrap(),
      '/scrapApply':(context,{arguments})=>scrapApply(arguments:arguments),
      '/assetsOver':(context,{arguments})=>assetsOver(),
      '/overApply':(context,{arguments})=>overApply(arguments:arguments),
      '/applyRecord':(context,{arguments})=>applyRecord(),
      '/recordDetail':(context,{arguments})=>recordDetail(arguments:arguments),
      '/myAssets':(context,{arguments})=>myAssets(),
      '/departAssets':(context,{arguments})=>departAssets(),
      '/take':(context,{arguments})=>assetsTake(arguments:arguments),
      '/newDetail':(context,{arguments})=>newDetail(arguments:arguments),
      '/noticeDetail':(context,{arguments})=>noticeDetail(arguments:arguments),
      '/addTake':(context,{arguments})=>addTake(),
      '/login':(context)=>login(),
      '/repass':(context)=>rePassWord(),


};
 
//固定写法
var onGenerateRoute=(RouteSettings settings) {
      // 统一处理
      final String name = settings.name; 
      print(settings.name);
      final Function pageContentBuilder = routes[name];
      if (pageContentBuilder != null) {
        if (settings.arguments != null) {
          final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context, arguments: settings.arguments));
          return route;
        }else{
            final Route route = MaterialPageRoute(
              builder: (context) =>
                  pageContentBuilder(context));
            return route;
        }
      }
};