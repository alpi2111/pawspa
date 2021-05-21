import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pawspa/src/helpers/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Paw Spa',
      // home: SlideInfoPage(),
      initialRoute: "slide_info",
      routes: {
        "main": (BuildContext context) => MainPage(),
        "slide_info": (BuildContext context) => SlideInfoPage(),
        "map_view": (BuildContext context) => MapView(),
      },
      theme: ThemeData(
        // fontFamily: GoogleFonts.acme(),
        // textTheme: TextTheme(
        //   bodyText1: GoogleFonts.koHo(),
        //   bodyText2: GoogleFonts.koHo(),
        //   headline1: GoogleFonts.koHo(),
        //   headline2: GoogleFonts.koHo(),
        //   headline3: GoogleFonts.koHo(),
        //   headline4: GoogleFonts.koHo(),
        //   headline5: GoogleFonts.koHo(),
        //   headline6: GoogleFonts.koHo(),
        // ),
        textTheme: GoogleFonts.koHoTextTheme(),
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
        primaryColor: Color(0xFF524ADE),
      ),
    );
  }
}
