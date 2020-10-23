import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_test_app/data/api.dart';
import 'package:flutter_test_app/data/entity/photo_item.dart';
import 'package:flutter_test_app/utils/views_states.dart';
import 'package:flutter_test_app/widgets/photo_item_widget.dart';

class TabPhotos extends StatefulWidget {
  @override
  _TabPhotosState createState() => _TabPhotosState();
}

class _TabPhotosState extends State<TabPhotos>
    with AutomaticKeepAliveClientMixin {
  ViewStates state = ViewStates.loading;
  List<PhotoItem> photos;

  @override
  void initState() {
    super.initState();
    _loadPhotos();
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
              itemCount: photos.length,
              itemBuilder: (BuildContext context, int index) {
                return PhotoItemWidget(photos[index]);
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

  _loadPhotos() async {
    List<PhotoItem> list = await Api().getPhotos();
    if (list != null && list.length > 0) {
      photos = list;
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
