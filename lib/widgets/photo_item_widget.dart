import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test_app/data/entity/photo_item.dart';

class PhotoItemWidget extends StatelessWidget {
  PhotoItemWidget(this.item);

  final PhotoItem item;

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
          mainAxisSize: MainAxisSize.max,
          children: [
            CachedNetworkImage(
              imageUrl: item.url,
              imageBuilder: (context, imageProvider) => CircleAvatar(
                backgroundImage: imageProvider,
              ),
              placeholder: (context, url) => CircularProgressIndicator(),
              errorWidget: (context, url, error) => Icon(Icons.error_outline),
            ),
            Padding(padding: EdgeInsets.only(right: 8)),
            Flexible(
              child: Container(
                child: Text(
                  item.title,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
