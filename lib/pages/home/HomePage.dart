import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'dart:convert' as convert;
import 'package:myapp/pages/home/drawer/drawerPage.dart';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:myapp/http/api.dart';
import 'package:myapp/http/http.dart';
import 'package:cookie_jar/cookie_jar.dart';


class HomeContent extends StatefulWidget {
  @override
  _HomeContentState createState() => _HomeContentState();
}
class ApiCookie {
  static final CookieJar cookieJar = new CookieJar();
}
class _HomeContentState extends State<HomeContent> {
   String barcode = "";
   List assetsList=[];
   List departList=[];
   @override
   void initState() {
     super.initState();
     this._getMyList();
     this._getDepartList();
     List<Cookie> cookies = ApiCookie.cookieJar.loadForRequest(Uri.parse(Api.BASE_URL+Api.LOGIN));
     // if(cookies.length<=0){
     //   Navigator.pushNamed(context, '/login');
     // }
   }
   _getMyList() async{
     var response = await HttpUtil().get(Api.MYASSETS, token: 'eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6Ijc4MGJiNjNhLTcwZGItNGE4OC1hYzkxLTEzOGRmNmJkMmI5MSJ9.yskQmXeGv0Ql9OdaxUkAfktfPMJtjK2VZxFj8UVbAqocGp4b6eQ7RcyYpEkzncjCWi6_WyUoU8XwdIVOnsCDkw');
     setState(() {
       this.assetsList=response.data["rows"];
       print(this.assetsList.length.toString());
     });
   }
   //部门资产
   _getDepartList() async{
     var response = await HttpUtil().get(Api.DEPARTASSETS, token: 'eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6Ijc4MGJiNjNhLTcwZGItNGE4OC1hYzkxLTEzOGRmNmJkMmI5MSJ9.yskQmXeGv0Ql9OdaxUkAfktfPMJtjK2VZxFj8UVbAqocGp4b6eQ7RcyYpEkzncjCWi6_WyUoU8XwdIVOnsCDkw');
     setState(() {
       this.departList=response.data["rows"];
       print(this.departList.length.toString());
     });

   }
  @override
    Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('资产管理'),
        //  title:  Text((barcode)),
        
        actions: <Widget>[ //导航栏右侧菜单
          IconButton(
            icon: Icon(Icons.qr_code_scanner), 
            onPressed: scan,
          ),
        ],
      ),
      drawer: drawerPage(),
      body:Container(
      height: Adapt.px(1000),
      child: Column(
        children: [
          Column(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(0, 30, 0, 0),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Color(0xFF5464ff),
                    Color(0xFF6e7bfe),
                  ]
                )),
                height: Adapt.px(300),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                  Text(
                    '资产总数',
                    style: TextStyle(fontSize: Adapt.px(40), color: Colors.white),
                  ),
                  Text(
                    (this.assetsList.length+this.departList.length).toString(),
                    style: TextStyle(fontSize: Adapt.px(40), color: Colors.white),
                  ),
                ],)
              ),
              Container(
                  margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                  width: Adapt.px(600),
                  height: Adapt.px(150),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                        BoxShadow(
                            color: Colors.black12,
                            offset: Offset(5.0, 5.0), //阴影xy轴偏移量
                            blurRadius: 10.0, //阴影模糊程度
                            )
                      ]),
                  alignment: Alignment.center,
                  child: Align(
                    widthFactor: 2,
                    heightFactor: 2,
                    alignment: Alignment(2, 0.0),
                    child: Container(
                        child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          Text('我的资产',style: TextStyle(fontSize: Adapt.px(32))),
                          Text(this.assetsList.length.toString(),style: TextStyle(fontSize: Adapt.px(36),color: Colors.indigo[400])),
                        ]),
                        onTap: (){
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(builder: (context)=>myAssets())
                          // );
                          Navigator.pushNamed(context, '/myAssets', arguments: {});
                        },
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          Text('部门资产',style: TextStyle(fontSize: Adapt.px(32))),
                          Text(this.departList.length.toString(),style: TextStyle(fontSize: Adapt.px(36),color: Colors.indigo[400])),
                        ]),
                        onTap: (){
                           Navigator.pushNamed(context, '/departAssets', arguments: {});
                        },
                        ),
                      ],
                    )),
                  ))
            ],
          ),
          Container(
            height: Adapt.px(500),
              child: GridView(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, //横轴三个子widget
                      childAspectRatio: 1.0 //宽高比为1时，子widget
                      ),
                  children: <Widget>[
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'lib/assets/images/icon_cg.png',
                              width: Adapt.px(60),
                              height: Adapt.px(60),
                              fit: BoxFit.cover,
                            ),
                            Text('资产云库', style: TextStyle(fontSize: Adapt.px(32) ))
                          ],
                         )
                       ),
                       onTap: (){
                         Navigator.pushNamed(context,'/路由地址', arguments:{"id":312312312});
                       },//点击
                      ),
                      
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          padding: EdgeInsets.all(15),
                            child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                              Image.asset(
                                'lib/assets/images/icon_bf.png',
                                width: Adapt.px(60),
                                height: Adapt.px(60),
                                fit: BoxFit.cover,
                              ),
                              Text('资产报废', style: TextStyle(fontSize: Adapt.px(32) ))
                            ],
                          ),
                         ),
                        onTap: (){
                          Navigator.pushNamed(context, '/assetsScrap');
                        },
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        child: Container(
                          padding: EdgeInsets.all(15),
                          child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Image.asset(
                              'lib/assets/images/icon_pd.png',
                              width: Adapt.px(60),
                              height: Adapt.px(60),
                              fit: BoxFit.cover,
                            ),
                            Text('资产盘点', style: TextStyle(fontSize: Adapt.px(32) ))
                          ],
                         )
                       ),
                       onTap: (){
                          Navigator.pushNamed(context, '/take', arguments: {});
                       },//点击
                      ),
                       GestureDetector(
                         child:Container(
                      padding: EdgeInsets.all(15),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                          Image.asset(
                            'lib/assets/images/icon_yj.png',
                            width: Adapt.px(60),
                            height: Adapt.px(60),
                            fit: BoxFit.cover,
                          ),
                          Text('资产移交', style: TextStyle(fontSize: Adapt.px(32) ))
                        ],
                      )),
                      onTap: (){
                        Navigator.pushNamed(context, '/assetsOver');
                      },
                       ),
                       GestureDetector(
                         child: Container(
                            padding: EdgeInsets.all(15),
                            child: Column(
                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                  Image.asset(
                                    'lib/assets/images/icon_wx.png',
                                    width: Adapt.px(60),
                                    height: Adapt.px(60),
                                    fit: BoxFit.cover,
                                  ),
                                  Text('资产维修', style: TextStyle(fontSize: Adapt.px(32) ))
                                ],
                          )),
                          onTap: (){
                            Navigator.pushNamed(context, '/assetsRepair');
                          },
                       ),
                       GestureDetector(
                         child: Container(
                             padding: EdgeInsets.all(15),
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                               children: [
                                 Image.asset(
                                   'lib/assets/images/icon_jy.png',
                                   width: Adapt.px(60),
                                   height: Adapt.px(60),
                                   fit: BoxFit.cover,
                                 ),
                                 Text('申请记录', style: TextStyle(fontSize: Adapt.px(32) ))
                               ],
                             )),
                         onTap: (){
                           Navigator.pushNamed(context, '/applyRecord');
                         },
                       )
                ]
             )
          )
        ],
      ),
    ));
    
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



