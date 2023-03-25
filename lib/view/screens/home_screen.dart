import 'dart:io';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../controller/index_controller.dart';
import '../../utilities/list_of_answers.dart';
import '../../utilities/list_of_questions.dart';
import '../Widgets/choose_an_answer_box.dart';
import '../Widgets/option_box.dart';

import '../Widgets/question_box.dart';
import '../Widgets/question_mark_icon.dart';
import '../Widgets/question_number_index.dart';
import 'result_screen.dart';

class FirstPage extends StatelessWidget {
  int indexForQuestionNumber = 1;
  int selectedOption = 0;
  int marksObtainedFromCorrectAnswer = 0;
  final double _sigmaX = 5;
  // from 0-10
  final double _sigmaY = 5;
  // from 0-10
  final double _opacity = 0.2;

  FirstPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Stack(
          alignment: Alignment.center,
          children: [
            Image.network(
              "https://th.bing.com/th/id/OIP.oBKDrg_iZIdKRwPkvCITtAHaNL?pid=ImgDet&rs=1",
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              fit: BoxFit.cover,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                // SizedBox(height: MediaQuery.of(context).size.height * 0.1),
                ClipRect(
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: _sigmaX, sigmaY: _sigmaY),
                    child: Container(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                          color: const Color.fromRGBO(0, 0, 0, 1)
                              .withOpacity(_opacity),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(30))),
                      width: MediaQuery.of(context).size.width * 0.9,
                      height: MediaQuery.of(context).size.height * 0.75,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                          //Main Column
                          children: [
                            Consumer<IndexController>(
                                builder: (context, provider, child) {
                              indexForQuestionNumber =
                                  provider.currentQuestionIndex;
                              selectedOption = provider.optionSelected;
                              return QuestionNumberIndex(
                                questionNumber: indexForQuestionNumber,
                              );
                            }),
                            Consumer<IndexController>(
                                builder: (context, provider, child) {
                              indexForQuestionNumber =
                                  provider.currentQuestionIndex;

                              return QuestionBox(
                                  question:
                                      questionsList[indexForQuestionNumber]);
                            }),
                            Consumer<IndexController>(
                                builder: (context, provider, child) {
                              return Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  OptionBox(
                                    optionSelected: provider.optionSelected,
                                    optionParameter: optionOne,
                                    optionIndex: 'A.',
                                    indexForQuestionNumber:
                                        provider.currentQuestionIndex,
                                    providerIndexForOption: 1,
                                  ),
                                  OptionBox(
                                    optionSelected: provider.optionSelected,
                                    optionParameter: optionTwo,
                                    optionIndex: 'B.',
                                    indexForQuestionNumber:
                                        provider.currentQuestionIndex,
                                    providerIndexForOption: 2,
                                  ),
                                  OptionBox(
                                    optionSelected: provider.optionSelected,
                                    optionParameter: optionThree,
                                    optionIndex: 'C.',
                                    indexForQuestionNumber:
                                        provider.currentQuestionIndex,
                                    providerIndexForOption: 3,
                                  ),
                                  OptionBox(
                                    optionSelected: provider.optionSelected,
                                    optionParameter: optionFour,
                                    optionIndex: 'D.',
                                    indexForQuestionNumber:
                                        provider.currentQuestionIndex,
                                    providerIndexForOption: 4,
                                  ),
                                  Consumer<IndexController>(
                                      builder: (context, provider, child) {
                                    indexForQuestionNumber =
                                        provider.currentQuestionIndex;
                                    selectedOption = provider.optionSelected;

                                    return Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.end,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(10),
                                              child: Container(
                                                height: 45,
                                                width: 100,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    boxShadow: const [
                                                      BoxShadow(
                                                        offset: Offset(1, 5),
                                                        color: Color.fromRGBO(
                                                            0, 0, 0, 0.25),
                                                        blurRadius: 1.5,
                                                        spreadRadius: 1,
                                                      ),
                                                      BoxShadow(
                                                          offset: Offset(1, 2),
                                                          color: Colors.white,
                                                          blurRadius: 1,
                                                          spreadRadius: 1)
                                                    ]),
                                                child: ListTile(
                                                  onTap: () {
                                                    marksForCorrectAnswers();
                                                    if (indexForQuestionNumber <
                                                        10) {
                                                      provider
                                                          .updateIndexForQuestion();
                                                    } else {
                                                      Navigator.push(
                                                          context,
                                                          MaterialPageRoute(
                                                            builder:
                                                                (context) =>
                                                                    ResultPage(
                                                              marksEarnedFromQuiz:
                                                                  marksObtainedFromCorrectAnswer,
                                                            ),
                                                          ));
                                                    }
                                                    provider
                                                        .selectedOptionIndex(0);
                                                  },
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  tileColor: Colors.white,
                                                  leading: Text(
                                                    'NEXT',
                                                    style: GoogleFonts.mulish(
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      color:
                                                          const Color.fromRGBO(
                                                              66, 130, 241, 1),
                                                    ),
                                                  ),
                                                  title: const Padding(
                                                    padding: EdgeInsets.only(
                                                      right: 20,
                                                      bottom: 5,
                                                    ),
                                                    child: Icon(
                                                      Icons.arrow_forward,
                                                      color: Color.fromRGBO(
                                                          66, 130, 241, 1),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    );
                                  })
                                ],
                              );
                            }),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  void marksForCorrectAnswers() {
    if (indexForQuestionNumber == 1) {
      if (selectedOption == 1) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 2) {
      if (selectedOption == 3) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 3) {
      if (selectedOption == 2) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 4) {
      if (selectedOption == 2) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 5) {
      if (selectedOption == 1) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 6) {
      if (selectedOption == 4) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 7) {
      if (selectedOption == 1) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 8) {
      if (selectedOption == 3) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 9) {
      if (selectedOption == 3) {
        marksObtainedFromCorrectAnswer++;
      }
    }
    if (indexForQuestionNumber == 10) {
      if (selectedOption == 4) {
        marksObtainedFromCorrectAnswer++;
      }
    }
  }
}
