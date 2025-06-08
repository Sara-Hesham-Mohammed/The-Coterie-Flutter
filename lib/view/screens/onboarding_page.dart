import 'package:flutter/material.dart';
import 'package:the_coterie/view/widgets/onboarding_widgets.dart';

class OnboardingPage extends StatefulWidget {
  OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final controller = PageController(
    initialPage: 0,
  );

  int _currentPage = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          color: Color(0xFFFFFDFB),
          child: Column(
            children: [
              Expanded(
                child: PageView(
                  controller: controller,
                  onPageChanged: (index) {
                    setState(() {
                      _currentPage = index;
                    });
                  },
                  children: [
                    OnboardingPageX(
                        text: "Feel the experience.",
                        imgPath: './assets/welc-logo.png'),
                    OnboardingPageX(
                        text: "Find your vibe.",
                        imgPath: './assets/party-nobg.png'),
                    OnbPageFinal(),
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(3, (index) {
                  return AnimatedContainer(
                    duration: Duration(milliseconds: 300),
                    margin: EdgeInsets.symmetric(horizontal: 4),
                    width: _currentPage == index ? 12 : 8,
                    height: _currentPage == index ? 12 : 8,
                    decoration: BoxDecoration(
                      color: _currentPage == index ? Colors.black : Colors.grey,
                      shape: BoxShape.circle,
                    ),
                  );
                }),
              ),
              SizedBox(height: 50),
            ],
          )),
    );
  }
}
