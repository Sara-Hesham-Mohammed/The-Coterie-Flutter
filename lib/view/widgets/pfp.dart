import 'package:flutter/material.dart';

class ProfilePic extends StatelessWidget {
  const ProfilePic({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
        borderRadius: new BorderRadius.all(new Radius.circular(40.0)),
        border: new Border.all(
          color: Colors.black,
          width: 2.0,
        ),
      ),
      child: CircleAvatar(
        foregroundImage:
        Image(image: AssetImage('./assets/profile.jpg')).image,
        foregroundColor: Colors.black,
        radius: 30.0,
      ),
    );
  }
}
