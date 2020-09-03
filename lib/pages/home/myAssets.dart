import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/components/assets_cell.dart';

class myAssets extends StatefulWidget {
  final arguments;
  myAssets({this.arguments});
  @override
  _myAssetsState createState() => _myAssetsState();
}

class _myAssetsState extends State<myAssets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('我的资产'),),
      body: ListView(
        // decoration: BoxDecoration( color: Colors.black12),
        children: [
          assetsCell(
            name:'笔记本电脑',
            code:'dewdsaa1121cacsacacaa2w',
          ),
          assetsCell(
            code:'dewdsaa1121cacsacacaa2w',
          )
        ],
      ),
    );
  }
}