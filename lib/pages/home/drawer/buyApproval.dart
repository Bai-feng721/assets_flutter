import 'package:flutter/material.dart';
import 'package:myapp/units/Adapt.dart';
import 'package:myapp/components/approval_cell.dart';

class buyApproval extends StatefulWidget {
  @override
  _buyApprovalState createState() => _buyApprovalState();
}

class _buyApprovalState extends State<buyApproval> {
  @override
  Widget build(BuildContext context) {
    return new DefaultTabController(
      length: 2,
      child: new Scaffold(
        appBar: new AppBar(
          title: new Text('采购审批'),
          bottom: new TabBar(
            tabs: <Widget>[
              new Tab(child: Text('待审批'),),
              new Tab(child: Text('已审批'),),
            ],
            // controller: _tabController,
          ),
        ),
        body: new TabBarView(
          children: <Widget>[
            new Center(child: ListView(children: [
              approvalCell(
                name: '华为mate',
                code: 'huawei202',
                count: '66',
                time: '2022-12-12',
              ),
              approvalCell(),
            ],)),

            new Center(child: ListView(children: [
              approvalCell(),
              approvalCell(),
              approvalCell(),
            ],)),
          ],
        ),
      ),
    );
  }
}

