import 'package:flutter/material.dart';
import 'package:pawspa/src/helpers/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paw Spa',
      home: SlideInfoPage(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          brightness: Brightness.dark
        ),
        primarySwatch: MaterialColor(
          0xFF524ADE,
          {
            50: Color(0xffeae9fb),
            100: Color(0xffcbc9f5),
            200: Color(0xffa9a5ef),
            300: Color(0xff8680e8),
            400: Color(0xff6c65e3),
            500: Color(0xff673ab7), // accent - primary color
            600: Color(0xff4b43da),
            700: Color(0xff413ad5),
            800: Color(0xff3832d1),
            900: Color(0xff2822c8),
          },
        ),
      ),
    );
  }
}
