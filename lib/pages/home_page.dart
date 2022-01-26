import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_codigo4_movieapp/models/movies_model.dart';
import 'package:flutter_codigo4_movieapp/pages/movie_detail_page.dart';
import 'package:flutter_codigo4_movieapp/services/api_services.dart';
import 'package:flutter_codigo4_movieapp/ui/widgets/item_filter_widget.dart';
import 'package:flutter_codigo4_movieapp/ui/widgets/item_movie_list_widget.dart';
import 'package:flutter_codigo4_movieapp/utils/constants.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List movies = [];
  List<MovieModel> moviesFinal = [];
  int indexFilter = -1;
  int genreMovie = 0;
  final APIServices _apiServices = APIServices();
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController.addListener(() {
      //print(_scrollController.position.pixels);
      //print("dsdadadsfdsfd ${_scrollController.position.maxScrollExtent}");

      if (page >= 1) {
        if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent) {
          page++;
          print(">= 1 $page");
          setState(() {});
        } else if (page > 1) {
          if (_scrollController.position.pixels ==
              _scrollController.position.minScrollExtent) {
            page--;
            print("> 1 $page");
            setState(() {});
          }
        }
      }
    });
    //getData();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _scrollController.dispose();
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
          controller: _scrollController,
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
                SingleChildScrollView(
                  physics: BouncingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  child: Row(
                      children: [
                        ItemFilterWidget(
                          nameFilter: "Family",
                          selected: indexFilter == 0 ? true : false,
                          onPressed: (){
                            indexFilter = 0;
                            genreMovie = 10751;
                            setState(() {

                            });
                          },
                        ),
                        ItemFilterWidget(
                          nameFilter: "Adventure",
                          selected: indexFilter == 1 ? true : false,
                          onPressed: (){
                            indexFilter = 1;
                            genreMovie = 12;
                            setState(() {

                            });
                          },
                        ),
                        ItemFilterWidget(
                          nameFilter: "Animation",
                          selected: indexFilter == 2 ? true : false,
                          onPressed: (){
                            indexFilter = 2;
                            genreMovie = 16;
                            setState(() {

                            });
                          },
                        ),
                        ItemFilterWidget(
                          nameFilter: "Horror",
                          selected: indexFilter == 3 ? true : false,
                          onPressed: (){
                            indexFilter = 3;
                            genreMovie = 27;
                            setState(() {

                            });
                          },
                        ),
                        ItemFilterWidget(
                          nameFilter: "Fantasy",
                          selected: indexFilter == 4 ? true : false,
                          onPressed: (){
                            indexFilter = 4;
                            genreMovie = 14;
                            setState(() {

                            });
                          },
                        ),
                        ItemFilterWidget(
                          nameFilter: "History",
                          selected: indexFilter == 5 ? true : false,
                          onPressed: (){
                            indexFilter = 5;
                            genreMovie = 36;
                            setState(() {

                            });
                          },
                        ),
                        ItemFilterWidget(
                          nameFilter: "Drama",
                          selected: indexFilter == 6 ? true : false,
                          onPressed: (){
                            indexFilter = 6;
                            genreMovie = 18;
                            setState(() {

                            });
                          },
                        ),
                        ItemFilterWidget(
                          nameFilter: "Thriller",
                          selected: indexFilter == 7 ? true : false,
                          onPressed: (){
                            indexFilter = 7;
                            genreMovie = 53;
                            setState(() {

                            });
                          },
                        ),
                        ItemFilterWidget(
                          nameFilter: "Romance",
                          selected: indexFilter == 8 ? true : false,
                          onPressed: (){
                            indexFilter = 8;
                            genreMovie = 10749;
                            setState(() {

                            });
                          },
                        ),
                      ],
                  ),
                ),
                indexFilter >= 0 ? FutureBuilder(
                  future: _apiServices.getMovieGenre(genreMovie),
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
                            voteAverage:
                            listMovie[index].voteAverage.toString(),
                            overview: listMovie[index].overview,
                            img: listMovie[index].img,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetailPage(
                                    id: listMovie[index].id,
                                  ),
                                ),
                              );
                            },
                          );
                        },
                      );
                    }
                    return const CircularProgressIndicator();
                  },
                ) : FutureBuilder(
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
                            voteAverage:
                            listMovie[index].voteAverage.toString(),
                            overview: listMovie[index].overview,
                            img: listMovie[index].img,
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => MovieDetailPage(
                                    id: listMovie[index].id,
                                  ),
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
