import 'dart:convert';

import 'package:flutter_codigo4_movieapp/models/actor_model.dart';
import 'package:flutter_codigo4_movieapp/models/movies_model.dart';
import 'package:flutter_codigo4_movieapp/utils/constants.dart';
import 'package:http/http.dart' as http;

class APIServices {
  Future<List<MovieModel>> getMovieList() async {
    List<MovieModel> movies = [];
    String path = "$pathProduction/discover/movie?api_key=$apiKEY&page=$page";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);

    if (response.statusCode == 200) {
      // decodificamos el String a Mapa por que el servicio es un Mapa
      Map<String, dynamic> myMap = json.decode(response.body);
      movies = myMap["results"]
          .map<MovieModel>((item) => MovieModel.fromJson(item))
          .toList();
      return movies;
      // 1er enlace base: http://image.tmdb.org/t/p/w500/
    }
    return movies;
  }

  Future<List<ActorModel>> getCastList(int id) async {
    List<ActorModel> cast = [];
    String path = "$pathProduction/movie/$id/credits?api_key=$apiKEY";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
    if(response.statusCode == 200){
      Map<String, dynamic> myMap = json.decode(response.body);
      cast = myMap["cast"] != null ? myMap["cast"].map<ActorModel>((item)=>ActorModel.fromJson(item)).toList() : [];
      return cast;
    }
    return cast;
  }

  Future<MovieModel> getMovie(int id) async {
    String path = "$pathProduction/movie/$id?api_key=$apiKEY";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
    if (response.statusCode == 200) {
      // esta información es un Map es un json simplemente
      Map<String, dynamic> myMap = json.decode(response.body);
      MovieModel movie = MovieModel.fromJson(myMap);
      return movie;
    }
    return MovieModel(
      id: 0,
      title: "",
      releaseDate: "",
      voteAverage: 0,
      runtime: 0,
      overview: "",
      img: "",
      backdropPath: "",
      status: "",
      homePage: "",
      genres: [],
    );
  }
}
