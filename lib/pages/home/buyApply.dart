import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';


class buyApply extends StatefulWidget {
  Map arguments;
  buyApply({Key key ,this.arguments}):super(key:key);
  @override
  _buyApplyState createState() => _buyApplyState(arguments:this.arguments);
}

class _buyApplyState extends State<buyApply> {
 Map arguments;
 _buyApplyState({this.arguments});
  TextEditingController _personController = new TextEditingController();
  TextEditingController _assetsController = new TextEditingController();

  GlobalKey _formKey= new GlobalKey<FormState>();
  @override

  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text('采购申请单'),),
      body: Container(
        padding: EdgeInsets.all(Adapt.px(20)),
        child: Form(
          key: _formKey, //设置globalKey，用于后面获取FormState
          autovalidate: true, //开启自动校验
          child: ListView(children: [
            TextFormField(
                  autofocus: true,
                  controller: _personController,
                  decoration: InputDecoration(
                      // labelText: "用户名",
                      hintText: "请输入资产名称",
                      icon:Text('资产名称',style: TextStyle(fontSize: Adapt.px(36)),)
                  ),
                  // 校验用户名
                  validator: (v) {
                    return v
                        .trim()
                        .length > 0 ? null : "资产名称不能为空";
                  }
              ),
              TextFormField(
                  autofocus: true,
                  controller: _assetsController,
                  decoration: InputDecoration(
                      // labelText: "用户名",
                      hintText:"请输入申请数量",
                      icon: Text('申请数量',style: TextStyle(fontSize: Adapt.px(36)),)
                  ),
                  // 校验用户名
                  validator: (v) {
                    return v
                        .trim()
                        .length > 0 ? null : "申请数量不能为空";
                  }

              ),

              //登录
              Padding(
                padding: const EdgeInsets.only(top: 28.0),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(10.0),
                        child: Text("提 交"),
                        color: Theme
                            .of(context)
                            .primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          //在这里不能通过此方式获取FormState，context不对
                          //print(Form.of(context));

                          // 通过_formKey.currentState 获取FormState后，
                          // 调用validate()方法校验用户名密码是否合法，校验
                          // 通过后再提交数据。 
                          if((_formKey.currentState as FormState).validate()){
                            //验证通过提交数据
                          }
                        },
                      ),
                    ),
                  ],
                ),
              )
          ],)
          
        )
      ),
    );
  }
}