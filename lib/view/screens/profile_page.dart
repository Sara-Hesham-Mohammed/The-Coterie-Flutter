import 'package:flutter/material.dart';
import 'package:the_coterie/view/widgets/Calendar.dart';
import 'package:the_coterie/view/widgets/molecules/personal_info_tile.dart';
import 'package:the_coterie/view/widgets/pfp.dart';

import '../widgets/molecules/img_stack.dart';
import '../widgets/molecules/profile_interests.dart';
import '../widgets/molecules/profile_stats.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Column(children: [
              ProfilePic(),
              PersonalInfoTile(
                name: "Jane Doe",
                bio:
                    "From San Francisco, CA\nLover of art, music, and technology",
              ),
            ]),
            ProfileSection(
                title: "Interests",
                content: SizedBox(child: ProfileInterests())),
            ProfileSection(
                title: "Friends",
                content: Container(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ImageStackWidget(),
                      SizedBox(width: 50),
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pushNamed('/friends-list');
                        },
                        child: Text("+20",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onTertiary,
                                )),
                      ),
                    ],
                  ),
                )),
            ProfileSection(
              title: "Calendar",
              content: Calendar(),
            ),
            ProfileSection(
              title: "Profile Stats",
              content: ProfileStats(),
            ),
            ProfileSection(
                title: "Upcoming Events",
                content: ProfileBottom(
                  text: "No upcoming events",
                ) // Placeholder for upcoming events
                ),
            ProfileSection(
              title: "Past Events",
              content: Placeholder(),
            ),
            ProfileSection(
                title: "Setting",
                content: ProfileBottom(
                  text: "Settings\n About Us\n Contact Us\n Become a host\n",
                ) // Placeholder for upcoming events
                ),
          ],
        ),
      ),
    );
  }
}

class ProfileSection extends StatelessWidget {
  final String title;
  final Widget content;
  const ProfileSection({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 20),
        Text(
          title,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        const SizedBox(height: 20),
        content,
        const SizedBox(height: 20),
      ],
    );
  }
}

class ProfileBottom extends StatelessWidget {
  final String text;
  const ProfileBottom({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: TextButton(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          onPressed: () {

          },
        ),
      ),
    );
  }
}
