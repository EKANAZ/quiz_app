import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionBox extends StatelessWidget {
  String question;
  QuestionBox({Key? key, required this.question}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 270,
      height: 70,
      child: Text(
        question,

        textAlign: TextAlign.left,
        style: GoogleFonts.mulish(
            fontSize: 20, fontWeight: FontWeight.w700, letterSpacing: -0.3),
      ),
    );
  }
}
