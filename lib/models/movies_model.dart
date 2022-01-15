
class MovieModel {

  int id;
  String title;
  String releaseDate;
  double voteAverage;
  String overview;
  String img;

  MovieModel({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.voteAverage,
    required this.overview,
    required this.img,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    id: json["id"],
    title: json["original_title"],
    releaseDate: json["release_date"],
    voteAverage: json["vote_average"].toDouble(),
    overview: json["overview"],
    img: json["poster_path"],
  );

  Map<String, dynamic> toJson() => {
    "id" : id,
    "original_title": title,
    "release_date": releaseDate,
    "vote_average": voteAverage,
    "overview": overview,
    "poster_path": img,
  };
}
