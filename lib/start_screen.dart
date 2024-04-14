import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});
  final void Function() startQuiz;
  @override
  Widget build(context) {
    return Center(
        child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/images/quiz-logo.png',
          width: 250 ,
          color: Color.fromARGB(157, 128, 244, 186),

        ),
        const SizedBox(
          height: 80,
        ),
        const Text(
          'Learn Flutter the fun way',
          style: TextStyle(
              fontSize: 26, color: const  Color.fromARGB(255, 128, 244, 186)),
        ),
        const SizedBox(
          height: 20,
        ),
        ElevatedButton.icon(
          onPressed: () {
            startQuiz(); 
            
          },
          style: ElevatedButton.styleFrom(
              backgroundColor:const  Color.fromARGB(255, 128, 244, 186)),
          icon: const Icon(Icons.arrow_right_alt, color: Color.fromARGB(255, 9, 108, 57)),
          label: const Text(
            'Start Quiz',
            style:
                TextStyle(color: Color.fromARGB(255, 5, 77, 40), fontSize: 20),
          ),
        ),
      ],
    ));
  }
}
