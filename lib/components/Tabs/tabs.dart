import 'package:flutter/material.dart';
import 'package:myapp/pages/home/HomePage.dart';
import 'package:myapp/pages/mess/messPage.dart';
import 'package:myapp/pages/notice/noticePage.dart';
import 'package:myapp/pages/my/myPage.dart';


class Tabs extends StatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends State<Tabs> {
  int _currentIndex = 0;
  List _pageList=[
    HomeContent(),
    NoticePage(),
    MessPage(),
    MyPage()
  ];
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        // appBar: new AppBar(
        //   title: new Text('资产管理'),
        //   actions: <Widget>[ //导航栏右侧菜单
        //   IconButton(icon: Icon(Icons.qr_code_scanner), onPressed: () {}),
        // ],
        // ),
        body: this._pageList[this._currentIndex],
        bottomNavigationBar:  BottomNavigationBar(
      currentIndex: this._currentIndex,
      onTap: (int index){
        setState(() {
          this._currentIndex=index;
        });
      },
      type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.home),
                title: Text('资产')),
            BottomNavigationBarItem(
                icon: Icon(Icons.notifications_none), 
                title: Text('公告')),
            BottomNavigationBarItem(
                icon: Icon(Icons.message), 
                title: Text('消息')),
            BottomNavigationBarItem(
                icon: Icon(Icons.supervised_user_circle), 
                title: Text('我的')),
          ],
        )
      );
  }
}