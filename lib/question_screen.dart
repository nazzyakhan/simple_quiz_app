import 'package:flutter/material.dart';
import 'package:simple_quiz_app/answer.dart';
import 'package:simple_quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionScreen extends StatefulWidget {


  const QuestionScreen({super.key, required this.onSelectedAnswer});

  final void Function(String answer) onSelectedAnswer;
  @override
  State<QuestionScreen> createState() {
    return _QuestionScreenState();
  }
}

class _QuestionScreenState extends State<QuestionScreen> {
 var currentQuestionIndex = 0;

 void nextQuestion(String selectedAnswer) {
  widget.onSelectedAnswer(selectedAnswer);
  setState(() {
    //currentQuestionIndex = currentQuestionIndex + 1;
    //currentQuestion +=1;
    currentQuestionIndex++;
  });
 }
 @override
  Widget build(context) {
  final currentQuestion = questions[currentQuestionIndex];
  
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: const Color.fromARGB(255, 128, 244, 186),
                
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30
            ),
            ...currentQuestion.getshuffledAnswers().map((answer) {
              return AnswerButton(onTap: (){
                nextQuestion(answer);
              },answerText: answer);
            }),
             
          ],
        ),
      ),
    );
  }
}
