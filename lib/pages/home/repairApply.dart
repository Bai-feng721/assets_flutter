import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class repairApply extends StatefulWidget {
  final arguments;
  repairApply({this.arguments});
  @override
  _repairApplyState createState() => _repairApplyState();
}

class _repairApplyState extends State<repairApply> {
  var date;

  TextEditingController _personController = new TextEditingController();
  TextEditingController _assetsController = new TextEditingController();
  TextEditingController _dateController = new TextEditingController();
  TextEditingController _contentController = new TextEditingController();
  GlobalKey _formKey= new GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('资产维修申请'),),
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
                      hintText: "请输入报修人",
                      icon:Text('报修人员',style: TextStyle(fontSize: Adapt.px(36)),)
                  ),
                  // 校验用户名
                  validator: (v) {
                    return v
                        .trim()
                        .length > 0 ? null : "报修人不能为空";
                  }
              ),
              TextFormField(
                  autofocus: true,
                  controller: _assetsController,
                  decoration: InputDecoration(
                      // labelText: "用户名",
                      hintText: "请输入维修资产名称",
                      icon: Text('资产名称',style: TextStyle(fontSize: Adapt.px(36)),)
                  ),
                  // 校验用户名
                  validator: (v) {
                    return v
                        .trim()
                        .length > 0 ? null : "维修资产名称不能为空";
                  }

              ),
              TextFormField(
                  autofocus: true,
                  controller: _dateController,
                  decoration: InputDecoration(
                      // labelText: "用户名",
                      hintText:this.date?? "请选择维修日期",
                      icon: Text('维修日期',style: TextStyle(fontSize: Adapt.px(36)),)
                  ),
                  //点击选择日期
                  onTap: (){
                    DatePicker.showDatePicker(context,
                    // 是否展示顶部操作按钮
                    showTitleActions: true,
                    // 最小时间
                    minTime: DateTime(2018, 1, 1),
                    // 最大时间
                    maxTime: DateTime(2049, 1, 1),
                    //change事件
                    onChanged: (date) {
                      print('change $date');
                    },
                    //确定事件
                    onConfirm: (date) {
                      print('confirm $date');
                      _dateController.text='$date'.substring(0,19);
                      var _strtimes = DateTime.parse('$date' );//首先先将字符串格式的时间转为DateTime类型，因为millisecondsSinceEpoch方法转换要求为该格式
                      var _intendtime = _strtimes .millisecondsSinceEpoch;//方法一
                      print(_intendtime);
                    },
                    // 当前时间
                    currentTime: DateTime.now(),
                    // 语言
                    locale: LocaleType.zh);
                  },
                  // 校验用户名
                  validator: (v) {
                    return v
                        .trim()
                        .length > 0 ? null : "维修日期不能为空";
                  }

              ),
              TextFormField(
                  autofocus: true,
                  // controller: _unameController,
                  decoration: InputDecoration(
                      // labelText: "用户名",
                      hintText: "请输入维修费用",
                      icon: Text('维修费用',style: TextStyle(fontSize: Adapt.px(36)),)
                  ),
                  // 校验用户名
                  validator: (v) {
                    return v
                        .trim()
                        .length > 0 ? null : "维修费用不能为空";
                  }

              ),
              TextFormField(
                  autofocus: true,
                  controller: _contentController,
                  decoration: InputDecoration(
                      // labelText: "用户名",
                      hintText: "请输入维修内容",
                      icon: Text('维修内容',style: TextStyle(fontSize: Adapt.px(36)),)
                  ),
                  // 校验用户名
                  validator: (v) {
                    return v
                        .trim()
                        .length > 0 ? null : "维修内容不能为空";
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
                        child: Text("保 存"),
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