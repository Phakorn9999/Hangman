import 'dart:core';
import 'dart:async';
import 'dart:math';
import 'package:flutter/services.dart' show rootBundle;

class hangmanWord {

  List<String> words= [];
  // get the words from text file and store in the list
  Future getWords() async {
    String fileText = await rootBundle.loadString('assets/words.txt');
    words = fileText.split('\n');
  }
  // Random a number between 0 - words.lenth
  int random() {
    Random random = Random();
    return random.nextInt(words.length);
  }


// chang the Thai alphabetical char to "_"
  String censorWord(String oldWord) {
    String newWord = oldWord.replaceAllMapped(
        RegExp(r'[กขฃคฅฆงจฉชซฌญฎฏฐฑฒณดตถทนบปผฝพฟภมยรลวศษสหฬอฮ]'), (i) {
      return '_';
    });
    return newWord;
  }
}


