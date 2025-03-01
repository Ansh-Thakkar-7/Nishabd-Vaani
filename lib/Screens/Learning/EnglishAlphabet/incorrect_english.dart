import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:nishabdvaani/Provider/alphabet_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nishabdvaani/Screens/Learning/EnglishAlphabet/english_alphabet.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class IncorrectEnglish extends ConsumerWidget {
  final String selectedOption;
  final String answer;

  IncorrectEnglish({required this.selectedOption, required this.answer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              AppLocalizations.of(context)!.wrong,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Colors.red,
              ),
            ),
            const SizedBox(height: 20),
            Image.asset('assets/Learning/incorrect.png'), // Add your image here
            const SizedBox(height: 20),
             Text(
              AppLocalizations.of(context)!.wrong_answer,
              style: TextStyle(fontSize: 18),
            ),
             Text(
               AppLocalizations.of(context)!.correct_answer,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Image.network(answer),
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () async {
                   await ref.read(alphabetProvider.notifier).fetchNextAlphabet();
                  Future.delayed(Duration(milliseconds: 100), () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const EnglishAlphabet(),
                    ),
                  );
                });
                  },
                  style: ElevatedButton.styleFrom(
                  backgroundColor:Colors.red,
                  textStyle: const TextStyle(fontSize: 16),
                  padding: const  EdgeInsets.symmetric(vertical: 15, horizontal: 60),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                  child: Text(  AppLocalizations.of(context)!.next, style: GoogleFonts.openSans(color: Colors.white,fontSize: 20, fontWeight: FontWeight.bold,),),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}