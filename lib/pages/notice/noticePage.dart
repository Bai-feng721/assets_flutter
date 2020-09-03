import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/components/notice_cell.dart';


class NoticePage extends StatefulWidget {
  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('通知公告'),
      ),
      body: Container(
        child:ListView(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        children:[
          noticeCell(),
          noticeCell(),
          noticeCell(),
        ]
      )
    ),
    );
  }
}

