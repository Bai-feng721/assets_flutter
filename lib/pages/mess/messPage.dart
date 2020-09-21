import 'package:flutter/material.dart';
import 'package:myapp/components/mess_cell.dart';
import 'package:myapp/http/api.dart';
import 'package:myapp/http/http.dart';
import 'package:myapp/units/parseTime.dart';

class MessPage extends StatefulWidget {
  @override
  _MessPageState createState() => _MessPageState();
}

class _MessPageState extends State<MessPage> {
  List messList=[];
  @override
  void initState(){
    super.initState();
    this._getList();
  }
  _getList() async{
    var response = await HttpUtil().get(Api.MESS);

    setState(() {
      this.messList=response.data["rows"];
      // print(this.messList);
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('我的消息'),
        ),
        body: Container(
            child:
                ListView(
                  padding: EdgeInsets.fromLTRB(0, 10, 0, 10),
                  children: this.messList.map((item){
                    return messCell(
                      text:item['targetTitle'],
                      subtitle: item['content'],
                      time:Text(parseTime(item['creationTime'], 'yy-MM-dd')),
                      id: item['id'],
                      isread: item['status'],
                    );
                  }).toList(),
                )
        )
    );
  }
}
