import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';


class noticeCell extends StatefulWidget {
  final String text;
  final String subtitle;
  final Widget time;
  final String isread;
  final int id;
  final Function onTap;
  const noticeCell({
    Key key,
    this.text,
    this.id,
    this.isread,
    this.subtitle,
    this.time,
    this.onTap,
  }) : super(key: key);
  @override
  _noticeCellState createState() => _noticeCellState();
}

class _noticeCellState extends State<noticeCell> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child:Container(
       decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
            bottom: BorderSide(width: 1,color: Colors.black12)
            )
           ),
          child:  ListTile(
          leading: Stack(
            children: [
              Image.asset(
                'lib/assets/images/icon_gg.png',
                width: Adapt.px(80),
                height: Adapt.px(80),
                fit: BoxFit.cover,
              ),
              widget.isread==1?Positioned(
                left: Adapt.px(60),
                child:ClipOval(child: Container(
                  color: Colors.red,
                  width: Adapt.px(20),
                  height: Adapt.px(20),
                ),)
              ):Text('')
            ],
          ),
          title:Text(
            widget.text??'组件标题',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          //  subtitle:Text(
          //   widget.subtitle??'组件二级标题',
          //   maxLines: 1,
          //   overflow: TextOverflow.ellipsis,
          // ),
          trailing:widget.time?? Text('2000-01-01'),
        ),
    ),
    onTap: ()=> {
      Navigator.pushNamed(context, '/noticeDetail',arguments: {'id':widget.id})
    },
    onLongPress: () => print("LongPress"), //长按
    );
  }
}