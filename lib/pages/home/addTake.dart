import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/units/Adapt.dart';

class addTake extends StatefulWidget {
  @override
  _addTakeState createState() => _addTakeState();
}

class _addTakeState extends State<addTake> {
  List formList;
  String barcode = "";
    initState() {
      super.initState();
        formList = [
            {"image": 'lib/assets/images/pic.png',"title": '车牌号'},
            {"image": 'lib/assets/images/pic.png',"title": '所有人'},
            {"image": 'lib/assets/images/pic.png',"title": '号牌颜色'},
            {"image": 'lib/assets/images/pic.png',"title": '车牌号'},
            
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
                  title: Text('资产盘点列表(${formList.length} )'),
                  // trailing: Text('2020-2-2'),
                ),
                Divider()
              ],),
            ),
            Flexible(child: 
              buildCell()
            ,),
            Text(barcode),
            Container(
              padding: EdgeInsets.all(10),
              width: Adapt.px(600),
              child:  RaisedButton.icon(
                color: Color(0xff4859ff),
                colorBrightness: Brightness.dark,
                icon: Icon(Icons.fullscreen),
                label: Text("扫描盘点"),
                onPressed:(){
                  scan();
                  setState(() {
                    formList.add(barcode);
                  });
                },
              ),
            )
          ])
        ),
      );
    
  }

   //扫码
Future scan() async {
  try {
    // 此处为扫码结果，barcode为二维码的内容
    String barcode = await BarcodeScanner.scan();
    setState(() => this.barcode = barcode);
    print('扫码结果: '+barcode);
    

  } on PlatformException catch (e) {
    if (e.code == BarcodeScanner.CameraAccessDenied) {
      // 未授予APP相机权限
       this.barcode = '未授予APP相机权限';
      print('未授予APP相机权限');
    } else {
      // 扫码错误
       this.barcode = '扫码错误: $e';
      print('扫码错误: $e');
    }
  } on FormatException{
    // 进入扫码页面后未扫码就返回
       this.barcode = '进入扫码页面后未扫码就返回';
    print('进入扫码页面后未扫码就返回');
  } catch (e) {
    // 扫码错误
       this.barcode = '扫码错误: $e';
    print('扫码错误: $e');
  }
}

}
