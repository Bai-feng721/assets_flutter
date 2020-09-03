import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/components/assets_cell.dart';


class asstesDetail extends StatefulWidget {
  @override
  _asstesDetailState createState() => _asstesDetailState();
}

class _asstesDetailState extends State<asstesDetail> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('资产详情'),),
      body: Container(
        // padding: EdgeInsets.all(Adapt.px(20)),
        child: Column(children: [
        assetsCell(
          name:'华为notebook',
          code: 'sdaced12',
        ),
        detailCell(name: '资产编码',subname: '笔记本fsadsa121sas电脑'),
        detailCell(name: '资产名称',subname: '笔记本电脑'),
        detailCell(name: '资产分类',subname: '固定资产'),
        detailCell(name: '所属部门',subname: '固定资产'),
        detailCell(name: '使用人',subname: '固定资产'),
        detailCell(name: '存放地点',subname: '固定资产'),
        detailCell(name: '使用期限',subname: '固定资产'),
      ],),),
    );
  }
}

class detailCell extends StatefulWidget {
  final String name;
  final String subname;
  const detailCell({
    Key key,
    this.name,
    this.subname,
  }):super(key:key);
  @override
  _detailCellState createState() => _detailCellState();
}

class _detailCellState extends State<detailCell> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color:Colors.black12 ))),
      child: ListTile(
          leading:Text(widget.name??'资产名称'),
          trailing:Text(
            widget.subname??'笔记本电脑',
            style: TextStyle(color: Colors.black,fontSize: Adapt.px(34)
            ),
          ),
        ),
    );
  }
}