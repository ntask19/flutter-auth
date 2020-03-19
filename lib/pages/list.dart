import 'package:flutter/material.dart';
import 'package:auth/pages/account.dart';

class ListPage extends StatefulWidget {
  @override
  _ListState createState() => _ListState();
}

class _ListState extends State<ListPage> with SingleTickerProviderStateMixin {
  PageController _pageController;
  int _page = 0;

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
    _pageController = new PageController();
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: const Text("キャンセル一覧"),
      ),
      bottomNavigationBar: new BottomNavigationBar(
        currentIndex: _page,
        onTap: onTapBottomNavigation,
        items: [
          new BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text("Home")
          ),
          new BottomNavigationBarItem(
            icon: new Icon(Icons.person),
            title: new Text("Setting")
          ),
        ],
      ),
      body: new PageView(
        controller: _pageController,
        onPageChanged: onPageChanged,
        children: [
          HomePage(),
          AccountPage(),
        ],
      ),

    );
  }

  void onTapBottomNavigation(int page) {
    _pageController.animateToPage(
      page,
      duration: const Duration(milliseconds: 300),
      curve: Curves.ease
    );
  }

  void onPageChanged(int page) {
    setState(() {
      this._page = page;
    });
  }

  @override
  Widget HomePage() {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) {
        return Card(
          child: Column(
            children: <Widget>[
              Image.network(imageUrl),
              Text(listItem[index], style: TextStyle(fontSize: 24.0),),
              Icon(Icons.access_time),
              Text('15:00', style: TextStyle(fontSize: 16.0),),
            ],
          ),
        );},
      itemCount: listItem.length,
    );
  }
}
