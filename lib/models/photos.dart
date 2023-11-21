import 'dart:convert';

class Photos {
  int? albumId;
  int? id;
  String? title;
  String? url;
  String? thumbnailUrl;

  Photos({this.albumId, this.id, this.title, this.url, this.thumbnailUrl});

  factory Photos.fromJson(Map<String, dynamic> json) {
    return Photos(
        albumId: json["albumId"],
        id: json["id"],
        title: json["title"],
        url: json["url"],
        thumbnailUrl: json["thumbnailUrl"]);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['albumId'] = this.albumId;
    data['id'] = this.id;
    data['title'] = this.title;
    data['url'] = this.url;
    data['thumbnailUrl'] = this.thumbnailUrl;
    return data;
  }

  @override
  String toString() {
    return 'Photos{albumId: $albumId, id: $id, title: $title, url: $url, thumbnailUrl: $thumbnailUrl}';
  }
}

List<Photos> photosFromJson(String jsonData) {
  final data = json.decode(jsonData);
  return List<Photos>.from(data.map((item) => Photos.fromJson(item)));
}

String photosToJson(Photos data) {
  final jsonData = data.toJson();
  return json.encode(jsonData);
}
