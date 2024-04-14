import 'package:flutter/material.dart';
import 'package:simple_quiz_app/data/questions.dart';
import 'package:simple_quiz_app/data/question_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key, required this.chosenAnswers, required this.onRestart});
  final List<String> chosenAnswers;
  final void Function() onRestart;
  List< Map<String, Object> > getSummaryData(){
    final List< Map<String, Object> > summary = [];
    for (int i = 0; i < chosenAnswers.length; i++){
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'current answer': chosenAnswers[i],
        'answer': questions[i].answers[0],
      });  
    }
    return summary;
  }
  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final totalQuestions = questions.length;
    final correctQuestions = summaryData.where((data) {
      return data['current answer'] == data['answer'];
      
    }).length;
    return SizedBox(
        width: double.infinity,
        child: Container(
            margin: const EdgeInsets.all(40),
            child:   Column(
                mainAxisAlignment: MainAxisAlignment.center,
                
                children: [
                  Text('You answered $correctQuestions out of $totalQuestions questions currectly',
                  style: GoogleFonts.lato(
                    color: const Color.fromARGB(255, 128, 244, 186),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                  ),
                  
                  SizedBox(
                    height: 30,
                  ),
                  
                    QuestionSummary(summaryData),
                    const SizedBox(
                      height: 30,
                    ) 
                    
                    
                    ,
                    TextButton.icon(
                      onPressed: onRestart,
                      style: TextButton.styleFrom(
                        foregroundColor: const Color.fromARGB(255, 128, 244, 186),
                      ),
                      icon: const Icon(Icons.refresh),
                      label: const Text('Restart Quiz'),
                    )
                    


                ])));
  }
}
