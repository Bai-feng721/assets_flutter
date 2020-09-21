import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/components/icon_text.dart';
import 'package:myapp/http/http.dart';
import 'package:myapp/http/api.dart';
import 'package:myapp/pages/login/login.dart';
import 'package:myapp/pages/login/rePassWord.dart';

class MyPage extends StatefulWidget {
  @override
  _MyPageState createState() => _MyPageState();
}

class _MyPageState extends State<MyPage> {
  get title => null;
  Map userInfo = {};
  @override
  void initState(){
    super.initState();
    // this._getinfo();
  }

  _getinfo() async{
    var response = await HttpUtil().get(Api.GETINFO);
    setState(() {
      this.userInfo=response.data['user'];
      print(this.userInfo);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('个人中心'),
        ),
        body: Container(
          child: Column(
            children: [
              GestureDetector(
                child:Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                        border: Border(bottom: BorderSide(width: 1,color: Colors.black12)),
                  ),
                  child:Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                    children: [
                      ClipOval(
                        child: Image.network(
                          // Api.BASE_URL+userInfo['avatar'] ??
                              Api.BASE_URL+'/profile/avatar/2020/08/26/980419316eca98c610788308732f4afb.jpeg',
                          width: Adapt.px(100),
                          height: Adapt.px(100),
                          fit: BoxFit.cover,
                        )
                      ),
                    Container(
                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                      Text(userInfo['userName']??'请登录',style: TextStyle(fontSize: Adapt.px(36)),),
                      Container(
                        margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                        alignment: Alignment.center,
                        height: Adapt.px(50),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(Adapt.px(40))),
                          border: Border.all(width: 1, color: Colors.blue[700]),
                        ),
                        child:(Text('普通用户',style: TextStyle(color: Colors.blue[700]),))
                      ),
                    ],),)
                  ],
                ),
                Icon(Icons.chevron_right)
                ],)
                ),
                onTap: (){
                  print('跳登录');
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>login())
                  );
                },
              ),
              
              iconTextItem(
                 image: Image.asset(
                    'lib/assets/images/xgmm.png',
                    height: Adapt.px(50),
                    width: Adapt.px(50),
                 ),
                 text: Text('修改密码'),
                  onPress: (){
                  print('修改密码');
                  Navigator.of(context).push(
                    MaterialPageRoute(builder: (context)=>rePassWord())
                  );
                },
              ),
              iconTextItem(
                 image: Image.asset(
                   'lib/assets/images/bbgx.png',
                    height: Adapt.px(50),
                    width: Adapt.px(50),
                 ),
                 text: Text('版本更新')
              ),
              iconTextItem(
                 image: Image.asset(
                   'lib/assets/images/fwdh.png',
                    height: Adapt.px(50),
                    width: Adapt.px(50),
                 ),
                 text: Text('服务电话')
              ),
               iconTextItem(
                 image: Image.asset(
                    'lib/assets/images/tcdl.png',
                    height: Adapt.px(50),
                    width: Adapt.px(50),
                 ),
                 text: Text('退出登录')
              )
            ],
          ),
        ));
  }
}
