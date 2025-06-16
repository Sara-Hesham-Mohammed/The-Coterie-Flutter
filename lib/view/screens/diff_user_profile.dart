import 'package:flutter/material.dart';
import '../../../model/entities/User.dart';

class UserProfileScreen extends StatelessWidget {
  final User user;

  const UserProfileScreen({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('${user.name.split(' ').first}\'s Profile'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Picture
            Center(
              child: CircleAvatar(
                radius: 40,
                backgroundColor: Theme.of(context).colorScheme.primary,
                child: Text(
                  user.name[0].toUpperCase(),
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.onPrimary,
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Name
            Center(
              child: Text(
                user.name,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 8),
            // Username
            Center(
              child: Text(
                '@${user.name}',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey[600],
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Bio (optional)
            Text(
              user.bio ?? 'No bio available.',
              style: const TextStyle(fontSize: 14),
            ),
            const SizedBox(height: 24),
            // Connect button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  // handle connect logic
                },
                child: const Text("Connect"),
              ),
            ),
            const SizedBox(height: 24),
            // Tags
            if (user.tags.isNotEmpty) ...[
              const Text(
                'Interests:',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Wrap(
                spacing: 6,
                children: user.tags.map((tag) => Chip(
                  label: Text(tag.tagName),
                )).toList(),
              ),
            ]
          ],
        ),
      ),
    );
  }
}
