import 'package:flutter/material.dart';
import 'package:the_coterie/view/widgets/Calendar.dart';
import 'package:the_coterie/view/widgets/molecules/personal_info_tile.dart';

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
            Container(
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
            ),
            PersonalInfoTile(
              name: "Jane Doe",
              bio: "Bio",
            ),
            ProfileSection(
              title: "Interests",
              content: ProfileInterests()
            ),
            const SizedBox(height: 20),
            ProfileSection(
              title: "Profile Stats",
              content: ProfileStats(),
            ),
            SizedBox(width: 300, height: 340, child: Calendar()),
            const SizedBox(height: 20),
            ProfileSection(
              title: "Friends",
              content: ImageStackWidget(),
            ),
            ProfileSection(
              title: "Upcoming Events",
              content: PlaceholderContainer(text: "No upcoming events",)// Placeholder for upcoming events
            ),
            ProfileSection(
              title: "Past Events",
              content: Placeholder(),
            ),
            const SizedBox(height: 20),
            ProfileSection(
                title: "Setting",
                content: PlaceholderContainer(text: "Settings\n About Us\n Contact Us\n Become a host\n",)// Placeholder for upcoming events
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
      ],
    );
  }
}

class PlaceholderContainer extends StatelessWidget {
  final String text;
  const PlaceholderContainer({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return   Container(
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.grey[300],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Center(
        child: Text(
          text,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
    );
  }
}

