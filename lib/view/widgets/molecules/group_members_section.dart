import 'package:flutter/material.dart';

import '../atoms/group_member.dart';

class GroupMembersSection extends StatelessWidget {

  const GroupMembersSection({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 100,
      child: Column(
        children: [Expanded(
          child: ListView.builder(
            itemCount: 1,//TODO:CHANGE ITEM COUNT MAKE IT DYNAMIC
              itemBuilder: (context,index){
            GroupMember();
          }),
        ),]
      ),
    );
  }
}
