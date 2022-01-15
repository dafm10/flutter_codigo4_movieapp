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
                Container(
                  color: Colors.redAccent,
                  height: 200.0,
                ),
                Container(
                  color: Colors.yellowAccent,
                  height: 200.0,
                ),
                Container(
                  color: Colors.blueAccent,
                  height: 200.0,
                ),
                Container(
                  color: Colors.redAccent,
                  height: 200.0,
                ),
                Container(
                  color: Colors.yellowAccent,
                  height: 200.0,
                ),
                Container(
                  color: Colors.blueAccent,
                  height: 200.0,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
