import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';

class repairCell extends StatefulWidget {
  final String image;
  final String name;
  final String code;
  final Function onTap;
  final int id;
  const repairCell({
    Key key,
    this.onTap,
    this.id,
    this.image,
    this.name,
    this.code
  }): super(key:key);
  @override
  _repairCellState createState() => _repairCellState();
}

class _repairCellState extends State<repairCell> {
  @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
            border: Border(
              right: BorderSide(width: Adapt.px(20),color: Color(0xFFf2f2f2)),
              // top: BorderSide(width: Adapt.px(20),color: Color(0xFFf2f2f2)),
              left: BorderSide(width: Adapt.px(20),color: Color(0xFFf2f2f2)),
              bottom: BorderSide(width: Adapt.px(20),color: Color(0xFFf2f2f2)),
              
            ),
            // border: Border.all(color: Colors.black12,width: Adapt.px(20))///边框颜色、宽
      ),
      child: ListTile(
        leading: Image.network(
          widget.image,
          width: Adapt.px(150),
          fit:BoxFit.cover ,
        ),
        title:Text(widget.name??'请输入名称',maxLines: 1,
            overflow: TextOverflow.ellipsis,),
        subtitle:Text(widget.code??'ewfcdsvc112121',maxLines: 1,
            overflow: TextOverflow.ellipsis,),
        trailing:
           Container(
             width: Adapt.px(150),
             child: FlatButton(
            child: Text("维修",style: TextStyle(color: Colors.white),),
            color: Color(0xff4859ff),
            onPressed: () {
              Navigator.pushNamed(context, '/repairApply',arguments: {'code':this.widget.code,'id':this.widget.id});
            },
          ),
           )
        )
    );
  }
}