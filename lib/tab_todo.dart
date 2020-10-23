import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_app/data/api.dart';
import 'package:flutter_test_app/data/entity/todo_item.dart';
import 'package:flutter_test_app/utils/views_states.dart';
import 'package:flutter_test_app/widgets/todo_item_widget.dart';

class TabTodo extends StatefulWidget {
  @override
  _TabTodoState createState() => _TabTodoState();
}

class _TabTodoState extends State<TabTodo> with AutomaticKeepAliveClientMixin {
  ViewStates state = ViewStates.loading;
  List<TodoItem> todos;

  @override
  void initState() {
    super.initState();
    _loadTodos();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _getBodyForState(),
    );
  }

  Widget _getBodyForState() {
    switch (state) {
      case ViewStates.loading:
        {
          return Center(
            child: CircularProgressIndicator(
              valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
            ),
          );
        }
      case ViewStates.hasData:
        {
          return ListView.builder(
              itemCount: todos.length,
              itemBuilder: (BuildContext context, int index) {
                return TodoItemWidget(todos[index]);
              });
        }
      case ViewStates.noData:
        {
          return Center(
            child: Text("No data"),
          );
        }
    }
  }

  _loadTodos() async {
    List<TodoItem> list = await Api().getTodos();
    if (list != null && list.length > 0) {
      todos = list;
      _changeState(ViewStates.hasData);
    } else {
      _changeState(ViewStates.noData);
    }
  }

  _changeState(ViewStates s) {
    setState(() {
      state = s;
    });
  }

  @override
  bool get wantKeepAlive => true;
}
