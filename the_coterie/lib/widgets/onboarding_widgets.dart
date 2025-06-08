import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_coterie/widgets/button.dart';

class OnboardingPageX extends StatelessWidget {
  final String imgPath;
  final String text;

  OnboardingPageX({super.key, required this.text, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 125),
      child: Column(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Image(image: AssetImage(imgPath),width: 350,
              height: 350,),
          ),
          SizedBox(height: 75),
          OnboardingText(text: text),
        ],
      ),
    );
  }
}

class OnbPageFinal extends StatelessWidget {
  const OnbPageFinal({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topCenter,
          child: Image(image: AssetImage('./assets/social.png'),
              width: 300,
              height: 300,
              fit: BoxFit.cover,
        ),),
        SizedBox(height: 75),
        OnboardingText(text: "Join The Coterie."),
        SizedBox(height: 75),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            PrimaryButton(
                text: "Sign Up",
                onPressedFn: () {
                  Navigator.pushNamed(context, '/signup');
                }),
            SizedBox(width: 25),
            SecondaryButton(
                text: "Log In",
                onPressedFn: () {
                  Navigator.pushNamed(context, '/login');
                }),
          ],
        ),
      ],
    );
  }
}

class OnboardingText extends StatelessWidget {
  final String text;

  OnboardingText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Definition(),
            SizedBox(height: 100),
            Text(text,
                style: GoogleFonts.dmSerifDisplay(
                  fontSize: 30,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF2B2B2B),
                )),
          ],
        ),
      ),
    );
  }
}

class Definition extends StatelessWidget {
  final String definition = "coterie /kō′tə-rē/ ";
  final String subtext =
      "(n.) An exclusive group of people with a unifying common interest or purpose";

  const Definition({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Align(
          alignment: Alignment.topLeft,
          child: Text(definition,
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                fontSize: 27,
                fontWeight: FontWeight.w600,
              )),
        ),
        SizedBox(height: 10),
        Text(subtext,
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
              fontSize: 19,
              fontStyle: FontStyle.italic,
            )),
      ],
    );
  }
}
