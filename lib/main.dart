import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'package:myapp/routers/index.dart';


void main() {
  // debugPaintSizeEnabled = true;      //打开视觉调试开关
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      // title: '资产管理', 
      theme: ThemeData(primaryColor: Color(0xFF5464ff)),
      // home: Tabs(),
      initialRoute: '/',     //初始化的时候加载的路由
      onGenerateRoute: onGenerateRoute
    );
  }
}

