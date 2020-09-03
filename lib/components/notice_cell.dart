import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';


class noticeCell extends StatefulWidget {
  final String text;
  final String subtitle;
  final Widget time;
  final Function onTap;
  const noticeCell({
    Key key,
    this.text,
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
          leading: Image.asset(
            'lib/assets/images/icon_gg.png',
            width: Adapt.px(100),
            height: Adapt.px(100),
            fit: BoxFit.cover,
          ),
          title:Text(
            widget.text??'请输入组件标题',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
           subtitle:Text(
            widget.subtitle??'请输入组件二级标题',
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          trailing:widget.time?? Text('2000-01-01'),
        ),
    ),
    onTap: widget.onTap,
    );
  }
}