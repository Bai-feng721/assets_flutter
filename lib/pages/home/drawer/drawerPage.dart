import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';

class drawerPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return new _drawerPageState();
  }
}

class _drawerPageState extends State<drawerPage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      width: Adapt.px(500),
      decoration: BoxDecoration(color: Colors.white),
      child:ListView(
        padding: const EdgeInsets.only(),
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top:Adapt.px(100)),
            height: Adapt.px(450),
             decoration: BoxDecoration( color: Color(0xff4859ff)),
            child:Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                    width: 60.0,
                    height: 60.0,
                    child: Image.asset( 'lib/assets/images/logo.png'),
                  ),
                  Text('甘肃省人大常委会机关',style: TextStyle(color: Colors.white),),
                  Text('智惠后勤系统国有资产管理子系统',style: TextStyle(color: Colors.white)),
              ],
          ) ,
          ),
        new ListTile(
            title: new Text('采购审批'),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();
              Navigator.pushNamed(context, '/buyApproval');
            }),
        new Divider(),
        new ListTile(
            title: new Text('Route'),
            trailing: new Icon(Icons.arrow_right),
            onTap: () {
              Navigator.of(context).pop();/*隐藏drawer*/
              Navigator.pushNamed(context, '/RoutePage');
            }),
        new Divider(),
        // new ListTile(
        //     title: new Text('数据存储'),
        //     trailing: new Icon(Icons.arrow_right),
        //     onTap: () {
        //       Navigator.of(context).pop();
        //       Navigator.pushNamed(context, '/DataPage');
        //     }),
        // new Divider(),
        // new ListTile(
        //     title: new Text('Gesture'),
        //     trailing: new Icon(Icons.arrow_right),
        //     onTap: () {
        //       Navigator.of(context).pop();
        //       Navigator.pushNamed(context, '/GesturePage');
        //     }),
        // new Divider(),
        // new ListTile( 
        //     title: new Text('加载图片'),
        //     trailing: new Icon(Icons.arrow_right),
        //     onTap: () {
        //       Navigator.of(context).pop();
        //       Navigator.pushNamed(context, '/LoadImgPage');
        //     }),
      
      ],
    )
    );
  }
}