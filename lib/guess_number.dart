// ignore_for_file: avoid_print

import 'dart:io';
import 'dart:math';

import 'package:guess_number_hw5/game.dart';

void main() {


  while(true){
    stdout.write('Enter a maximum number to random: ');
    var randomToUser  = int.tryParse(stdin.readLineSync()!);
    if(randomToUser == null){
      continue;
    }
    var game = Game(maxRandom:randomToUser);
    print('▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼▼');
    print('            GUESS THE NUMBER            ');
    print('▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲▲');
    var guessCount = 0;
    var isCorrect = false;
    do {
      stdout.write(' Guess the number between 1 and ${game.maxRandom}: ');
      var input = stdin.readLineSync();
      var guess = int.tryParse(input!);

      if (guess == null) {
        continue;
      }
      guessCount++;
      if (game.doGuess(guess) == 1) {
        print('$guess is TOO HIGH! ');
        print('➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜');
      } else if (game.doGuess(guess) == -1) {
        print('$guess is TOO LOW! ');
        print('➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜');
      } else {
        print('$guess is CORRECT ❤️, total guesses: $guessCount');
        print('➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜➜');
        isCorrect = true;
        Game.myList.add(guessCount);
      }
    } while (!isCorrect);

    print('                THE END                ');
    print('❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤❤');

    var use = "";
    while(true){
      stdout.write('play again? (Y/N): ');
      use = stdin.readLineSync()!;
      if(use.toUpperCase()=='Y'){
        break;
      }
      else if(use.toUpperCase()=='N'){
        print("\n\nYou've played ${Game.myList.length} games");
        for(int i=0; i<Game.myList.length; i++){
          print('🚀 Game #${i+1}: ${Game.myList[i]} guesses');
        }
        exit (0);
      }
    }
    print('');
  }
}