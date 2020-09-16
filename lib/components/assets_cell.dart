import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/pages/home/assetsDetail.dart';
import 'package:myapp/http/api.dart';
import 'package:myapp/http/http.dart';


class assetsCell extends StatefulWidget {
  final String image;
  final String name;
  final String code;
  final String isshow;
  final Function onTap;
  final int id;
  final int cateId;
  final String status;
  const assetsCell({
    Key key,
    this.id,
    this.cateId,
    this.status,
    this.onTap,
    this.code,
    this.image,
    this.name,
    this.isshow
  }) : super(key:key);
  @override
  _assetsCellState createState() => _assetsCellState();
}

class _assetsCellState extends State<assetsCell> {
  String assetsStatus='';

  @override
  void initState() {
    super.initState();
    this._getStatus();
  }
  _getStatus() async{
    var res = await HttpUtil().get(Api.ASSETSSTATUS+'?type=asset_status&value=${widget.status}', token: 'eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6ImI2ZmE4YzI0LWUyZjQtNDA5NS1iZTAwLWU0NDY1OWNjODY4NyJ9.m7QBCX3BYMtkzzA-TYYMk8OJCQtzpKdsaab7RQfIr13Hz-qX3cJkpbdFUQh751t88mKQIGlVO1iPur6H9-qDMQ');
    setState(() {
      this.assetsStatus=res.data["data"];
      print(this.assetsStatus);
    });
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
        leading: Image.network(
          widget.image??Api.BASE_URL+'/profile/avatar/2020/09/08/d425816766f32d9d5344f26e4a217a32.jpg',
          width: Adapt.px(150),
          fit:BoxFit.cover ,
        ),
        title:Text(widget.name??'请输入名称',maxLines: 1,
            overflow: TextOverflow.ellipsis,),
        subtitle:Text(widget.code??'ewfcdsvc112121',maxLines: 1,
            overflow: TextOverflow.ellipsis,),
        trailing:
           Container(
            alignment: Alignment.center,
            height: Adapt.px(50),
            width: Adapt.px(100),
            decoration: BoxDecoration(
              color: Color(0xFFfd8900),
              borderRadius: BorderRadius.all(Radius.circular(Adapt.px(30))),
              ),
            child: Text(this.assetsStatus),
          )
        )

      ),
      onTap:(){
       Navigator.pushNamed(context, '/detail',arguments:{"isshow":widget.isshow??'0',"id": widget.id,'cateId':widget.cateId,'status':this.assetsStatus});
      },
      );
  }
}

