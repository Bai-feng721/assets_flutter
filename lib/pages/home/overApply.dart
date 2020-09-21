import 'dart:convert';
import 'package:dio/dio.dart';
// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/units/Toast.dart';
import 'package:myapp/http/api.dart';
import 'package:myapp/http/http.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class overApply extends StatefulWidget {
  Map arguments;
  overApply({Key key,this.arguments}) : super(key: key);
  @override
  _overApplyState createState() => _overApplyState(arguments:this.arguments);
}

class _overApplyState extends State<overApply> {
  var date;
  Map arguments;
  _overApplyState({this.arguments});
  //定义输入框输入内容
  TextEditingController _assetsController = new TextEditingController();
  TextEditingController _dateController = new TextEditingController();
  TextEditingController _contentController = new TextEditingController();
  GlobalKey _formKey= new GlobalKey<FormState>();
  var _selectType;

  @override
  void initState() {
    super.initState();
    //2:TextEditingController构造方法里面有个text可选参数,所以在初始的地方调用方法赋值
    _assetsController.text="${arguments['code']}";
  }
  //提交申请
  _over() async{
    // Map<String, dynamic> data={
    //   'type':_selectType,
    //   'id':'${arguments['id']}',
    //   'remarks': _contentController.text,
    // };
    // var data1 = json.encode(data);
    FormData formData = new FormData.fromMap({
      'type':_selectType,
      'id':'${arguments['id']}',
      'remarks': _contentController.text,
    });
    var response = await HttpUtil().post(Api.ASSETSOVER, data:formData);
    print(response.data);
    if(response.data['code']==200){
      Toast.toast(context,msg:response.data['msg']);
      Navigator.of(context).pop();
    }else{
      Toast.toast(context,msg:response.data['msg']);
    }
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('资产移交申请'),),
      body: Container(
        padding: EdgeInsets.all(Adapt.px(20)),
        child: Form(
          key: _formKey, //设置globalKey，用于后面获取FormState
          autovalidate: true, //开启自动校验
          child: ListView(children: [
              Container(
              height: 35,
              width: MediaQuery.of(context).size.width - 140,
              decoration: BoxDecoration(
                  border:Border(bottom:BorderSide(width: 1,color: Color(0xffe5e5e5)) )
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                Container(
                  child:Text('移交类型',style: TextStyle(fontSize: Adapt.px(36)),)
                ),
                Container(
                  width: Adapt.px(520),
                  child: new DropdownButtonHideUnderline(
                      child: new DropdownButton(
                        items: [
                          new DropdownMenuItem(
                            child: new Text('部门',style: TextStyle(fontSize: Adapt.px(32)),),
                            value: '1',
                          ),
                          new DropdownMenuItem(
                            child: new Text('仓库',style: TextStyle(fontSize: Adapt.px(32)),),
                            value: '2',
                          ),
                        ],
                        hint: new Text('请选择'),
                        onChanged: (value){
                          setState(() {
                            _selectType = value;
                          });
                        },
    //              isExpanded: true,
                        value: _selectType,
                        elevation: 24,//设置阴影的高度
                        style: new TextStyle(//设置文本框里面文字的样式
                          color: Color(0xff4a4a4a),
                          fontSize: 12,
                        ),
    //              isDense: false,//减少按钮的高度。默认情况下，此按钮的高度与其菜单项的高度相同。如果isDense为true，则按钮的高度减少约一半。 这个当按钮嵌入添加的容器中时，非常有用
                        iconSize: 40.0,
                      )
                  ))
              ],)
          ),
              
              TextFormField(
                  autofocus: true,
                  controller: _dateController,
                  decoration: InputDecoration(
                      // labelText: "用户名",
                      hintText:this.date?? "请选择移交日期",
                      icon: Text('移交日期',style: TextStyle(fontSize: Adapt.px(36)),)
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
                        .length > 0 ? null : "移交日期不能为空";
                  }

              ),
              
              TextFormField(
                  autofocus: true,
                  controller: _contentController,
                  decoration: InputDecoration(
                      // labelText: "用户名",
                      hintText: "请输入备注",
                      icon: Text('备注内容',style: TextStyle(fontSize: Adapt.px(36)),)
                  ),
                  // 校验用户名
                  validator: (v) {
                    return v
                        .trim()
                        .length > 0 ? null : "备注内容不能为空";
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
                            _over();
                          }else{
                            Toast.toast(context,msg:'请完善信息');
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