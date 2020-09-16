import 'package:flutter/material.dart';
import 'package:myapp/components/assets_scrap.dart';
import 'package:myapp/http/api.dart';
import 'package:myapp/http/http.dart';

class assetsScrap extends StatefulWidget {
  @override
  _assetsScrapState createState() => _assetsScrapState();
}

class _assetsScrapState extends State<assetsScrap> {
  @override
  List assetsList=[];

  void initState() {
    super.initState();
    this._getList();
  }
  _getList() async{
    var response = await HttpUtil().get(Api.MYASSETS, token: 'eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6ImYyMjU0NzI1LTNmMTktNGRkOC04OGIwLWRkMGQxZTJiM2ZlOCJ9.ASxyymMhMQG_e40i9n3SL2ROvUTAErVTPFSGuWZrstsquQbdFgqY6uJhJ6BvCugSqUvPwR1aU9XxZMGKJn-eSw');
    setState(() {
      this.assetsList=response.data["rows"];
      print(this.assetsList);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('资产报废'),
      ),
      body: ListView(
          children: this.assetsList.map((item){
            return scrapCell(
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
