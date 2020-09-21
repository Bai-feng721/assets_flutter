import 'package:flutter/material.dart';
import 'package:myapp/components/assets_over.dart';
import 'package:myapp/http/api.dart';
import 'package:myapp/http/http.dart';

class assetsOver extends StatefulWidget {
  @override
  _assetsOverState createState() => _assetsOverState();
}

class _assetsOverState extends State<assetsOver> {
  @override
  List assetsList=[];

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
      appBar: AppBar(
        title: Text('资产移交'),
      ),
      body: ListView(
          children: this.assetsList.map((item){
            return overCell(
              name: item['name'],
              code: item['code'],
              image: '${item['avator']}',
              id: item['id'],
            );
          }).toList()
      ),
    );
  }
}
