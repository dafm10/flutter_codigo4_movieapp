import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff18162E),
      body: CustomScrollView(
        // physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            backgroundColor: Color(0xff18162E),
            elevation: 0,
            expandedHeight: 200.0,
            floating: false,
            snap: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Movies"),
              background: Stack(
                fit: StackFit.expand,
                children: [
                  Image.network(
                    "https://images.pexels.com/photos/2611686/pexels-photo-2611686.jpeg",
                    fit: BoxFit.cover,
                  ),
                  DecoratedBox(
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
            delegate: SliverChildListDelegate(
              [
                Row(
                  children: [
                    Container(
                      width: 130.0,
                      height: 180.0,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "https://images.pexels.com/photos/5794243/pexels-photo-5794243.jpeg?auto=compress&cs=tinysrgb&dpr=2&w=500",
                          ),
                        ),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "2020-10-12",
                          style: TextStyle(
                            fontSize: 12.0,
                            fontWeight: FontWeight.w400,
                            color: Colors.white70,
                          ),
                        ),
                        Text(
                          "Justice League",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
