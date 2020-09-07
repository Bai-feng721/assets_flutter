import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';

import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class scrapApply extends StatefulWidget {
  Map arguments;
  scrapApply({
    Key key,this.arguments
  }):super(key:key);
  @override
  _scrapApplyState createState() => _scrapApplyState(arguments:this.arguments);
}

class _scrapApplyState extends State<scrapApply> {
  var date;
  Map arguments;
  _scrapApplyState({this.arguments});


  TextEditingController _personController = new TextEditingController();
  TextEditingController _assetsController = new TextEditingController();
  TextEditingController _dateController = new TextEditingController();
  TextEditingController _contentController = new TextEditingController();
  GlobalKey _formKey= new GlobalKey<FormState>();

  @override
  void initState(){
    super.initState();
    _assetsController.text='${arguments['code']}';
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('资产报废申请'),),
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
                      hintText: "请输入申请人",
                      icon:Text('申请人员',style: TextStyle(fontSize: Adapt.px(36)),)
                  ),
                  // 校验用户名
                  validator: (v) {
                    return v
                        .trim()
                        .length > 0 ? null : "申请人不能为空";
                  }
              ),
              TextFormField(
                  autofocus: true,
                  controller: _assetsController,
                  decoration: InputDecoration(
                      // labelText: "用户名",
                      hintText: "请输入报废资产名称",
                      icon: Text('资产名称',style: TextStyle(fontSize: Adapt.px(36)),)
                  ),
                  // 校验用户名
                  validator: (v) {
                    return v
                        .trim()
                        .length > 0 ? null : "报废资产名称不能为空";
                  }

              ),
              TextFormField(
                  autofocus: true,
                  controller: _dateController,
                  decoration: InputDecoration(
                      // labelText: "用户名",
                      hintText:this.date?? "请选择报废日期",
                      icon: Text('报废日期',style: TextStyle(fontSize: Adapt.px(36)),)
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
                        .length > 0 ? null : "报废日期不能为空";
                  }

              ),
             
              TextFormField(
                  autofocus: true,
                  controller: _contentController,
                  decoration: InputDecoration(
                      // labelText: "用户名",
                      hintText: "请输入报废内容",
                      icon: Text('报废内容',style: TextStyle(fontSize: Adapt.px(36)),)
                  ),
                  // 校验用户名
                  validator: (v) {
                    return v
                        .trim()
                        .length > 0 ? null : "报废内容不能为空";
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