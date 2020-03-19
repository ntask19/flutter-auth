import 'package:flutter/material.dart';

class ListPage extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<ListPage> with SingleTickerProviderStateMixin {
  static const listItem = [
    "食パン", "おにぎり", "弁当",
    "フランス料理", "コンビニ", "惣菜",
    "寿司", "ピザ", "ハンバーガー",
    "コース料理", "ラーメン"];
  static const imageUrl = 'https://3.bp.blogspot.com/-n6e0pMzlroI/V8jqW9FPKII/AAAAAAAA9dg/qoi6jgSPbSgaJbsyWSNKm-74HQeVGBtcACLcB/s100/bread_syokupan.png';

  TabController _tabController;

  final List<Tab> tabs = <Tab>[
    Tab(
      icon: Icon(Icons.home),
    ),
    Tab(
      icon: Icon(Icons.my_location),
    ),
    Tab(
      icon: Icon(Icons.person),
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("キャンセル一覧"),
      ),
      bottomNavigationBar: SafeArea(
        child: TabBar(
          tabs: tabs,
          controller: _tabController,
          indicator: UnderlineTabIndicator(
            borderSide: BorderSide(color: Colors.green, width: 5),
            insets: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 40),
          ),
          unselectedLabelColor: Colors.grey,
          indicatorColor: Colors.green,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorWeight: 2,
          indicatorPadding:
          EdgeInsets.symmetric(horizontal: 18.0, vertical: 8),
          labelColor: Colors.black,
        ),
      ),
      body: ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return Card(
            child: Column(
              children: <Widget>[
                Image.network(imageUrl),
                Text(listItem[index], style: TextStyle(fontSize: 24.0),),
                Icon(Icons.access_time),
                Text('15:00', style: TextStyle(fontSize: 16.0),),
//                Row(
//                )
              ],
            ),
          );},
        itemCount: listItem.length,
      ),
    );
  }

  @override
  Widget _createTab(Tab tab) {
    return Center(
      child: Text(
        "Tab",
        style: TextStyle(fontSize: 24.0),
      ),
    );
  }
}
