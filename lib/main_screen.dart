import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_app/tab_photos.dart';
import 'package:flutter_test_app/tab_todo.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Test app"),
          bottom: TabBar(
            controller: _tabController,
            tabs: <Widget>[
              _tabWidget('Photos'),
              _tabWidget('Tasks'),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[TabPhotos(), TabTodo()],
        ));
  }

  Widget _tabWidget(String title) {
    return Container(
      padding: EdgeInsets.all(8),
      child: Text(
        title,
        style: TextStyle(fontSize: 14),
      ),
    );
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }
}
