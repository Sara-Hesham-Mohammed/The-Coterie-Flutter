import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  const SignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Placeholder(),
        ElevatedButton(onPressed: (){
          Navigator.pop(context);
        }, child: Icon(Icons.arrow_back_ios))
      ],
    );
  }
}
