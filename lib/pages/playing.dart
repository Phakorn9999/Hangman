import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hangman/get_word.dart';
import 'package:hangman/lettersThai.dart';
import 'package:hangman/pages/setting.dart';
import 'package:hangman/drawSource/line_paint_page.dart';
import 'dart:math';

class Playing extends StatefulWidget {
  const Playing({Key? key, required this.hangman}) : super(key: key);

  final hangmanWord hangman;

  @override
  _PlayingState createState() => _PlayingState();
}

class _PlayingState extends State<Playing> {
  late int manLives;
  late String answer;
  late int wordLen;
  late String currentWord;
  late List<bool> buttonStatus;
  late Size size;
  // image use in buttons' background
  List<String> colorButton = [
    "assets/image/woodButton2_crop.jpg",
    "assets/image/green.png",
    "assets/image/red.png"
  ];
  List<int> colorButtonStatus = List.generate(44, (index) => 0);

  // to reset a new game.
  void initialize() {
    setState(() {
      manLives = 7;
      answer = widget.hangman.words[widget.hangman.random()];
      wordLen = answer.length;
      currentWord = widget.hangman.censorWord(answer);
      buttonStatus = List.generate(44, (index) => true);
      colorButtonStatus = List.generate(44, (index) => 0);
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }
  // create 1 button --> from "createButtons"
  Widget createButton(int index) {
    double buttonRound = size.width / 30;
    double buttonTextSize = size.height / 40;
    double buttonSize = (size.height + size.width) / 30;
    double padding = size.width / 78;
    String color = colorButton[colorButtonStatus[index]];
    return Padding(
      padding: EdgeInsets.all(padding),
      child: GestureDetector(
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(buttonRound)),
              image: DecorationImage(
                image: AssetImage(color),
                fit: BoxFit.cover,
              )),
          width: buttonSize,
          height: buttonSize,
          child: Center(
            child: Text(
              ThaiLetters[index],
              style: TextStyle(
                fontSize: buttonTextSize,
                fontFamily: 'Sriracha',
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        onTap: buttonStatus[index] ? () => pressedLetter(index) : null,
      ),
    );
  }
  // create buttons in the widget "wrap"
  List<Widget> createButtons() {
    List<Widget> buttons = [];
    for (int i = 0; i < ThaiLetters.length; i++) {
      buttons.add(createButton(i));
    }
    return buttons;
  }

  // check every time the button is pressed.
  // check if they win or lose
  void winLose() {
    if (currentWord == answer) {
      // Win
      _endGamePopup("YOU WIN", true);
    }
    if (manLives == 0) {
      // lose
      _endGamePopup("YOU LOSE", false);
    }
  }
  // From winLose true = win, false = lose
  void _endGamePopup(String status, bool result) {
    showModalBottomSheet(
        context: context,
        isDismissible: false,
        enableDrag: false,
        builder: (BuildContext bc) {
          return FractionallySizedBox(
            heightFactor: 0.8,
            child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                image: AssetImage("assets/image/greenBoard.png"),
                fit: BoxFit.fill,
              )),
              child: SizedBox(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Text(
                      status,
                      style: TextStyle(
                        fontSize: 40,
                        fontFamily: 'Sriracha',
                        color: result ? Colors.green : Colors.redAccent,
                      ),
                    ),
                    Text(
                      answer,
                      style: const TextStyle(
                        fontSize: 45,
                        fontFamily: 'Sriracha',
                        color: Colors.white60,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        IconButton(
                          iconSize: MediaQuery.of(context).size.height / 13,
                          onPressed: () {
                            Navigator.popUntil(
                                context, ModalRoute.withName('/'));
                          },
                          icon: const Icon(Icons.home_rounded),
                          color: Colors.white60,
                        ),
                        IconButton(
                          iconSize: MediaQuery.of(context).size.height / 10,
                          onPressed: () {
                            Navigator.pop(context);
                            initialize();
                          },
                          icon: const Icon(Icons.navigate_next_outlined),
                          color: Colors.white60,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }
  // when the letter button is pressed
  void pressedLetter(int letterIndex) {
    setState(() {
      bool correctLetter = false;
      var currentLetter = ThaiLetters[letterIndex];
      for (int i = 0; i < wordLen; i++) {
        if (currentLetter == answer[i]) {
          correctLetter = true;
          currentWord = currentWord.replaceFirst(currentWord[i], answer[i], i);
          colorButtonStatus[letterIndex] = 1; // green button
        }
      }
      if (correctLetter == false) {
        manLives -= 1;
        colorButtonStatus[letterIndex] = 2; // red button
      }

      buttonStatus[letterIndex] = false;
      winLose();
    });
  }

  @override
  Widget build(BuildContext context) {
    size = MediaQuery.of(context).size;
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Setting(onReset: initialize),
                ),
              );
            },
            icon: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            iconSize: size.height / 18,
          ),
        ],
        elevation: 0.0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage("assets/image/gamePage.png"),
          ),
        ),
        child: Column(
          children: <Widget>[
            Expanded(
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 70, 0, 10),
                      child: LayoutBuilder(
                        builder: (context, constraints) {
                          double factor =
                              min(constraints.maxHeight, constraints.maxWidth) *
                                  0.95;
                          Size paintArea = Size(factor, factor);
                          return Center(
                            child: CustomPaint(
                              size: paintArea,
                              foregroundPainter: LinePainter(state: manLives),
                            ),
                          );
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 15),
              child: Text(
                currentWord,
                style: const TextStyle(
                  fontSize: 40.0,
                  fontFamily: 'Prompt',
                  fontWeight: FontWeight.w600,
                  letterSpacing: 3.0,
                  color: Colors.white,
                ),
              ),
            ),
            Expanded(
              child: Container(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 20),
                child: Wrap(
                  alignment: WrapAlignment.center,
                  direction: Axis.horizontal,
                  children: createButtons(),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.only(bottom: size.height / 15))
          ],
        ),
      ),
    );
  }
}
