import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/components/applyDetail_cell.dart';
import 'package:myapp/http/api.dart';
import 'package:myapp/http/http.dart';

class recordDetail extends StatefulWidget {
  Map arguments;
  recordDetail({Key key,this.arguments}):super(key:key);
  @override
  _recordDetailState createState() => _recordDetailState(arguments:this.arguments);
}

class _recordDetailState extends State<recordDetail> {
  Map arguments;
  _recordDetailState({this.arguments});
  List applyList=[];
  @override
  void initState() {
    super.initState();
    this._getList();
  }
  _getList() async{
    var response = await HttpUtil().get(Api.RECORDDETAIL+'?applyId=${arguments['id']}');
    setState(() {
      this.applyList=response.data["rows"];
      print(response);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('申请详情'),),
      body: ListView(

        children:this.applyList.map((item){
          return applyDetailCell(
            name: '申请了'+'${item['name']}',
            code: '数量'+'${item['number']}',
            id: item['id'],
            //隐藏底部按钮
            status: item['deptStatus'],
          );
        }).toList(),
      ),
    );
  }
}