import 'package:flutter/material.dart';
import 'package:flutter_codigo4_movieapp/pages/home_page.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme().apply(
          bodyColor: Colors.white,
        ),
      ),
      title: "MovieApp",
      home: HomePage(),
    );
  }
}
