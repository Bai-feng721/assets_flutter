import 'package:flutter/material.dart';
 
import '../components/Tabs/tabs.dart';
import '../pages/home/assetsBuy.dart';
import '../pages/home/assetsDetail.dart';
import '../pages/home/assetsOver.dart';
import '../pages/home/assetsScrap.dart';
import '../pages/home/assetsTake.dart';
import '../pages/home/departAssets.dart';
import '../pages/home/myAssets.dart';
import '../pages/home/repairApply.dart';
import '../pages/login/login.dart';
import '../pages/login/rePassWord.dart';


final routes={
      '/':(context)=>Tabs(),
      '/buy':(context,{arguments})=>assetsBuy(arguments:arguments),
      '/detail':(context,{arguments})=>asstesDetail(arguments:arguments),
      '/myAssets':(context,{arguments})=>myAssets(arguments:arguments),
      '/departAssets':(context,{arguments})=>departAssets(arguments:arguments),
      '/over':(context,{arguments})=>assetsOver(arguments:arguments),
      // '/apply':(context,{arguments})=>repairApply(arguments:arguments),
      '/take':(context,{arguments})=>assetsTake(arguments:arguments),
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