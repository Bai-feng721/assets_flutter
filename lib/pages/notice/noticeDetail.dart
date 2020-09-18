import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/http/http.dart';
import 'package:myapp/http/api.dart';
import 'package:myapp/units/parseTime.dart';
import 'package:flutter_html/flutter_html.dart';


class noticeDetail extends StatefulWidget {
  Map arguments;
  noticeDetail({Key key,this.arguments}):super(key:key);
  @override
  _noticeDetailState createState() => _noticeDetailState(arguments:this.arguments);
}

class _noticeDetailState extends State<noticeDetail> {
  Map arguments;
  _noticeDetailState({this.arguments});
  Map noticeDetail={};

  @override
  void initState(){
    super.initState();
    this._getnoticeDetail();
  }

  _getnoticeDetail() async{
    var response = await HttpUtil().post(Api.NOTICEDETAIL+'?id=${arguments['id']}', token:'eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6IjM5NWFlMzJjLWE4NjUtNGMzZi04YjMxLTU4YWZiYjFlMGE5ZSJ9.xGnyYswUOJl2BewIH7w9uDIiomCb3RfIiSCIeE3pa5H19KNReSeBwY71GOA8kA_QeO_Lu8fmh3q2cdy3207zMA');
    setState(() {
      this.noticeDetail=response.data['data'];
      print(this.noticeDetail);
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('详细内容'),
      ),
      body: Container(child: ListView(
        padding: EdgeInsets.all(Adapt.px(20)),
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(Adapt.px(20)),
            child: Text(noticeDetail['createBy'] ,maxLines: 2,
  overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: Adapt.px(40)),),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text('发送人：${noticeDetail['createBy']}',style: TextStyle(fontSize: Adapt.px(30))),
            Text('时间:${noticeDetail['createTime']}',style: TextStyle(fontSize: Adapt.px(30)))
          ],),
          Divider(),
          Container(
            padding: EdgeInsets.all(Adapt.px(20)),
            child: Center(
              child: Html(
                data: noticeDetail['noticeContent'],
              )
              // Text(noticeDetail['noticeContent'],style: TextStyle(fontSize: Adapt.px(36),color: Colors.grey[600],height: 1.5)),
            ),)
      ],),),
    );
  }
}