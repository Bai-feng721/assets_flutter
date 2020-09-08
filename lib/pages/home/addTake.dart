import 'package:flutter/material.dart';

class addTake extends StatefulWidget {
  @override
  _addTakeState createState() => _addTakeState();
}

class _addTakeState extends State<addTake> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('新建盘点'),),
      body:  Container(
      child: Column(children: [
        Column(children: [
          Text('fsvsv'),
          Text('fsvsv'),
          Text('fsvsv'),
          Text('fsvsv'),
        ],),
       RaisedButton(
          padding: EdgeInsets.all(10.0),
          child: Text("提 交"),
          color: Theme
              .of(context)
              .primaryColor,
          textColor: Colors.white,
          onPressed: () {
            
            })
      ],),
    ),
    );
  }
}
