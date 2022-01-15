import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_codigo4_movieapp/models/movies_model.dart';
import 'package:flutter_codigo4_movieapp/pages/movie_detail_page.dart';
import 'package:flutter_codigo4_movieapp/services/api_services.dart';
import 'package:flutter_codigo4_movieapp/ui/widgets/item_movie_list_widget.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List movies = [];
  List<MovieModel> moviesFinal = [];
  final APIServices _apiServices = APIServices();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //getData();
  }

  /*getData() async {
    String path =
        "$pathProduction/discover/movie?api_key=$apiKEY";
    Uri _uri = Uri.parse(path);
    http.Response response = await http.get(_uri);

    if (response.statusCode == 200) {
      // decodificamos el String a Mapa por que el servicio es un Mapa
      Map<String, dynamic> myMap = json.decode(response.body);
      moviesFinal = myMap["results"]
          .map<MovieModel>((item) => MovieModel.fromJson(item))
          .toList();
      setState(() {});
      // 1er enlace base: http://image.tmdb.org/t/p/w500/
      // print(myMap.runtimeType);
    } else {
      print("pasó algo");
    }

  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xff18162E),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 20.0,
                ),
                const Text(
                  "Movies",
                  style: TextStyle(
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                FutureBuilder(
                  future: _apiServices.getMovieList(),
                  builder: (BuildContext context, AsyncSnapshot snap) {
                    if (snap.hasData) {
                      List<MovieModel> listMovie = snap.data;
                      return ListView.builder(
                        itemCount: listMovie.length,
                        shrinkWrap: true,
                        physics: const BouncingScrollPhysics(),
                        itemBuilder: (BuildContext context, int index) {
                          return ItemMovieListWidget(
                            title: listMovie[index].title,
                            releaseDate: listMovie[index].releaseDate,
                            voteAverage: listMovie[index].voteAverage.toString(),
                            overview: listMovie[index].overview,
                            img: listMovie[index].img,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetailPage(),
                                ),
                              );
                            },
                          );
                        },
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ),
                /* ListView.builder(
                  itemCount: moviesFinal.length,
                  physics: BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return ItemMovieListWidget(
                      title: moviesFinal[index].title,
                      releaseDate: moviesFinal[index].releaseDate,
                      voteAverage: moviesFinal[index].voteAverage.toString(),
                      overview: moviesFinal[index].overview,
                      img: moviesFinal[index].img,
                    );
                  },
                ),*/
              ],
            ),
          ),
        ),
      ),
    );
  }
}
