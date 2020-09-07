import 'package:flutter/material.dart';
import 'package:myapp/components/assets_scrap.dart';

class assetsScrap extends StatefulWidget {
  @override
  _assetsScrapState createState() => _assetsScrapState();
}

class _assetsScrapState extends State<assetsScrap> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('资产报废'),
      ),
      body: ListView(children: [
        scrapCell(
          name: '单反相机',
          code: 'nikon5400',
          image: 'lib/assets/images/pic.png',
        ),
        
      ],),
    );
  }
}
