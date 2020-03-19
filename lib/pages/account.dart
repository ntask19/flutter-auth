import 'package:flutter/material.dart';

class AccountPage extends StatefulWidget {
  @override
  _AccountPageState createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  var accountList = ["プロフィール", "住所", "カード情報"];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Padding(
            child: Text(accountList[index], style: TextStyle(fontSize: 22.0),),
            padding: EdgeInsets.all(20.0),),
        );},
      itemCount: accountList.length,
    );
  }

}
