import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/components/notice_cell.dart';
import 'package:myapp/http/api.dart';
import 'package:myapp/http/http.dart';
import 'package:myapp/units/parseTime.dart';

class NoticePage extends StatefulWidget {
  @override
  _NoticePageState createState() => _NoticePageState();
}

class _NoticePageState extends State<NoticePage> {
  List noticeList=[];
  @override

  void initState(){
    super.initState();
    this._getList();
  }
  _getList() async{
    var response = await HttpUtil().get(Api.NOTICE, token: 'eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6IjM5NWFlMzJjLWE4NjUtNGMzZi04YjMxLTU4YWZiYjFlMGE5ZSJ9.xGnyYswUOJl2BewIH7w9uDIiomCb3RfIiSCIeE3pa5H19KNReSeBwY71GOA8kA_QeO_Lu8fmh3q2cdy3207zMA');

    setState(() {
      this.noticeList=response.data["rows"];
      print(this.noticeList);
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('通知公告'),
      ),
      body: Container(
        child:ListView(
        padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
        children:
        this.noticeList.map((item){
          return noticeCell(
            text:item['noticeTitle'],
            subtitle: item['noticeContent'],
            time:Text('${item['createTime']}'.substring(0,10)),
            id: item['noticeId'],
            isread: item['status'],
          );
        }).toList(),
      )
    ),
    );
  }
}

