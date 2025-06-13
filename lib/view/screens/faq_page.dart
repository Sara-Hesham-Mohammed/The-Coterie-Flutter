import 'package:flutter/material.dart';

class FAQScreen extends StatelessWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('FAQ'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          _buildFAQItem(
            'How do I create an account?',
            'To create an account, tap on the "Sign Up" button on the login screen and fill in your details.',
          ),
          _buildFAQItem(
            'How do I reset my password?',
            'You can reset your password by clicking on "Forgot Password" on the login screen and following the instructions sent to your email.',
          ),
          _buildFAQItem(
            'How do I connect with other users?',
            'Visit their profile and tap the "Connect" button to send a connection request.',
          ),
          _buildFAQItem(
            'How do I join activities?',
            'Browse available activities and tap "Join" on the ones you\'re interested in.',
          ),
          _buildFAQItem(
            'How do I report inappropriate content?',
            'Use the report button on any content or contact our support team directly.',
          ),
          _buildFAQItem(
            'How do I delete my account?',
            'Go to Settings > Account > Delete Account. Please note this action is irreversible.',
          ),
          _buildFAQItem(
            'How do I change my profile picture?',
            'Go to your profile, tap on your current profile picture, and select "Change Picture" to upload a new one.',
          ),
          _buildFAQItem(
            'Can I join multiple activities at once?',
            'Yes, you can join multiple activities as long as they don\'t conflict with each other in terms of time and date.',
          ),
        ],
      ),
    );
  }

  Widget _buildFAQItem(String question, String answer) {
    return Card(
      margin: const EdgeInsets.only(bottom: 12.0),
      elevation: 2,
      child: ExpansionTile(
        title: Text(
          question,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 16,
          ),
        ),
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              answer,
              style: const TextStyle(fontSize: 14),
            ),
          ),
        ],
      ),
    );
  }
}