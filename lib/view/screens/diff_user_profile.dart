import 'package:flutter/material.dart';
import 'package:the_coterie/view/screens/profile_page.dart';
import 'package:the_coterie/view/widgets/connect_btn.dart';
import '../../../model/entities/User.dart';
import '../../utils/msg_snackbar.dart';
import '../widgets/molecules/profile_stats.dart';

class UserProfileScreen extends StatelessWidget {
  final User user;

  const UserProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final screenSize = MediaQuery.of(context).size;
    int age = 2025 - user.dateOfBirth.year;

    return Scaffold(
      appBar: AppBar(
        title: Text('${user.name.split(' ').first}\'s Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 45,
                backgroundColor: theme.colorScheme.primary,
                child: Text(
                  user.name[0].toUpperCase(),
                  style: TextStyle(
                    color: theme.colorScheme.onPrimary,
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),

            // Name & Username
            Center(
              child: Column(
                children: [
                  Text(
                    user.name,
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '@${user.name}',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 24),
            Padding(
              padding: const EdgeInsets.only(bottom: 16.0),
              child: Center(
                child: ConnectBtn()
              ),
            ),
            Divider(),

            // Bio
            const Text(
              'Bio',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 6),
            Text(
              user.bio?.trim().isNotEmpty == true
                  ? user.bio!
                  : 'No bio available.',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 20),

            // Basic Info (Age & Country)
            if (user.countryOfOrigin != null || user.dateOfBirth != null) ...[
              const Text(
                'Details',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 6),
              Row(
                children: [
                  if (user.dateOfBirth != null) Text('Age: $age'),
                  if (user.dateOfBirth != null && user.countryOfOrigin != null)
                    const SizedBox(width: 12),
                  if (user.countryOfOrigin != null)
                    Text('From: ${user.countryOfOrigin}'),
                ],
              ),
              const SizedBox(height: 20),
            ],

            // Interests
            const Text(
              'Interests',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 8),
            user.tags.isNotEmpty
                ? Wrap(
              spacing: 6,
              children: user.tags
                  .map((tag) => Chip(label: Text(tag.tagName)))
                  .toList(),
            )
                : const Text('No interests listed.'),
            // leave space for bottom button
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



    ],
        ),
      ),
    );
  }
}
