import 'package:flutter/material.dart';

class MovieDetailPage extends StatelessWidget {
  const MovieDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        // physics: BouncingScrollPhysics(),
        slivers: [
          SliverAppBar(
            elevation: 0,
            expandedHeight: 200.0,
            floating: false,
            snap: false,
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Text("Hola"),
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
