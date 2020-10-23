import 'package:flutter/material.dart';
import 'package:flutter_test_app/data/entity/todo_item.dart';

class TodoItemWidget extends StatelessWidget {
  TodoItemWidget(this.item);

  final TodoItem item;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(30)),
      ),
      margin: EdgeInsets.only(left: 16, top: 8, bottom: 8, right: 16),
      child: Padding(
        padding: EdgeInsets.only(left: 16, right: 8, top: 8, bottom: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Flexible(
              child: Container(
                child: Text(
                  item.title,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: item.completed
                      ? TextStyle(
                          fontSize: 16.0,
                          color: Colors.grey,
                          decoration: TextDecoration.lineThrough)
                      : TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                        ),
                ),
              ),
            ),
            Card(
              color: item.completed ? Colors.green : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              elevation: 6,
              child: Container(
                child: Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Icon(
                      Icons.check,
                      size: 16.0,
                      color: Colors.white,
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
