import 'package:flutter/material.dart';
import 'package:myapp/components/assets_repair.dart';

class assetsRepair extends StatefulWidget {
  @override
  _assetsRepairState createState() => _assetsRepairState();
}

class _assetsRepairState extends State<assetsRepair> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('资产维修'),
      ),
      body: ListView(children: [
        repairCell(
          name: '复印机',
          code: '3232dsc',
          image: 'lib/assets/images/pic.png',
        ),
        repairCell(
          code: '666666qweqw',
        )
      ],),
    );
  }
}
