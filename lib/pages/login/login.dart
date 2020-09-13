import 'dart:convert';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/http/http.dart';
import 'package:myapp/http/api.dart';

class login extends StatefulWidget {
  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  TextEditingController _unameController = new TextEditingController();
  TextEditingController _pwdController = new TextEditingController();
  GlobalKey _formKey= new GlobalKey<FormState>();

  get dio => null;
  @override
  void dispose() {
    super.dispose();
  }
   _dologin() async{
    // var data={
    //    'username':_unameController.text,
    //   'password': _pwdController.text,
    // };
    // var response = await HttpUtil().post(Api.LOGIN, data: data);
    //  Map userMap = json.decode(response.toString());
    var response = await dio.get('https://a.itying.com/api/productlist');
      print(response);
      print('1111');
    }
            @override
          
            Widget build(BuildContext context) {
              return Scaffold(
                body:Column(children: [
                  Container(
                      alignment: Alignment.center,
                      height: Adapt.px(600),
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('lib/assets/images/login_bg.png'),
                          fit: BoxFit.cover,
                        )
                      ),
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
                            textAlign:TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: Adapt.px(40)
                            ),
                          )
                        ],), 
                        ),
                      ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(Adapt.px(50),Adapt.px(30),Adapt.px(50), Adapt.px(100)),
                    child:Form(
                      key: _formKey, //设置globalKey，用于后面获取FormState
                      autovalidate: true, //开启自动校验
                      child: Column(children: [
                        TextFormField(
                            autofocus: true,
                            controller: _unameController,
                            decoration: InputDecoration(
                                // labelText: "用户名",
                                hintText: "请输入用户名",
                                icon: Icon(Icons.person)
                            ),
                            // 校验用户名
                            validator: (v) {
                              return v
                                  .trim()
                                  .length > 0 ? null : "用户名不能为空";
                            }
          
                        ),
                        TextFormField(
                            controller: _pwdController,
                            decoration: InputDecoration(
                                // labelText: "密码",
                                hintText: "您的登录密码",
                                icon: Icon(Icons.lock)
                            ),
                            obscureText: true,
                            //校验密码
                            validator: (v) {
                              return v
                                  .trim()
                                  .length > 5 ? null : "密码不能少于6位";
                            }
                        ),
                      ],)
                    )
                  ),
                  GestureDetector(
                    child:Container(
                    // padding: EdgeInsets.all(Adapt.px(20)),
                    height: Adapt.px(80),
                    width: Adapt.px(600),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        borderRadius:BorderRadius.all(Radius.circular(Adapt.px(50))) ,
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
                  onTap: (){
                      //验证通过提交数据
                    if((_formKey.currentState as FormState).validate()){
                      _dologin();
                    }else{
                      print('验证不通过');
          
                    }
                    
                    // print(_pwdController.text);
                    // print(_unameController.text);
                  },
                  ),
                ],)
              );
            }
          }
          
          class Dio {
       post(String s) {}
}
