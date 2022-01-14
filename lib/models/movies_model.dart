
class MoviestModel {
  MoviestModel({
    required this.id,
    required this.title,
    required this.img,
    required this.url,
  });

  int id;
  String title;
  String img;
  String url;

  factory MoviestModel.fromJson(Map<String, dynamic> json) => MoviestModel(
    id: json["id"],
    title: json["title"],
    img: json["img"],
    url: json["url"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "img": img,
    "url": url,
  };
}
