import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';

iconTextItem(
    {Widget image,
    importance = false,
    Widget text,
    VoidCallback onPress,
    Key key}) {
  return GestureDetector(
    child: Container(
      margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
      decoration: BoxDecoration(
            border: Border(bottom: BorderSide(width: 1,color: Colors.black12)),
      ),
      child: ListTile(
        leading: image??Image.asset(
          'lib/assets/images/ghsjh.png',
          height: Adapt.px(50),
          width: Adapt.px(50),
        ),
        title:text??Text('请输入内容'),
        trailing:Icon(Icons.chevron_right)
      ),
      ),
    onTap: onPress,
  );
}
