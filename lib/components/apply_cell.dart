import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/pages/home/assetsDetail.dart';
import 'package:myapp/http/api.dart';
import 'package:myapp/http/http.dart';


class applyCell extends StatefulWidget {
  final String name;
  final String code;
  final Function onTap;
  final int id;
  final int cateId;
  final String status;
  const applyCell({
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

class _applyCellState extends State<applyCell> {
  String assetsStatus='';

  @override
  void initState() {
    super.initState();
    // this._getStatus();
  }
  // _getStatus() async{
  //   var res = await HttpUtil().get(Api.ASSETSSTATUS+'?type=asset_status&value=${widget.status}', token: 'eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6Ijc4MGJiNjNhLTcwZGItNGE4OC1hYzkxLTEzOGRmNmJkMmI5MSJ9.yskQmXeGv0Ql9OdaxUkAfktfPMJtjK2VZxFj8UVbAqocGp4b6eQ7RcyYpEkzncjCWi6_WyUoU8XwdIVOnsCDkw');
  //   setState(() {
  //     this.assetsStatus=res.data["data"];
  //     print(this.assetsStatus);
  //   });
  // }

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
        title:Text(widget.name??'申请单',maxLines: 1,
            overflow: TextOverflow.ellipsis,),
        subtitle:Container(
          padding: EdgeInsets.fromLTRB(0, 5, 0, 10),
          child: Text(widget.code??'2020-1-1 21:12:43',maxLines: 1,
            overflow: TextOverflow.ellipsis,),
        ),
        trailing:Icon(Icons.reorder)

          //状态按钮
          //  Container(
          //   alignment: Alignment.center,
          //   height: Adapt.px(50),
          //   width: Adapt.px(100),
          //   decoration: BoxDecoration(
          //     color: Color(0xFFfd8900),
          //     borderRadius: BorderRadius.all(Radius.circular(Adapt.px(30))),
          //     ),
          //   child: Text(this.assetsStatus),
          // )
        )

      ),
      onTap:(){
       Navigator.pushNamed(context, '/recordDetail',arguments:{"id": widget.id,});
      },
      );
  }
}

