import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';

class addTake extends StatefulWidget {
  @override
  _addTakeState createState() => _addTakeState();
}

class _addTakeState extends State<addTake> {
  List formList;
    initState() {
      super.initState();
        formList = [
            {"image": 'lib/assets/images/pic.png',"title": '车牌号'},
            {"image": 'lib/assets/images/pic.png',"title": '所有人'},
            {"image": 'lib/assets/images/pic.png',"title": '号牌颜色'},
            {"image": 'lib/assets/images/pic.png',"title": '车牌号'},
            {"image": 'lib/assets/images/pic.png',"title": '所有人'},
            {"image": 'lib/assets/images/pic.png',"title": '号牌颜色'},
            {"image": 'lib/assets/images/pic.png',"title": '车牌号'},
            {"image": 'lib/assets/images/pic.png',"title": '所有人'},
            {"image": 'lib/assets/images/pic.png',"title": '号牌颜色'},
            {"image": 'lib/assets/images/pic.png',"title": '车牌号'},
            {"image": 'lib/assets/images/pic.png',"title": '所有人'},
            {"image": 'lib/assets/images/pic.png',"title": '号牌颜色'},
        ];
    }

    Widget buildCell() {
        List<Widget> tiles = [];//先建一个数组用于存放循环生成的widget
        Widget content; //单独一个widget组件，用于返回需要生成的内容widget
        for(var item in formList) {
            tiles.add(
              new Column(
                children: <Widget>[
                    ListTile(
                      title:Text(item['title']),
                      leading: Image.asset(item['image']),
                      trailing: Text('2020-2-3'),
                    ),
                    Divider()
                ]
              )
            );
        }
        content = new ListView(
            children: tiles //重点在这里，因为用编辑器写Column生成的children后面会跟一个<Widget>[]，
            //此时如果我们直接把生成的tiles放在<Widget>[]中是会报一个类型不匹配的错误，把<Widget>[]删了就可以了
        );
        return content;
    }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('新建盘点'),
        actions: [
         FlatButton(
            child: Text("保存"),
            colorBrightness: Brightness.dark,
            onPressed: () {

            },
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Container(
              child: Column(children: [
                ListTile(
                  leading: Icon(Icons.assignment,color: Color(0xff4859ff),),
                  title: Text('资产盘点列表( )'),
                  // trailing: Text('2020-2-2'),
                ),
                Divider()
              ],),
            ),
            Flexible(child: 
              buildCell()
            ,),
            Container(
              padding: EdgeInsets.all(10),
              width: Adapt.px(600),
              child:  RaisedButton.icon(
                color: Color(0xff4859ff),
                colorBrightness: Brightness.dark,
                icon: Icon(Icons.fullscreen),
                label: Text("扫描盘点"),
                onPressed:(){

                },
              ),
            )
          ])
        ),
      );
    
  }
}
