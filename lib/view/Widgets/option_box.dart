import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

import '../../controller/index_controller.dart';

class OptionBox extends StatelessWidget {
  OptionBox({
    Key? key,
    // required this.selectedOption,
    required this.optionIndex,
    required this.indexForQuestionNumber,
    required this.providerIndexForOption,
    required this.optionParameter,
    required this.optionSelected,
  }) : super(key: key);

  final String optionIndex;
  final int indexForQuestionNumber;
  final List optionParameter;
  int optionSelected;

  final int providerIndexForOption;

  @override
  Widget build(BuildContext context) {
    return Consumer<IndexController>(builder: (context, provider, child) {
      Color changeColor() {
        if (provider.optionSelected == 1 && providerIndexForOption == 1) {
          return Colors.black;
        } else if (provider.optionSelected == 2 &&
            providerIndexForOption == 2) {
          return Colors.black;
        } else if (provider.optionSelected == 3 &&
            providerIndexForOption == 3) {
          return Colors.black;
        } else if (provider.optionSelected == 4 &&
            providerIndexForOption == 4) {
          return Colors.black;
        }
        return const Color.fromARGB(255, 255, 255, 255);
      }

      Icon changeicon() {
        if (provider.optionSelected == 1 && providerIndexForOption == 1) {
          return const Icon(
            Icons.done_outline_sharp,
            size: 25,
            color: Colors.white,
          );
        } else if (provider.optionSelected == 2 &&
            providerIndexForOption == 2) {
          return const Icon(
            Icons.done_outline_sharp,
            size: 25,
            color: Colors.white,
          );
        } else if (provider.optionSelected == 3 &&
            providerIndexForOption == 3) {
          return const Icon(
            Icons.done_outline_sharp,
            size: 25,
            color: Colors.white,
          );
        } else if (provider.optionSelected == 4 &&
            providerIndexForOption == 4) {
          return const Icon(
            Icons.done_outline_sharp,
            size: 25,
            color: Colors.white,
          );
        }
        return const Icon(null);
      }

      return Padding(
        padding: const EdgeInsets.only(top: 10, right: 15, left: 15),
        child: ListTile(
          onTap: () {
            provider.selectedOptionIndex(providerIndexForOption);
          },
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          tileColor: changeColor(),
          leading: Text(
            optionIndex,
            style: GoogleFonts.mulish(
              fontSize: 18,
              fontWeight: FontWeight.w700,
              color: changeColor(),
            ),
          ),
          title: Text(
            optionParameter[indexForQuestionNumber],
            textAlign: TextAlign.left,
            style: GoogleFonts.mulish(
              fontWeight: FontWeight.w800,
              fontSize: 18,
              letterSpacing: -0.3,
              color: changeColor(),
            ),
          ),
          trailing: changeicon(),
        ),
      );
    });
  }
}