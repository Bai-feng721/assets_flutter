import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/components/assets_cell.dart';
import 'package:myapp/http/api.dart';
import 'package:myapp/http/http.dart';

class departAssets extends StatefulWidget {
  final arguments;
  departAssets({this.arguments});
  @override
  _departAssetsState createState() => _departAssetsState();
}

class _departAssetsState extends State<departAssets> {
  List assetsList=[];
  @override
  void initState() {
    super.initState();
    this._getList();
  }
  _getList() async{
    var response = await HttpUtil().get(Api.DEPARTASSETS, token: 'eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6Ijc4MGJiNjNhLTcwZGItNGE4OC1hYzkxLTEzOGRmNmJkMmI5MSJ9.yskQmXeGv0Ql9OdaxUkAfktfPMJtjK2VZxFj8UVbAqocGp4b6eQ7RcyYpEkzncjCWi6_WyUoU8XwdIVOnsCDkw');
    setState(() {
      this.assetsList=response.data["rows"];
      print(this.assetsList);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('部门资产'),),
      body: ListView(
        children: this.assetsList.map((item){
          return assetsCell(
            name: item['name'],
            code: item['code'],
            image:Api.BASE_URL+ item['avator'],
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