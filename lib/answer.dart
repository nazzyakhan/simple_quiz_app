import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  AnswerButton({super.key, required this.answerText, required this.onTap});
  final String answerText;
  final void Function() onTap;

  @override
  Widget build(context) {
    return ElevatedButton(
      onPressed: onTap,
      style: ElevatedButton.styleFrom(
        padding: EdgeInsets.symmetric(horizontal: 40, vertical:5
        ),
        backgroundColor: const Color.fromARGB(255, 128, 244, 186),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
      ),
      child: Text(
       answerText,
        style: TextStyle(
          color: Color.fromARGB(255, 5, 77, 40),

          fontSize: 14,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
 