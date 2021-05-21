import 'package:flutter/material.dart';
import 'package:line_icons/line_icons.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          FondoGradiente(),
          Align(
            heightFactor: 1.0,
            widthFactor: 1.0,
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                SafeArea(
                  child: Text(
                    'Dashboard'.toUpperCase(),
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 40.0),
                  child: Text(
                    'Hola, bienvenido a Paw Spa. ¿Qué deseas hacer hoy?',
                    style: TextStyle(color: Colors.white, fontSize: 22.0),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Wrap(
                      runAlignment: WrapAlignment.center,
                      alignment: WrapAlignment.start,
                      verticalDirection: VerticalDirection.down,
                      direction: Axis.horizontal,
                      children: [
                        ItemMenu(
                          icon: LineIcons.folder,
                          text: 'Flower Spa',
                        ),
                        ItemMenu(
                          icon: LineIcons.font,
                          text: 'Comida',
                        ),
                        ItemMenu(
                          icon: LineIcons.forumbee,
                          text: 'Baño',
                        ),
                        ItemMenu(
                          icon: LineIcons.forumbee,
                          text: 'Baño',
                        ),
                        ItemMenu(
                          icon: LineIcons.forumbee,
                          text: 'Baño',
                        ),
                        ItemMenu(
                          icon: LineIcons.forumbee,
                          text: 'Baño',
                        ),
                        ItemMenu(
                          icon: LineIcons.forumbee,
                          text: 'Baño',
                        ),
                        ItemMenu(
                          icon: LineIcons.forumbee,
                          text: 'Baño',
                        ),
                        ItemMenu(
                          icon: LineIcons.forumbee,
                          text: 'Baño',
                        ),
                        ItemMenu(
                          icon: LineIcons.forumbee,
                          text: 'Baño',
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ItemMenu extends StatelessWidget {
  const ItemMenu({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final String text;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 150,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: Theme.of(context).primaryColor.withOpacity(0.25),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              this.icon,
              size: 48.0,
            ),
            SizedBox(height: 20.0),
            Text(
              this.text,
              style: TextStyle(fontSize: 24.0),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pushNamed('map_view');
              },
              child: Text('Ir al mapa'),
            ),
          ],
        ),
      ),
    );
  }
}

class FondoGradiente extends StatelessWidget {
  const FondoGradiente({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1.0,
      heightFactor: 0.3,
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.deepPurpleAccent,
              Colors.deepPurple,
            ],
            begin: Alignment.topRight,
            end: Alignment.bottomLeft,
          ),
        ),
      ),
    );
  }
}
