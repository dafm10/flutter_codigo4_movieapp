import 'package:flutter/material.dart';

class ItemMovieListWidget extends StatelessWidget {
  String title;
  String releaseDate;
  String voteAverage;
  String overview;
  String img;
  Function onTap;
  //int genre;

  ItemMovieListWidget({
    required this.title,
    required this.releaseDate,
    required this.voteAverage,
    required this.overview,
    required this.img,
    required this.onTap,
   //required this.genre,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        onTap();
      },
      child: Container(
        height: 420,
        margin: const EdgeInsets.symmetric(vertical: 16.0),
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24.0),
          image: DecorationImage(
            fit: BoxFit.cover,
            image: NetworkImage(
              "http://image.tmdb.org/t/p/w500$img",
            ),
          ),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.0),
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment(0, 0.2),
                  colors: [
                    Color(0xff18162E),
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                margin:
                    const EdgeInsets.symmetric(vertical: 16.0, horizontal: 10.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            title,
                            style: const TextStyle(
                              fontSize: 22.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  const Icon(
                                    Icons.calendar_today,
                                    color: Colors.white,
                                    size: 14.0,
                                  ),
                                  const SizedBox(
                                    width: 6.0,
                                  ),
                                  Text(
                                    releaseDate,
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.star,
                                    color: Colors.yellow,
                                    size: 14.0,
                                  ),
                                  const SizedBox(
                                    width: 6.0,
                                  ),
                                  Text(
                                    voteAverage,
                                    style: const TextStyle(
                                      fontSize: 12.0,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 3.0,
                          ),
                          Text(
                            overview,
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              fontSize: 13.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
