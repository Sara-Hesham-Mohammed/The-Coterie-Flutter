import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class GroupMember extends StatelessWidget {
  // final User user;
  // const GroupMember({super.key, required this.user});
  const GroupMember({super.key});

  @override
  Widget build(BuildContext context) {
    return ListTile(
        leading: CircleAvatar(),
        title: Text('Name'), //person's name
        subtitle: Column(children: [
          Text('Age+country'),
          Text('Interests?'),
        ]),
      tileColor: Theme.of(context).colorScheme.secondary,
    );
  }
}
