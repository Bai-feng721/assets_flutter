import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';

class rePassWord extends StatefulWidget {
  @override
  _rePassWordState createState() => _rePassWordState();
}

class _rePassWordState extends State<rePassWord> {
   TextEditingController _oldpwdController = new TextEditingController();
   TextEditingController _newpwdController = new TextEditingController();
  TextEditingController _repwdController = new TextEditingController();
  GlobalKey _formKey= new GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('修改密码'),
      ),
      body:Column(children: [
        Container(
          padding: EdgeInsets.fromLTRB(Adapt.px(50),Adapt.px(30),Adapt.px(50), Adapt.px(100)),
          child:Form(
            key: _formKey, //设置globalKey，用于后面获取FormState
            autovalidate: true, //开启自动校验
            child: Column(children: [
              TextFormField(
                  autofocus: true,
                  controller: _oldpwdController,
                  decoration: InputDecoration(
                      hintText: "请输入原密码",
                      icon: Icon(Icons.lock)
                  ),
                  // 校验用户名
                  validator: (v) {
                    return v
                        .trim()
                        .length > 0 ? null : "原密码不能为空";
                  }

              ),
              TextFormField(
                  controller: _newpwdController,
                  decoration: InputDecoration(
                      // labelText: "密码",
                      hintText: "请输入新密码",
                      icon: Icon(Icons.fiber_new)
                  ),
                  obscureText: true,
                  //校验密码
                  validator: (v) {
                    return v
                        .trim()
                        .length > 5 ? null : "密码不能少于6位";
                  }
              ),
              TextFormField(
                  controller: _repwdController,
                  decoration: InputDecoration(
                      // labelText: "密码",
                      hintText: "请再次输入新密码",
                      icon: Icon(Icons.fiber_new)
                  ),
                  obscureText: true,
                  //校验密码
                  validator: (v) {
                    print(_newpwdController.text);
                    print(_repwdController.text);
                    if (_newpwdController.text!=_repwdController.text) {
                      return '两次密码不一致';
                    }
                    return null;
                  }
              ),
            ],)
          )
        ),
        GestureDetector(
          child:Container(
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
                  Color(0xFF4859ff),
                ],
              ),
            ),
            child: Text(
              '确认修改',
              style: TextStyle(color: Colors.white),
            ),
        ),
        onTap: (){
          print('登录');
        },
        )
      ],)
    );
  }
}
