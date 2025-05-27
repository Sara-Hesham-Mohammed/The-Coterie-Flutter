import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:the_coterie/widgets/button.dart';

class OnboardingPageX extends StatelessWidget {
  final String imgPath;
  final String text;
  const OnboardingPageX({super.key,required this.text, required this.imgPath});

  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: const EdgeInsets.only(top: 125),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image(image: AssetImage(imgPath)),
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
          child: Image(image: AssetImage('./assets/social.png')),
        ),
        SizedBox(height: 75),
        OnboardingText(text: "Join The Coterie."),
        PrimaryButton(text: "Sign Up", onPressedFn: () {
          Navigator.pushNamed(context, '/signup');
        }),
        SecondaryButton(text: "Log In", onPressedFn: () {
          Navigator.pushNamed(context, '/login');
        }),
      ],
    );
  }
}

class OnboardingText extends StatelessWidget {
  final String text;
  const OnboardingText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 15),
        child: Text(text,
            style: GoogleFonts.quicksand(
              fontSize: 27,
              fontWeight: FontWeight.w400,
              color: Color(0xFF2B2B2B),
            )),
      ),
    );
  }
}
