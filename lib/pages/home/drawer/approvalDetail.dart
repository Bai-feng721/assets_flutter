import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';


class approvalDetail extends StatefulWidget {
  Map arguments;
  approvalDetail({Key key ,this.arguments}):super(key:key);
  @override
  _approvalDetailState createState() => _approvalDetailState(arguments:this.arguments);
}

class _approvalDetailState extends State<approvalDetail> {
 Map arguments;
 _approvalDetailState({this.arguments});
 
  @override

  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text('采购审批详情'),),
      body: ConstrainedBox(
          constraints: BoxConstraints.expand(),
          child: Stack(
            alignment:Alignment.topCenter , //指定未定位或部分定位widget的对齐方式
            children: <Widget>[
              Positioned(
                // top: 20.0,
                child:Container(
                height: Adapt.px(350),
                decoration: BoxDecoration(
                  image: DecorationImage(
                  image: AssetImage("lib/assets/images/zcxqbj.png"),
                  fit: BoxFit.cover,
                ),
                ),
              )),
              Positioned(
                top:Adapt.px(150),
                child: Container(
                padding: EdgeInsets.all(20),
                width: Adapt.px(600),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(Adapt.px(40))),
                  color: Colors.grey[200]
                ),
                child: Column(children: [
                  Row(children: [
                    Text('采购单号:'),
                    Text('cdscdsvv12')
                  ],),
                  Row(children: [
                    Text('资产名称:'),
                    Text('手机')
                  ],),
                  Row(children: [
                    Text('采购数量:'),
                    Text('33')
                  ],),
                  Row(children: [
                    Text('采购时间:'),
                    Text('2020-1-1')
                  ],),
                  Row(children: [
                    Text('送审时间:'),
                    Text('2020-1-1')
                  ],),
                  Row(children: [
                    Text('申请部门:'),
                    Text('后勤中心')
                  ],),
                  Row(children: [
                    Text('申请理由: '),
                  ],),
                  Row(children: [
                    Expanded(child: Text('坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了坏了'),)
                  ],)
                ],),
              ),
 
              ),
              Positioned(
                bottom: 40.0,
                child: Container(
                  width: Adapt.px(600),
                  child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                  FlatButton(
                    color: Color(0xff4859ff),
                    highlightColor: Color(0xff295ff3),
                    colorBrightness: Brightness.dark,
                    splashColor: Color(0xFF0a98fe),
                    child: Text("拒绝"),
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {

                    },
                  ),
                  FlatButton(
                    color: Color(0xff4859ff),
                    highlightColor: Color(0xff295ff3),
                    colorBrightness: Brightness.dark,
                    splashColor: Colors.grey,
                    child: Text("同意"),
                    shape:RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
                    onPressed: () {},
                  )
              ],),
                )
              
              )
            ],
          ),
        ));
    
  }
}

