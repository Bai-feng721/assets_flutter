import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/components/apply_cell.dart';
import 'package:myapp/http/api.dart';
import 'package:myapp/http/http.dart';
import 'package:myapp/units/parseTime.dart';

class applyRecord extends StatefulWidget {
  Map arguments;
  applyRecord({Key key,this.arguments}):super(key:key);
  @override
  _applyRecordState createState() => _applyRecordState();
}

class _applyRecordState extends State<applyRecord> {
  List applyList=[];
  @override
  void initState() {
    super.initState();
    this._getList();
  }
  _getList() async{
    var response = await HttpUtil().get(Api.APPLYRECORD, token: 'eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6IjQyMDQwNzViLWFlYmUtNDNjZi1hYTllLWQ3YTU0YTI1NzE2ZCJ9.cJxOk-ZcOw3vSVJslA7k9HHN1-gBnHZ1DYO0KkyCRERaCSnVNL2bWDu48fjnl0CxL9SDOeEIcL8u82CzZ4A40g');
    setState(() {
      this.applyList=response.data["rows"];
      print(this.applyList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('申请记录'),),
      body: ListView(

        children:this.applyList.map((item){
          return applyCell(
            name:'${item['applyBy']}'+'发起申请单',
            code: parseTime(item['applyTime'], 'yy-MM-dd HH:mm:ss'),
            id: item['id'],
          );
        }).toList(),
      ),
    );
  }
}