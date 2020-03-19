import 'package:flutter/material.dart';

class List extends StatelessWidget {
  static const listItem = ["食パン", "おにぎり", "弁当", "コース", "ラーメン"];

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("キャンセル一覧"),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Padding(
              child: Text(listItem[index], style: TextStyle(fontSize: 22.0),),
              padding: EdgeInsets.all(20.0),),
          );},
        itemCount: listItem.length,
      ),
    );
  }
}
