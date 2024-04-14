import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:simple_quiz_app/question_summary/question_identifier.dart';

class SummaryItem extends StatelessWidget {
  const SummaryItem(this.itemdata, {super.key});
  final Map<String, Object> itemdata;

  @override
  Widget build(context) {
    final isCorrectAnswer =
        itemdata['current answer'] == itemdata['answer'];
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
          QuestionIdentifier(
            isCorrectAnswer: isCorrectAnswer,
            questionIndex: itemdata['question_index'] as int,
          ),
          const SizedBox(width: 20),
          Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(
                  itemdata['question'] as String,
                  style: GoogleFonts.lato(
                      color: const Color.fromARGB(255, 128, 244, 186),
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(itemdata['current answer'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 234, 198, 210),
                    )),
                Text(itemdata['answer'] as String,
                    style: const TextStyle(
                      color: Color.fromARGB(255, 128, 244, 186),
                    ))
              ]))
        ]));
  }
}
