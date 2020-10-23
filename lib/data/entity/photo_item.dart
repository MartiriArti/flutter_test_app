// "albumId": 1,
// "id": 1,
// "title": "accusamus beatae ad facilis cum similique qui sunt",
// "url": "https://via.placeholder.com/600/92c952",
// "thumbnailUrl: "https://via.placeholder.com/150/92c952"

class PhotoItem {
  int albumId;
  int id;
  String title;
  String url;
  String thumbnailUrl;

  PhotoItem.fromJson(Map<String, dynamic> json)
      : albumId = json['albumId'],
        id = json['id'],
        title = json['title'],
        url = json['url'],
        thumbnailUrl = json['thumbnailUrl'];
}
