import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/pages/home/assetsDetail.dart';
import 'package:myapp/http/api.dart';
import 'package:myapp/http/http.dart';


class applyDetailCell extends StatefulWidget {
  final String name;
  final String code;
  final Function onTap;
  final int id;
  final int cateId;
  final String status;
  const applyDetailCell({
    Key key,
    this.id,
    this.cateId,
    this.status,
    this.onTap,
    this.code,
    this.name,
  }) : super(key:key);
  @override
  _applyCellState createState() => _applyCellState();
}

class _applyCellState extends State<applyDetailCell> {
  String applyStatus='';

  @override
  void initState() {
    super.initState();
    this._getStatus();
  }
  _getStatus() {
    if(widget.status=='0'){
      this.applyStatus='申请中';
    }else if(widget.status=='1'){
      this.applyStatus='已通过';
    }else{
      this.applyStatus='未通过';
    }
  }

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
      child: ListTile(
        title:Text(widget.name,maxLines: 1,
            overflow: TextOverflow.ellipsis,),
        subtitle:Container(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
          child: Text(widget.code,maxLines: 1,
            overflow: TextOverflow.ellipsis,),
        ),
        trailing:
          //状态按钮
           Column(
             mainAxisAlignment: MainAxisAlignment.center,
             children: [
               if(widget.status=='3')
                 Container(
                   // margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                   alignment: Alignment.center,
                   height: Adapt.px(70),
                   width: Adapt.px(150),
                   decoration: BoxDecoration(
                     color: Colors.red,
                     borderRadius: BorderRadius.all(Radius.circular(Adapt.px(40))),
                   ),
                   child: Text(this.applyStatus,style: TextStyle(color: Colors.white),),
                 ),
               if(widget.status=='2')
                 Container(
                   alignment: Alignment.center,
                   height: Adapt.px(70),
                   width: Adapt.px(150),
                   decoration: BoxDecoration(
                     color: Colors.red,
                     borderRadius: BorderRadius.all(Radius.circular(Adapt.px(40))),
                   ),
                   child: Text(this.applyStatus,style: TextStyle(color: Colors.white)),
                 ),
               if(widget.status=='1')
                 Container(
                   alignment: Alignment.center,
                   height: Adapt.px(70),
                   width: Adapt.px(150),
                   decoration: BoxDecoration(
                     color: Colors.green,
                     borderRadius: BorderRadius.all(Radius.circular(Adapt.px(40))),
                   ),
                   child: Text(this.applyStatus,style: TextStyle(color: Colors.white)),
                 ),
               if(widget.status=='0')
                 Container(
                   alignment: Alignment.center,
                   height: Adapt.px(70),
                   width: Adapt.px(150),
                   decoration: BoxDecoration(
                     color: Colors.orange,
                     borderRadius: BorderRadius.all(Radius.circular(Adapt.px(40))),
                   ),
                   child: Text(this.applyStatus,style: TextStyle(color: Colors.white)),
                 )
             ],
           )
        )

      ),
      onTap:(){
       // Navigator.pushNamed(context, '/recordDetail',arguments:{"id": widget.id,});
      },
      );
  }
}

