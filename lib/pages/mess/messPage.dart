import 'package:flutter/material.dart';
import 'package:myapp/components/notice_cell.dart';

class MessPage extends StatefulWidget {
  @override
  _MessPageState createState() => _MessPageState();
}

class _MessPageState extends State<MessPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('我的消息'),
        ),
        body: Container(
            child:
                ListView(padding: EdgeInsets.fromLTRB(0, 10, 0, 10), children: [
          noticeCell(
            text: '成功！！',
            subtitle:  '省人大常委省人大常委省人大常委省人大常委省人大常委省人大常委省人大常',
            onTap:(){
              print("点击了消息组件");
            } ,
          ),
          noticeCell(
            //isread判断未读已读，1未读
            isread: 1,
          ),
          noticeCell(          ),
          noticeCell(
            isread: 1,
          ),
          noticeCell(),
          noticeCell(),
          noticeCell(),
          noticeCell(),
          noticeCell(),
          noticeCell(),
          noticeCell(),
          noticeCell(),
          noticeCell(),
        ])));
  }
}
