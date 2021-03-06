import 'dart:convert';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/http/http.dart';
import 'package:myapp/http/api.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:myapp/units/Toast.dart';
import 'package:flutter/material.dart';
import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class ApiCookie {
  static final CookieJar cookieJar = new CookieJar();
}

class _loginState extends State<login> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey = new GlobalKey<FormState>();
  String _token='';
  Object get responen => null;


  @override
  void dispose() {
    super.dispose();
  }

  _dologin() async {
    Map<String, dynamic> data={
      'username':_unameController.text,
      'password': _pwdController.text,
    };
    var data1 = json.encode(data);
    var response = await HttpUtil().post(Api.LOGIN, data:data1);
    this._token=response.data['token'];
    print(this._token);
    if(response.data['code'].toString()=='200'){
      print('登陆成功');
      //存token
      List<Cookie> cookies = [
        new Cookie("token", this._token),
      ];
      ApiCookie.cookieJar.saveFromResponse(Uri.parse(Api.BASE_URL+Api.LOGIN), cookies);
      Navigator.pushNamed(context, '/');
    }else{
      Toast.toast(context,msg: response.data['msg']);
      print('登陆失败');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
          children: [
                Container(
                  alignment: Alignment.center,
                  height: Adapt.px(600),
                  decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('lib/assets/images/login_bg.png'),
                        fit: BoxFit.cover,
                      )),
                  child: Center(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(25, 0, 25, 0),
                      height: Adapt.px(300),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Image.asset(
                            'lib/assets/images/logo.png',
                            width: Adapt.px(100),
                            height: Adapt.px(100),
                          ),
                          Text(
                            '甘肃省人大常委会机关智惠后勤系统国有资产管理子系统',
                            textAlign: TextAlign.center,
                            style:
                            TextStyle(color: Colors.white, fontSize: Adapt.px(40)),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Container(
                    padding: EdgeInsets.fromLTRB(
                        Adapt.px(50), Adapt.px(30), Adapt.px(50), Adapt.px(100)),
                    child: Form(
                        key: _formKey, //设置globalKey，用于后面获取FormState
                        autovalidate: true, //开启自动校验
                        child: Column(
                          children: [
                            TextFormField(
                                autofocus: true,
                                controller: _unameController,
                                decoration: InputDecoration(
                                  // labelText: "用户名",
                                    hintText: "请输入用户名",
                                    icon: Icon(Icons.person)),
                                // 校验用户名
                                validator: (v) {
                                  return v.trim().length > 0 ? null : "用户名不能为空";
                                }),
                            TextFormField(
                                controller: _pwdController,
                                decoration: InputDecoration(
                                  // labelText: "密码",
                                    hintText: "您的登录密码",
                                    icon: Icon(Icons.lock)),
                                obscureText: true,
                                //校验密码
                                validator: (v) {
                                  return v.trim().length > 5 ? null : "密码不能少于6位";
                                }),
                          ],
                        ))),
                GestureDetector(
                  child: Container(
                    margin: EdgeInsets.all(Adapt.px(20)),
                    height: Adapt.px(80),
                    width: Adapt.px(500),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(Adapt.px(50))),
                      gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Color(0xFF0a98fe),
                          Color(0xFF295ff3),
                        ],
                      ),
                    ),
                    child: Text(
                      '立即登录',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  onTap: () {
                    //验证通过提交数据
                    if ((_formKey.currentState as FormState).validate()) {
                      _dologin();
                    } else {
                      print('验证不通过');
                    }

                    // print(_pwdController.text);
                    // print(_unameController.text);
                  },
                ),
          ],
        )
    );
  }
}
