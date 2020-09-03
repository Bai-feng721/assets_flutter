import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';

class takeCell extends StatefulWidget {
  final String image;
  final String name;
  final String code;
  final String time;
  const takeCell({
    Key key,
    this.time,
    this.code,
    this.image,
    this.name,
  }) : super(key:key);
  @override
  _takeCellState createState() => _takeCellState();
}

class _takeCellState extends State<takeCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
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
            leading: Container(
              width: Adapt.px(150),
              decoration: BoxDecoration(image:DecorationImage(image: AssetImage(
                widget.image??'lib/assets/images/computer.png'),
                fit:BoxFit.cover ,
                ) ),
              child: Align(
                alignment: Alignment.topLeft,
                child: Container(
                  width: Adapt.px(90),
                  decoration: BoxDecoration(
                    color: Color(0Xff24a61e),
                    borderRadius: BorderRadius.only(
                      bottomRight: Radius.circular(10),
                      topRight: Radius.circular(10),
                      
                    ),
                    
                  ),
                  child: Text('已盘点',
                    style: TextStyle(color: Colors.white,fontSize: Adapt.px(24)),
                ),),),
              ),
            title:Text(widget.name??'请输入名称',maxLines: 1,
                overflow: TextOverflow.ellipsis,),
            subtitle:Text(widget.code??'ewfcdsvc112121',maxLines: 1,
                overflow: TextOverflow.ellipsis,),
            trailing:Text(widget.time??'2020-2-1')
           
         )

      )
    );
  }
}