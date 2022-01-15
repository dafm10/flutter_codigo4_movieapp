
import 'package:flutter_codigo4_movieapp/models/movies_model.dart';
import 'package:http/http.dart' as http;

class APIServices {

  Future<List<MovieModel>> getMovieList() async{
    String path =
        "https://api.themoviedb.org/3/discover/movie?api_key=e1b2f4eca9a8bce2bf87e5206ede8cba&language=es-ES";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);
  }

}