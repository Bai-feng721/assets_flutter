import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/pages/home/drawer/approvalDetail.dart';

class approvalCell extends StatefulWidget {
  final String count;
  final String name;
  final String code;
  final String time;
  final String ispush;
  final Function onTap;
  const approvalCell({
    Key key,
    this.onTap,
    this.ispush,
    this.code,
    this.count,
    this.name,
    this.time
  }) : super(key:key);
  @override
  _approvalCellState createState() => _approvalCellState();
}

class _approvalCellState extends State<approvalCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      behavior: HitTestBehavior.opaque,
    child: Container(
      // margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
      decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: Adapt.px(20),color: Color(0xFFf2f2f2)),
              // top: BorderSide(width: Adapt.px(20),color: Color(0xFFf2f2f2)),
              left: BorderSide(width: Adapt.px(20),color: Color(0xFFf2f2f2)),
              bottom: BorderSide(width: Adapt.px(20),color: Color(0xFFf2f2f2)),
              
            ),
            // border: Border.all(color: Colors.black12,width: Adapt.px(20))///边框颜色、宽
      ),
      child:Padding(
      padding: EdgeInsets.fromLTRB(20.0, 10.0, 12.0, 10.0),
        child:  Column(
            children: [
              Row(children: [
                Text('采购单号：',style: TextStyle(color: Colors.grey[600]),),
                Text(widget.code??'sdkd22121'),
              ],),
              Row(children: [
                Text('资产名称：',style: TextStyle(color: Colors.grey[600]),),
                Text(widget.name??'电脑'),
              ],),
              Row(children: [
                Text('采购数量：',style: TextStyle(color: Colors.grey[600]),),
                Text(widget.count??'2'),
              ],),
              Row(children: [
                Text('采购时间：',style: TextStyle(color: Colors.grey[600]),),
                Text(widget.time??'2020-11-1'),
              ],)
            ],
          ),)
      ),
      onTap:(){
        widget.ispush??
       Navigator.pushNamed(context, '/approvalDetail',arguments:{"id":'88'});
      }
      );
  }
}

