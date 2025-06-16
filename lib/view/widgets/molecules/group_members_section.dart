import 'package:flutter/material.dart';
import '../../../model/entities/Tag.dart';
import '../../../model/entities/User.dart';
import '../../../model/entities/Category.dart';
import '../atoms/group_member.dart';

class GroupMembersSection extends StatelessWidget {
  final List<User>? users; // Optional list of users

  const GroupMembersSection({
    super.key,
    this.users,
  });

  // Sample data for demonstration using your User model
  List<User> get _sampleUsers => [
    User(
      userID: 1,
      name: 'Sarah Johnson',
      dateOfBirth: DateTime(1995, 3, 15),
      gender: 'Female',
      address: '123 Main St, Cairo, Egypt',
      phoneNumber: '+20-123-456-7890',
      email: 'sarah.johnson@example.com',
      languages: ['English', 'Arabic'],
      countryOfOrigin: 'Egypt',
      tags: {
        _createTag(1, 'Photography', Category.ArtAndCulture),
        _createTag(2, 'Travel', Category.NatureAndOutdoors),
        _createTag(3, 'Technology', Category.DefaultInterest),
      },
    ),
    User(
      userID: 2,
      name: 'Michael Chen',
      dateOfBirth: DateTime(1992, 7, 22),
      gender: 'Male',
      address: '456 Elm St, Alexandria, Egypt',
      phoneNumber: '+20-987-654-3210',
      email: 'michael.chen@example.com',
      languages: ['English', 'Chinese', 'Arabic'],
      countryOfOrigin: 'China',
      tags: {
        _createTag(4, 'Programming', Category.DefaultInterest),
        _createTag(5, 'Gaming', Category.Games),
        _createTag(6, 'Fitness', Category.Sports),
      },
    ),
    User(
      userID: 3,
      name: 'Emma Davis',
      dateOfBirth: DateTime(1998, 11, 8),
      gender: 'Female',
      address: '789 Oak Ave, Giza, Egypt',
      phoneNumber: '+20-555-123-4567',
      email: 'emma.davis@example.com',
      languages: ['English', 'French'],
      countryOfOrigin: 'France',
      tags: {
        _createTag(7, 'Art', Category.ArtAndCulture),
        _createTag(8, 'Music', Category.DanceAndMusic),
        _createTag(9, 'Cooking', Category.DefaultInterest),
      },
    ),
    User(
      userID: 4,
      name: 'James Wilson',
      dateOfBirth: DateTime(1990, 5, 12),
      gender: 'Male',
      address: '321 Pine St, Luxor, Egypt',
      phoneNumber: '+20-444-789-0123',
      email: 'james.wilson@example.com',
      languages: ['English'],
      countryOfOrigin: 'United States',
      tags: {
        _createTag(10, 'Sports', Category.Sports),
        _createTag(11, 'Business', Category.DefaultInterest),
        _createTag(12, 'Reading', Category.Literature),
      },
    ),
    User(
      userID: 5,
      name: 'Olivia Brown',
      dateOfBirth: DateTime(1996, 9, 25),
      gender: 'Female',
      address: '654 Maple Dr, Aswan, Egypt',
      phoneNumber: '+20-333-567-8901',
      email: 'olivia.brown@example.com',
      languages: ['English', 'Spanish', 'Arabic'],
      countryOfOrigin: 'Spain',
      tags: {
        _createTag(13, 'Fashion', Category.ArtAndCulture),
        _createTag(14, 'Dance', Category.DanceAndMusic),
        _createTag(15, 'Volunteering', Category.HumanitarianWork),
      },
    ),
    User(
      userID: 6,
      name: 'David Miller',
      dateOfBirth: DateTime(1993, 12, 3),
      gender: 'Male',
      address: '987 Cedar Ln, Sharm El Sheikh, Egypt',
      phoneNumber: '+20-222-345-6789',
      email: 'david.miller@example.com',
      languages: ['English', 'German'],
      countryOfOrigin: 'Germany',
      tags: {
        _createTag(16, 'Engineering', Category.DefaultInterest),
        _createTag(17, 'Cycling', Category.Sports),
        _createTag(18, 'Environmental', Category.NatureAndOutdoors),
      },
    ),
    User(
      userID: 7,
      name: 'Sophia Garcia',
      dateOfBirth: DateTime(1997, 4, 18),
      gender: 'Female',
      address: '147 Birch St, Hurghada, Egypt',
      phoneNumber: '+20-111-234-5678',
      email: 'sophia.garcia@example.com',
      languages: ['Spanish', 'English', 'Arabic'],
      countryOfOrigin: 'Mexico',
      tags: {
        _createTag(19, 'Medicine', Category.DefaultInterest),
        _createTag(20, 'Yoga', Category.Sports),
        _createTag(21, 'Community Service', Category.HumanitarianWork),
      },
    ),
    User(
      userID: 8,
      name: 'Ryan Martinez',
      dateOfBirth: DateTime(1994, 8, 30),
      gender: 'Male',
      address: '258 Willow Way, Dahab, Egypt',
      phoneNumber: '+20-999-876-5432',
      email: 'ryan.martinez@example.com',
      languages: ['English', 'Portuguese'],
      countryOfOrigin: 'Brazil',
      tags: {
        _createTag(22, 'Music Production', Category.DanceAndMusic),
        _createTag(23, 'Surfing', Category.Sports),
        _createTag(24, 'Film', Category.ArtAndCulture),
      },
    ),
    User(
      userID: 9,
      name: 'Leila Hassan',
      dateOfBirth: DateTime(1991, 1, 14),
      gender: 'Female',
      address: '369 Palm St, Cairo, Egypt',
      phoneNumber: '+20-777-345-1234',
      email: 'leila.hassan@example.com',
      languages: ['Arabic', 'English', 'Turkish'],
      countryOfOrigin: 'Egypt',
      tags: {
        _createTag(25, 'Architecture', Category.ArtAndCulture),
        _createTag(26, 'Calligraphy', Category.ArtAndCulture),
        _createTag(27, 'History', Category.Literature),
      },
    ),
    User(
      userID: 10,
      name: 'Ahmed Mostafa',
      dateOfBirth: DateTime(1989, 6, 7),
      gender: 'Male',
      address: '741 Desert Rd, Cairo, Egypt',
      phoneNumber: '+20-666-789-0123',
      email: 'ahmed.mostafa@example.com',
      languages: ['Arabic', 'English'],
      countryOfOrigin: 'Egypt',
      tags: {
        _createTag(28, 'Finance', Category.DefaultInterest),
        _createTag(29, 'Football', Category.Sports),
        _createTag(30, 'Investment', Category.DefaultInterest),
      },
    ),
  ];

