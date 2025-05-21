import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class onb_page1 extends StatelessWidget {
  const onb_page1({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
        margin: const EdgeInsets.only(top: 125),
        child: Column(
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Image(image: AssetImage('./assets/welc-logo.png')),
            ),
            SizedBox(height: 75),
            Center(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 15),
                child: Text("Extroverts' daydream",
                    style: GoogleFonts.quicksand(
                      fontSize: 27,
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF2B2B2B),
                    )),
              ),
            ),
          ],
        ),
    );
  }
}

class onb_page2 extends StatelessWidget {
  const onb_page2({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class onb_page3 extends StatelessWidget {
  const onb_page3({super.key});

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
