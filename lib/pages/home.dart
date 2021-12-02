import 'package:flutter/material.dart';
import 'package:hangman/get_word.dart';
import 'package:hangman/pages/playing.dart';

class Home extends StatefulWidget {
  final hangmanWord Hangman = hangmanWord();

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    widget.Hangman.getWords();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/image/homePage_crop.jpg"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.fromLTRB(120, size.height * 0.8, 1200, 0),
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Playing(hangman: widget.Hangman),
                      ),
                    );
                  },
                  child: Container(
                    child: Center(
                      child: Text(
                        "PLAY",
                        style: TextStyle(
                          fontSize: size.width / 12,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Sriracha',
                        ),
                      ),
                    ),
                    height: size.height / 10,
                    width: size.width / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        image: const DecorationImage(
                          image: AssetImage("assets/image/woodButton.png"),
                          fit: BoxFit.fill,
                        )),
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
