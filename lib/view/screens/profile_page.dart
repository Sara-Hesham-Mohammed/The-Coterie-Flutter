import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:the_coterie/view/widgets/Calendar.dart';
import 'package:the_coterie/view/widgets/molecules/personal_info_tile.dart';
import 'package:the_coterie/view/widgets/pfp.dart';

import '../../utils/msg_snackbar.dart';
import '../../view_models/auth_cubit/auth_cubit_cubit.dart';
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
                name: "Sara Hesham",
                bio:
                "From Cairo, Egypt\nLover of art, music, and technology",
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
                title: "Settings",
                content: ProfileSettings() // Updated settings section
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
  final VoidCallback? callback;
  const ProfileBottom({super.key, required this.text, this.callback});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100, // Reduced height for better proportions
      width: double.infinity,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Center(
        child: TextButton(
          onPressed: callback,
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}

class ProfileSettings extends StatelessWidget {
  const ProfileSettings({super.key});

  void _handleSignOut(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Sign Out'),
          content: Text('Are you sure you want to sign out?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close dialog
                _performSignOut(context);
              },
              child: Text(
                'Sign Out',
                style: TextStyle(
                  color: Theme.of(context).colorScheme.error,
                ),
              ),
            ),
          ],
        );
      },
    );
  }

  void _performSignOut(BuildContext context) async {
    final cubit = BlocProvider.of<AuthCubit>(context);

    // Show loading message
    SnackBarUtils.showSnackBar(context, 'Signing out...');

    await cubit.signOut();

    // Navigate to login/sign-in page and clear navigation stack
    Navigator.of(context).pushNamedAndRemoveUntil(
      '/login', // Use the correct login route
      (Route<dynamic> route) => false, // This removes all previous routes
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Theme.of(context).colorScheme.outline.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Column(
        children: [
          _buildSettingsItem(
            context,
            icon: Icons.settings,
            title: 'Settings',
            onTap: () {
              Navigator.of(context).pushNamed('/settings');
            },
          ),
          _buildDivider(context),
          _buildSettingsItem(
            context,
            icon: Icons.info_outline,
            title: 'About Us',
            onTap: () {
              Navigator.of(context).pushNamed('/about');
            },
          ),
          _buildDivider(context),
          _buildSettingsItem(
            context,
            icon: Icons.contact_support,
            title: 'Contact Us',
            onTap: () {
              Navigator.of(context).pushNamed('/contact');
            },
          ),
          _buildDivider(context),
          _buildSettingsItem(
            context,
            icon: Icons.person_add,
            title: 'Become a Host',
            onTap: () {
              Navigator.of(context).pushNamed('/become-host');
            },
          ),
          _buildDivider(context),
          _buildSettingsItem(
            context,
            icon: Icons.logout,
            title: 'Sign Out',
            onTap: () => _handleSignOut(context),
            isDestructive: true,
          ),
        ],
      ),
    );
  }

  Widget _buildSettingsItem(
      BuildContext context, {
        required IconData icon,
        required String title,
        required VoidCallback onTap,
        bool isDestructive = false,
      }) {
    return ListTile(
      leading: Icon(
        icon,
        color: isDestructive
            ? Theme.of(context).colorScheme.error
            : Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
          color: isDestructive
              ? Theme.of(context).colorScheme.error
              : Theme.of(context).colorScheme.onSurface,
        ),
      ),
      trailing: Icon(
        Icons.chevron_right,
        color: Theme.of(context).colorScheme.onSurfaceVariant,
      ),
      onTap: onTap,
    );
  }

  Widget _buildDivider(BuildContext context) {
    return Divider(
      height: 1,
      color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
    );
  }
}