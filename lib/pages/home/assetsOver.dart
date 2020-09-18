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
    var response = await HttpUtil().get(Api.MYASSETS, token: 'eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6IjU2ZGI5NWU1LTE2ZjMtNGFlYS1iN2ViLTJiNjRiM2Q3YjA2ZCJ9.ROMYloJLzbI8jPRXKkkhq-fojYIOosCpQ5eRT6Nz9vidf_lw2qyhz4ce4SGPIcDiJMooComv7mSWvOB5yVyKbw');
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
              image: Api.BASE_URL+ item['avator'],
              id: item['id'],
            );
          }).toList()
      ),
    );
  }
}
