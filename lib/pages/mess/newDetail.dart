import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/http/http.dart';
import 'package:myapp/http/api.dart';
import 'package:myapp/units/parseTime.dart';

class newDetail extends StatefulWidget {
  Map arguments;
  newDetail({Key key,this.arguments}):super(key:key);
  @override
  _newDetailState createState() => _newDetailState(arguments:this.arguments);
}

class _newDetailState extends State<newDetail> {
  Map arguments;
  _newDetailState({this.arguments});
  Map messDetail={};

  @override
  void initState(){
    super.initState();
    this._getMessDetail();
  }

  _getMessDetail() async{
    var response = await HttpUtil().post(Api.MESSDETAIL+'?id=${arguments['id']}', token:'eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6IjM5NWFlMzJjLWE4NjUtNGMzZi04YjMxLTU4YWZiYjFlMGE5ZSJ9.xGnyYswUOJl2BewIH7w9uDIiomCb3RfIiSCIeE3pa5H19KNReSeBwY71GOA8kA_QeO_Lu8fmh3q2cdy3207zMA');
    setState(() {
      this.messDetail=response.data['data'];
      print(this.messDetail);
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
            child: Text(messDetail['targetTitle'] ,maxLines: 2,
  overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: Adapt.px(40)),),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text('发送人：${messDetail['fromName']}',style: TextStyle(fontSize: Adapt.px(30))),
            Text('时间：'+parseTime(messDetail['creationTime'], 'yy-MM-dd'),style: TextStyle(fontSize: Adapt.px(30)))
          ],),
          Divider(),
          Container(
            padding: EdgeInsets.all(Adapt.px(20)),
            child: Center(
              child: Text(messDetail['content'],style: TextStyle(fontSize: Adapt.px(36),color: Colors.grey[600],height: 1.5)),
            ),)
      ],),),
    );
  }
}