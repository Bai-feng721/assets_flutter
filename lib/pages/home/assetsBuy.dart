import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/components/assets_cell.dart';

class assetsBuy extends StatefulWidget {
   final arguments;
  assetsBuy({this.arguments});
  @override
  _assetsBuyState createState() => _assetsBuyState();
}

class _assetsBuyState extends State<assetsBuy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('资产采购'),),
      body: ListView(
        // decoration: BoxDecoration( color: Colors.black12),
        children: [
          assetsCell(
            name:'联想笔记本电脑',
            code:'dewdsaa1121cacsacacaa2w',
          ),
          assetsCell(
            name:'打印机',
            code:'dewdsaa1121cacsacacaa2w',
            image: 'lib/assets/images/pic.png',
          ),
           assetsCell(
            name:'手机',
            code:'dewdsaa1121cacsacacaa2w',
          ),
           assetsCell(
            name:'打印机',
            code:'dewdsaa1121cacsacacaa2w',
            image: 'lib/assets/images/pic.png',
          ),
           assetsCell(
            name:'手机',
            code:'dewdsaa1121cacsacacaa2w',
          ),
           assetsCell(
            name:'手机',
            code:'dewdsaa1121cacsacacaa2w',
          ),
           assetsCell(
            name:'打印机',
            code:'dewdsaa1121cacsacacaa2w',
            image: 'lib/assets/images/pic.png',
          ),
           assetsCell(
            name:'手机',
            code:'dewdsaa1121cacsacacaa2w',
          ),
           assetsCell(
            name:'手机',
            code:'dewdsaa1121cacsacacaa2w',
          ),
           assetsCell(
            name:'打印机',
            code:'dewdsaa1121cacsacacaa2w',
            image: 'lib/assets/images/pic.png',
          ),
           assetsCell(
            name:'手机',
            code:'dewdsaa1121cacsacacaa2w',
          )

        ],
      ),
    );
  }
}