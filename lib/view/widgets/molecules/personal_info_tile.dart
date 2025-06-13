import 'package:flutter/material.dart';

class PersonalInfoTile extends StatelessWidget {
  final name;
  final bio;
  final textColor;
  PersonalInfoTile({this.name, this.bio, this.textColor = Colors.black});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Text(
          name,
          style: TextStyle(
              fontSize: 20.0, fontWeight: FontWeight.w700, color: textColor),
        ),
        SizedBox(
          height: 5.0,
        ),
        Text(
          bio,
          style: TextStyle(
              fontSize: 15.0, fontWeight: FontWeight.normal, color: textColor),
        ),
      ],
    );
  }
}