import 'package:flutter/material.dart';
import 'package:flutter_codigo4_movieapp/models/person_model.dart';
import 'package:flutter_codigo4_movieapp/services/api_services.dart';
import 'package:google_fonts/google_fonts.dart';

class PersonDetailPage extends StatelessWidget {
  int id;
  final APIServices _apiServices = APIServices();

  PersonDetailPage({required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff18162E),
      body: FutureBuilder(
        future: _apiServices.getPerson(id),
        builder: (BuildContext conext, AsyncSnapshot snap){
          if(snap.hasData){
            PersonModel person = snap.data;
            return CustomScrollView(
              slivers: [
                SliverAppBar(
                  backgroundColor: Color(0xff18162E),
                  elevation: 0,
                  expandedHeight: 200.0,
                  floating: false,
                  snap: false,
                  pinned: true,
                  flexibleSpace: FlexibleSpaceBar(
                    title: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: Text(
                        person.name,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.montserrat(
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    background: Stack(
                      fit: StackFit.expand,
                      children: [
                        Image.network(
                          "https://image.tmdb.org/t/p/w500${person.profilePath}",
                          fit: BoxFit.cover,
                        ),
                        const DecoratedBox(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.center,
                              end: Alignment.bottomCenter,
                              colors: [
                                Color(0x0018162E),
                                Color(0xff18162E),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    centerTitle: true,
                  ),
                ),
                SliverList(
                  delegate: SliverChildListDelegate([
                    Padding(
                      padding: const EdgeInsets.all(28.0),
                      child: Column(
                        children: [

                          const SizedBox(height: 10.0),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: const Text(
                                  "Lugar de nacimiento: ",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  person.placeOfBirth,
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: const Text(
                                  "Fecha de nacimiento: ",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              Text(
                                "${person.birthday.day.toString().padLeft(2,"0")}-${person.birthday.month.toString().padLeft(2,"0")}-${person.birthday.year.toString().padLeft(4,"0")}",
                                style: const TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: const  Text(
                                  "Biografía: ",
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  person.biography,
                                  style: const TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 10.0),
                          Row(
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width * 0.25,
                                child: const Text(
                                  "Popularidad: ",
                                  style: TextStyle(
                                    fontSize: 15.0,
                                  ),
                                ),
                              ),
                              Text(
                                person.popularity.toString(),
                                style: const TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ]),
                ),
              ],
            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
