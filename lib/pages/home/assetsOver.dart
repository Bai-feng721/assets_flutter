import 'package:flutter/material.dart';
import 'package:myapp/components/assets_over.dart';

class assetsOver extends StatefulWidget {
  @override
  _assetsOverState createState() => _assetsOverState();
}

class _assetsOverState extends State<assetsOver> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('资产移交'),
      ),
      body: ListView(children: [
        overCell(
          name: '台式机',
          code: '999888WE',
          image: 'lib/assets/images/pic.png',
        ),
        overCell(
          name: 'cas',
          code: 'sdfdsf11211',
        )
      ],),
    );
  }
}
