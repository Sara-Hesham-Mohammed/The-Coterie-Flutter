import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:the_coterie/view/pages/event_page.dart';

class SignUp extends StatelessWidget {
  //final providers = [EmailAuthProvider()];

  SignUp({super.key});

  @override
  Widget build(BuildContext context) {

    void onSignedIn() {
      Navigator.of(context).push(
        MaterialPageRoute<void>(
          builder: (context) => EventPage(),
        ),
      );;
    }

    return ElevatedButton(onPressed: googleSignUp, child: Text("Google"));


    // return SignInScreen(
    //   providers: providers,
    //   actions: [
    //     AuthStateChangeAction<UserCreated>((context, state) {
    //       // Put any new user logic here
    //       onSignedIn();
    //     }),
    //     AuthStateChangeAction<SignedIn>((context, state) {
    //       onSignedIn();
    //     }),
    //   ],
    // );
  }

  googleSignUp()async{

    //google account instance
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    //this is the instance that'll give us the tokens
    GoogleSignInAuthentication? googleAuth = await googleUser?.authentication;

    //this is to get the google credentials
    AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken
    );
    //this is to get authenticated with firebase, returns a future user credential
    //this insatnce gives us access to the user info
    UserCredential userCredentials = await FirebaseAuth.instance.signInWithCredential(credential);

    //testing
    print(userCredentials.user?.displayName);

  }

}
