import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/components/assets_cell.dart';
import 'package:myapp/http/api.dart';
import 'package:myapp/http/http.dart';

class myAssets extends StatefulWidget {
  Map arguments;
  myAssets({Key key,this.arguments}):super(key:key);
  @override
  _myAssetsState createState() => _myAssetsState();
}

class _myAssetsState extends State<myAssets> {
  List assetsList=[];
  @override
  void initState() {
    super.initState();
    this._getList();
  }
  _getList() async{
    var response = await HttpUtil().get(Api.MYASSETS);
    setState(() {
      this.assetsList=response.data["rows"];
      print(this.assetsList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的资产'),),
      body: ListView(

        children:this.assetsList.map((item){
          return assetsCell(
            name: item['name'],
            code: item['code'],
            image: '${item['avator']}',
            id: item['id'],
            //隐藏底部按钮
            isshow: '0',
            cateId: item['cateId'],
            status: item['status'],
          );
        }).toList(),
      ),
    );
  }
}