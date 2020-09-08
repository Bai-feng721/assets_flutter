import 'dart:io';

import 'package:flutter/material.dart';
import 'package:myapp/pages/home/repairApply.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/pages/home/drawer/drawerPage.dart';

class HomeContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        title: Text('资产管理'),
        actions: <Widget>[ //导航栏右侧菜单
          IconButton(
            icon: Icon(Icons.qr_code_scanner), 
            onPressed: () {
              //摄像头
            }
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
                    '23',
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
                          Text('88',style: TextStyle(fontSize: Adapt.px(36),color: Colors.indigo[400])),
                        ]),
                        onTap: (){
                          // Navigator.of(context).push(
                          //   MaterialPageRoute(builder: (context)=>myAssets())
                          // );
                          Navigator.pushNamed(context, '/myAssets', arguments: {"ceshi": 123});
                        },
                        ),
                        GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          child:Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                          Text('部门资产',style: TextStyle(fontSize: Adapt.px(32))),
                          Text('88',style: TextStyle(fontSize: Adapt.px(36),color: Colors.indigo[400])),
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
                            Text('资产采购', style: TextStyle(fontSize: Adapt.px(32) ))
                          ],
                         )
                       ),
                       onTap: (){
                         Navigator.pushNamed(context,'/buy', arguments:{"id":312312312});
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
                       Container(
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
                          Text('资产借用', style: TextStyle(fontSize: Adapt.px(32) ))
                        ],
                      )),
                ]
             )
          )
        ],
      ),
    ));
    
  }
}
