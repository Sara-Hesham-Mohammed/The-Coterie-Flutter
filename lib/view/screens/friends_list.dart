import 'package:flutter/material.dart';

class FriendsListPage extends StatelessWidget {
  const FriendsListPage({super.key});

  // Sample data - replace with your actual data source
  final List<Map<String, dynamic>> friends = const [
    {
      'name': 'John Doe',
      'avatar': 'https://via.placeholder.com/50',
      'status': 'online',
      'mutualFriends': 5,
    },
    {
      'name': 'Jane Smith',
      'avatar': 'https://via.placeholder.com/50',
      'status': 'offline',
      'mutualFriends': 3,
    },
    {
      'name': 'Mike Johnson',
      'avatar': 'https://via.placeholder.com/50',
      'status': 'online',
      'mutualFriends': 8,
    },
    // Add more friends as needed
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Friends'),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // Handle search functionality
            },
          ),
          IconButton(
            icon: const Icon(Icons.person_add),
            onPressed: () {
              // Handle add friend functionality
            },
          ),
        ],
      ),
      body: friends.isEmpty
          ? const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people_outline,
              size: 64,
              color: Colors.grey,
            ),
            SizedBox(height: 16),
            Text(
              'No friends yet',
              style: TextStyle(
                fontSize: 18,
                color: Colors.grey,
              ),
            ),
            SizedBox(height: 8),
            Text(
              'Start connecting with people!',
              style: TextStyle(
                color: Colors.grey,
              ),
            ),
          ],
        ),
      )
          : ListView.builder(
        itemCount: friends.length,
        itemBuilder: (context, index) {
          final friend = friends[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(friend['avatar']),
              child: friend['avatar'] == null
                  ? Text(friend['name'][0].toUpperCase())
                  : null,
            ),
            title: Text(friend['name']),
            subtitle: Text(
              '${friend['mutualFriends']} mutual friends',
              style: TextStyle(color: Colors.grey[600]),
            ),
            trailing: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: friend['status'] == 'online'
                        ? Colors.green
                        : Colors.grey,
                  ),
                ),
                const SizedBox(width: 8),
                PopupMenuButton<String>(
                  onSelected: (value) {
                    switch (value) {
                      case 'message':
                      // Handle message
                        break;
                      case 'unfriend':
                      // Handle unfriend
                        break;
                      case 'block':
                      // Handle block
                        break;
                    }
                  },
                  itemBuilder: (context) => [
                    const PopupMenuItem(
                      value: 'message',
                      child: Text('Send Message'),
                    ),
                    const PopupMenuItem(
                      value: 'unfriend',
                      child: Text('Unfriend'),
                    ),
                    const PopupMenuItem(
                      value: 'block',
                      child: Text('Block'),
                    ),
                  ],
                ),
              ],
            ),
            onTap: () {
              // Handle friend profile tap
              // Navigator.pushNamed(context, '/profile', arguments: friend['id']);
            },
          );
        },
      ),
    );
  }
}
