class MovieModel {

  int id;
  String title;
  String releaseDate;
  double voteAverage;
  String overview;
  String img;
  String backdropPath;
  int runtime;
  String status;
  String homePage;
  List<Map<String, dynamic>> genres;

  MovieModel({
    required this.id,
    required this.title,
    required this.releaseDate,
    required this.voteAverage,
    required this.overview,
    required this.img,
    required this.backdropPath,
    required this.runtime,
    required this.status,
    required this.homePage,
    required this.genres
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
    id: json["id"],
    title: json["original_title"],
    releaseDate: json["release_date"],
    voteAverage: json["vote_average"].toDouble(),
    runtime: json["runtime"] != null ? json["runtime"].toInt() : 0,
    overview: json["overview"],
    img: json["poster_path"],
    backdropPath: json["backdrop_path"],
    status: json["status"] ?? "",
    homePage: json["homepage"] ?? "",
    genres: json["genres"] != null ? List<Map<String, dynamic>>.from(json["genres"].map((item)=>item)) : [],
  );

  Map<String, dynamic> toJson() => {
    "id" : id,
    "original_title": title,
    "release_date": releaseDate,
    "vote_average": voteAverage,
    "runtime": runtime,
    "overview": overview,
    "poster_path": img,
    "backdrop_path": backdropPath,
    "status": status,
    "homepage": homePage,
    "genres": List<dynamic>.from(genres.map((e) => e)),
  };
}
