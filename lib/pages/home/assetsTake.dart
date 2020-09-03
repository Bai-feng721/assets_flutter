import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/components/assets_take.dart';

class assetsTake extends StatefulWidget {
  @override
  _assetsTakeState createState() => _assetsTakeState();
}

class _assetsTakeState extends State<assetsTake> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('资产盘点(共 条)'),
        actions: <Widget>[ //导航栏右侧菜单
          FlatButton.icon(
          icon: Icon(Icons.add,color: Colors.white),
          label: Text("添加盘点",style: TextStyle(color: Colors.white),),
          onPressed: (){

          },
        ),
        ],
      ),
      body:  ListView(
      children: [
        takeCell(
          name:'戴尔笔记本',
          code:'31dscs212',
          time:'2020-2-2',
          image: 'lib/assets/images/pic.png',
        ),
        takeCell(
          name:'戴尔笔记本',
          code:'31dscs212',
          time:'2020-2-2',
          image: 'lib/assets/images/pic.png',
        ),
        takeCell()
      ],
    ),
    );
  }
}