  // Helper method to create sample tags
  Tag _createTag(int id, String name, Category category) {
    return Tag(
      tagID: id,
      tagName: name,
      tagCategory: category,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Use provided users or sample data
    final userList = users ?? _sampleUsers;

    return Container(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 200),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Group Members (${userList.length})',
                style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.group,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          SizedBox(height: 16),
          if (userList.isEmpty)
            Container(
              padding: EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surfaceVariant.withOpacity(0.3),
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: Theme.of(context).colorScheme.outline.withOpacity(0.2),
                ),
              ),
              child: Column(
                children: [
                  Icon(
                    Icons.group_off,
                    size: 48,
                    color: Theme.of(context).colorScheme.onSurfaceVariant.withOpacity(0.5),
                  ),
                  SizedBox(height: 12),
                  Text(
                    'No group members yet',
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                      color: Theme.of(context).colorScheme.onSurfaceVariant,
                    ),
                  ),
                ],
              ),
            )
          else
            Column(
              children: [
                // Show first few members
                ListView.separated(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: userList.length > 5 ? 5 : userList.length,
                  separatorBuilder: (context, index) => SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    return GroupMember(user: userList[index]);
                  },
                ),
                // Show "View All" button if there are more than 5 members
                if (userList.length > 5) ...[
                  SizedBox(height: 12),
                  Container(
                    width: double.infinity,
                    child: OutlinedButton.icon(
                      onPressed: () {
                        _showAllMembers(context, userList);
                      },
                      icon: Icon(Icons.expand_more),
                      label: Text('View All ${userList.length} Members'),
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                    ),
                  ),
                ],
              ],
            ),
        ],
      ),
    );
  }

  void _showAllMembers(BuildContext context, List<User> userList) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.7,
        maxChildSize: 0.9,
        minChildSize: 0.5,
        builder: (context, scrollController) => Container(
          decoration: BoxDecoration(
            color: Theme.of(context).scaffoldBackgroundColor,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          padding: EdgeInsets.all(16),
          child: Column(
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'All Group Members (${userList.length})',
                style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 16),
              Expanded(
                child: ListView.separated(
                  controller: scrollController,
                  itemCount: userList.length,
                  separatorBuilder: (context, index) => SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    return GroupMember(user: userList[index]);
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}