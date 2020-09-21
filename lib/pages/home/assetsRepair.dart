import 'package:flutter/material.dart';
import 'package:myapp/components/assets_repair.dart';
import 'package:myapp/http/api.dart';
import 'package:myapp/http/http.dart';

class assetsRepair extends StatefulWidget {
  @override
  _assetsRepairState createState() => _assetsRepairState();
}

class _assetsRepairState extends State<assetsRepair> {
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
        title: Text('资产维修'),
      ),
      body: ListView(
        children: this.assetsList.map((item){
          return repairCell(
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
