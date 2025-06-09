import 'package:flutter/material.dart';
import 'package:the_coterie/view/widgets/atoms/profile_stat_item.dart';

class ProfileStats extends StatelessWidget {
  const ProfileStats({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          SingleStat(title: "Events Attended", value: 20,),
          SingleStat(title: "Friends", value: 40,)
        ]);
  }
}
