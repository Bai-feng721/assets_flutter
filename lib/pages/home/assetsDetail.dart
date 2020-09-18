import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/components/assets_cell.dart';
import 'package:myapp/http/api.dart';
import 'package:myapp/http/http.dart';
import 'package:myapp/units/parseTime.dart';

class asstesDetail extends StatefulWidget {
  Map arguments;
  asstesDetail({Key key ,this.arguments}):super(key:key);
  @override
  _asstesDetailState createState() => _asstesDetailState(arguments:this.arguments);
}

class _asstesDetailState extends State<asstesDetail> {
 Map arguments;
 _asstesDetailState({this.arguments});
 Map detailList={};
 String assetsCate='';
 String assetsAddress='';

 @override
 void initState() {
   super.initState();
   this._getDetail();
   this._findCate();
 }

 //获取资产详情
 _getDetail() async{
   var response = await HttpUtil().post(Api.ASSETSDetail+'?id=${arguments['id']}', token:'eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6Ijc4MGJiNjNhLTcwZGItNGE4OC1hYzkxLTEzOGRmNmJkMmI5MSJ9.yskQmXeGv0Ql9OdaxUkAfktfPMJtjK2VZxFj8UVbAqocGp4b6eQ7RcyYpEkzncjCWi6_WyUoU8XwdIVOnsCDkw');
   setState(() {
     this.detailList=response.data['data'];
     print(this.detailList);
   });
   //查询存放地点
     var res = await HttpUtil().post(Api.ASSETSADRESS+'?id=${this.detailList['storageId']}', token:'eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6Ijc4MGJiNjNhLTcwZGItNGE4OC1hYzkxLTEzOGRmNmJkMmI5MSJ9.yskQmXeGv0Ql9OdaxUkAfktfPMJtjK2VZxFj8UVbAqocGp4b6eQ7RcyYpEkzncjCWi6_WyUoU8XwdIVOnsCDkw');
     setState(() {
       this.assetsAddress=res.data['data'];
       print(this.assetsAddress);
     });
 }
 //查询资产类型
 _findCate() async{
   var response = await HttpUtil().post(Api.ASSETSCATE+'?id=${arguments['cateId']}', token:'eyJhbGciOiJIUzUxMiJ9.eyJsb2dpbl91c2VyX2tleSI6Ijc4MGJiNjNhLTcwZGItNGE4OC1hYzkxLTEzOGRmNmJkMmI5MSJ9.yskQmXeGv0Ql9OdaxUkAfktfPMJtjK2VZxFj8UVbAqocGp4b6eQ7RcyYpEkzncjCWi6_WyUoU8XwdIVOnsCDkw');
   setState(() {
     this.assetsCate=response.data['data'];
     // print(this.assetsCate);
   });
 }


  @override

  Widget build(BuildContext context) {
    return Scaffold(
     appBar: AppBar(title: Text('资产详情'),),
      body: Container(
        // padding: EdgeInsets.all(Adapt.px(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
          Column(children:[
            // assetsCell(
            //   image: Api.BASE_URL+this.detailList['avator'],
            //   name:this.detailList['name'],
            //   code: this.detailList['code'],
            //  ),
            ListTile(
                leading: Image.network(
                  Api.BASE_URL+this.detailList['avator'],
                  width: Adapt.px(150),
                  fit:BoxFit.cover ,
                ),
                title:Text(this.detailList['name'],maxLines: 1,
                  overflow: TextOverflow.ellipsis,),
                subtitle:Text(this.detailList['code'],maxLines: 1,
                  overflow: TextOverflow.ellipsis,),
                trailing:
                Container(
                  alignment: Alignment.center,
                  height: Adapt.px(50),
                  width: Adapt.px(100),
                  decoration: BoxDecoration(
                    color: Color(0xFFfd8900),
                    borderRadius: BorderRadius.all(Radius.circular(Adapt.px(30))),
                  ),
                  child: Text(arguments['status']),
                )
            ),
            Divider(),
            detailCell(name: '资产名称',subname: this.detailList['name']),
            detailCell(name: '资产编码',subname: this.detailList['code']),
            detailCell(name: '资产类型',subname: this.assetsCate),
            detailCell(name: '资产规格',subname: this.detailList['specifications']),
            detailCell(name: '采购编号',subname: this.detailList['purchaseNumber']),
            detailCell(name: '存放地点',subname: this.assetsAddress),
            detailCell(name: '购入日期',subname: parseTime(this.detailList['purchaseDate'],'yy-MM-dd')),
          ]),
          '${arguments['isshow']}'=='1'?
          Padding(
                padding: const EdgeInsets.only(bottom: 28.0,left: 20.0,right: 20.0),
                child: Row(
                  
                  children: <Widget>[
                    Expanded(
                      child: RaisedButton(
                        padding: EdgeInsets.all(10.0),
                        child: Text("采购申请"),
                        color: Theme
                            .of(context)
                            .primaryColor,
                        textColor: Colors.white,
                        onPressed: () {
                          Navigator.pushNamed(context, '/buyApply',arguments:{'id':'66'} );
                        },
                      ),
                    ),
                  ],
                ),
              ):Text('')
      ],),
      
      ),
    );
  }
}

class detailCell extends StatefulWidget {
  final String name;
  final String subname;
  const detailCell({
    Key key,
    this.name,
    this.subname,
  }):super(key:key);
  @override
  _detailCellState createState() => _detailCellState();
}

class _detailCellState extends State<detailCell> {
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(border: Border(bottom: BorderSide(width: 1,color:Colors.black12 ))),
      child: ListTile(
          leading:Text(widget.name??'资产名称'),
          trailing:Text(
            widget.subname??'笔记本电脑',
            style: TextStyle(color: Colors.black,fontSize: Adapt.px(34)
            ),
          ),
        ),
    );
  }
}