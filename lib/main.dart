import 'package:flutter/material.dart';
import 'package:recipes/screens/loginscrenns.dart';
import 'package:recipes/widgets/green_button.dart';
import 'package:page_transition/page_transition.dart';

void main() {
  runApp(const MyHomePage());
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BodyWidget(),
    );
  }
}

class BodyWidget extends StatefulWidget {
  const BodyWidget({super.key});

  @override
  State<BodyWidget> createState() => _BodyWidgetState();
}

class _BodyWidgetState extends State<BodyWidget> {
  final double coverHeifht = 756;
  final double colorHeight = 438;
  //double scrennWidth = MediaQuery.of(context).size.width;
  //double scrennHeight = MediaQuery.of(context).size.width;
  @override
  Widget build(BuildContext context) {
    final double tops = colorHeight;
    return Scaffold(
        body: Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        buildCoverImage(),
        Positioned(
          child: buildStart(),
          top: tops,
        ),
        Positioned(
          bottom: -20,
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                PageTransition(
                  type: PageTransitionType.leftToRight,
                  child: loginScreens(),
                ),
              );
            },
            child: const GreenButton(
              width: 280,
              height: 60,
              text: "Start coocking",
            ),
          ),
        )
      ],
    ));
  }

  Widget buildCoverImage() => Container(
        //padding: EdgeInsets.only(top: 0),
        color: Colors.grey,
        child: SizedBox(
          child: Image.asset(
            "assets/recette.jpg",
            width: double.infinity,
            height: 540,
            //height = 540

            fit: BoxFit.cover,
          ),
        ),
      );

  Widget buildStart() => Stack(
        children: [
          CircleAvatar(
            radius: colorHeight,
            backgroundColor: const Color.fromRGBO(237, 241, 214, 3),
            child: const Padding(
              padding: EdgeInsets.all(130.0),
              child: Column(
                children: [
                  Text(
                    "Enjoy",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'PT_Serif',
                        fontSize: 48),
                  ),
                  Text(
                    "Cooking",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'PT_Serif',
                        fontWeight: FontWeight.bold,
                        fontSize: 64),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "Find the best recipes",
                    style: TextStyle(
                      fontFamily: 'PT_Serif',
                      color: Colors.grey,
                      fontSize: 15,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      );
}
