import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:provider/provider.dart';
import 'package:quiz_app/view/screens/welcome_screen.dart';


import '../../../controller/index_controller.dart';

class ResultPage extends StatelessWidget {
  ResultPage({super.key, required this.marksEarnedFromQuiz});

  int marksEarnedFromQuiz = 0;

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        final shouldPop = await showDialog<bool>(
          context: context,
          builder: (context) {
            return AlertDialog(
              insetPadding: EdgeInsets.zero,
              contentTextStyle: GoogleFonts.mulish(),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: const Text('Quit Quiz?'),
              content: const Text(
                'Are you sure you want exit!',
                textAlign: TextAlign.left,
                style: TextStyle(color: Colors.grey, fontSize: 16),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => exit(0)));
                  },
                  child: const Text(
                    'Yes',
                    style: TextStyle(color: Colors.red),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.pop(context, false);
                  },
                  child: const Text('No'),
                ),
              ],
            );
          },
        );
        return shouldPop!;
      },
      child: Consumer<IndexController>(
          builder: (context, getIndexProvider, child) {
        return Scaffold(
          backgroundColor: const Color.fromARGB(255, 99, 69, 69),
          appBar: AppBar(
            backgroundColor: const Color.fromARGB(255, 99, 69, 69),
            centerTitle: true,
            title: Text(
              'Result',
              style: GoogleFonts.mulish(
                color: Colors.black,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.3,
                fontSize: 20,
              ),
            ),
            elevation: 0,
          ),
          body: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 149.33,
                    height: 149.33,
                    child: CircularPercentIndicator(
                      backgroundColor: const Color.fromRGBO(230, 230, 230, 1),
                      animation: true,
                      radius: 70,
                      lineWidth: 13.0,
                      percent: marksEarnedFromQuiz / 10,
                      animationDuration: 1000,
                      reverse: true,
                      circularStrokeCap: CircularStrokeCap.round,
                      center: Text(
                        "$marksEarnedFromQuiz/10",
                        style: GoogleFonts.mulish(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          letterSpacing: -0.3,
                          fontSize: 15,
                        ),
                      ),
                      progressColor: marksEarnedFromQuiz > 4
                          ? Color.fromARGB(255, 49, 54, 45)
                          : const Color.fromRGBO(254, 123, 30, 1),
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 23,
                        ),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: Colors.redAccent,
                                side: const BorderSide(
                                    width: 3, color: Colors.brown),
                                elevation: 3,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(30)),
                                padding: const EdgeInsets.all(20)),
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          const HomeScreen()));
                            },
                            child: const Text("Try Again")),
                      )
                    ],
                  )
                ],
              )
            ],
          ),
        );
      }),
    );
  }
}
