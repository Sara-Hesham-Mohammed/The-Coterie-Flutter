import 'package:flutter/material.dart';
import 'package:the_coterie/view/widgets/Calendar.dart';
import 'package:the_coterie/view/widgets/molecules/personal_info_tile.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
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
            SizedBox(width: 300, height: 340, child: Calendar()),
            const SizedBox(height: 20),
            Text(
              "Upcoming Events",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),
            // Placeholder for upcoming events
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Center(
                child: Text(
                  "No upcoming events",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Past Events",
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 20),



          ],
        ),
      ),
    );
  }
}
