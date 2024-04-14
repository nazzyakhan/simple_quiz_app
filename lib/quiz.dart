import 'package:flutter/material.dart';
import 'package:simple_quiz_app/start_screen.dart';
import 'package:simple_quiz_app/question_screen.dart';
import 'package:simple_quiz_app/data/questions.dart';
import 'package:simple_quiz_app/result_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});
  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
   List<String> selectedAnswers = [];
  var activeScreen = 'start-screen';

  void changeScreen() {


    setState(
      () {
        activeScreen = 'question-screen';
      },
    );
  }
  void chooseAnswer(String answer){
    selectedAnswers.add(answer); 
    if (selectedAnswers.length == questions.length){
      
      setState(() {
        activeScreen = 'result-screen';
      });
      
    }  
  }

  void restartQuiz(){
    setState(() {
      activeScreen = 'start-screen';
      selectedAnswers = [];

    });
  }

  @override
  Widget build(context) {
    Widget screenWidget = StartScreen(changeScreen);
    if (activeScreen == 'question-screen') {
      screenWidget =  QuestionScreen(onSelectedAnswer: chooseAnswer,);
    }
    if (activeScreen == 'result-screen') {
      screenWidget = ResultScreen(chosenAnswers: selectedAnswers, onRestart: restartQuiz,);
    }
    return MaterialApp(
      home: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(colors: [
              Color.fromARGB(255, 14, 53, 34),
              Color.fromARGB(255, 11, 53, 34),
            ], begin: Alignment.topLeft, end: Alignment.bottomRight)),
            child: screenWidget),
      ),
    );
  }
}
