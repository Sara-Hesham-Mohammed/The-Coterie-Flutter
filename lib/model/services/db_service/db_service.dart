import 'dart:convert';
import 'dart:developer';

import 'package:http/http.dart' as http;
import '../../../utils/constants.dart';
import '../../entities/User.dart';
import '../../entities/Event.dart';


class DBResponse<T> {
  final bool success;
  final T? data;
  final String? error;
  final int? statusCode;

  DBResponse({
    required this.success,
    this.data,
    this.error,
    this.statusCode,
  });

  factory DBResponse.success(T data, {int? statusCode}) {
    return DBResponse(
      success: true,
      data: data,
      statusCode: statusCode,
    );
  }

  factory DBResponse.error(String error, {int? statusCode}) {
    return DBResponse(
      success: false,
      error: error,
      statusCode: statusCode,
    );
  }
}

class DBService {
  final String baseUrl =DB_ENDPOINT;

  // Add URL validation method
  Future<bool> validateConnection() async {
    try {
      print('Testing connection to: $baseUrl');
      final response = await http.get(Uri.parse(baseUrl));
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');
      return response.statusCode == 200;
    } catch (e) {
      print('Connection error: $e');
      return false;
    }
  }

  // User CRUD Operations
  Future<DBResponse<User?>> getUserById(int userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/users/$userId'),
      );
      
      if (response.statusCode == 200) {
        return DBResponse.success(
          User.fromJson(jsonDecode(response.body)),
          statusCode: response.statusCode,
        );
      }
      return DBResponse.error(
        'Failed to get user: ${response.statusCode}',
        statusCode: response.statusCode,
      );
    } catch (e) {
      log('Error getting user: $e');
      return DBResponse.error('Error getting user: $e');
    }
  }

  Future<DBResponse<List<User>>> getAllUsers() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/all-users'),
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> usersJson = jsonDecode(response.body);
        return DBResponse.success(
          usersJson.map((json) => User.fromJson(json)).toList(),
          statusCode: response.statusCode,
        );
      }
      return DBResponse.error(
        'Failed to get users: ${response.statusCode}',
        statusCode: response.statusCode,
      );
    } catch (e) {
      log('Error getting all users: $e');
      return DBResponse.error('Error getting all users: $e');
    }
  }

  Future<DBResponse<bool>> createUser(User user) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/users'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'id': user.userID,
          'name': user.name,
          'country': user.countryOfOrigin,
          'age': DateTime.now().year - user.dateOfBirth.year,
        }),
      );
      
      if (response.statusCode == 201) {
        return DBResponse.success(true, statusCode: response.statusCode);
      }
      return DBResponse.error(
        'Failed to create user: ${response.statusCode}',
        statusCode: response.statusCode,
      );
    } catch (e) {
      log('Error creating user: $e');
      return DBResponse.error('Error creating user: $e');
    }
  }

  Future<DBResponse<bool>> deleteUser(int userId) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/users/$userId'),
      );
      
      if (response.statusCode == 200) {
        return DBResponse.success(true, statusCode: response.statusCode);
      }
      return DBResponse.error(
        'Failed to delete user: ${response.statusCode}',
        statusCode: response.statusCode,
      );
    } catch (e) {
      log('Error deleting user: $e');
      return DBResponse.error('Error deleting user: $e');
    }
  }

  // Event CRUD Operations
  Future<DBResponse<Event?>> getEventById(int eventId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/events/$eventId'),
      );
      
      if (response.statusCode == 200) {
        return DBResponse.success(
          Event.fromJson(jsonDecode(response.body)),
          statusCode: response.statusCode,
        );
      }
      return DBResponse.error(
        'Failed to get event: ${response.statusCode}',
        statusCode: response.statusCode,
      );
    } catch (e) {
      log('Error getting event: $e');
      return DBResponse.error('Error getting event: $e');
    }
  }

  Future<DBResponse<List<Event>>> getAllEvents() async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/events'),
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> eventsJson = jsonDecode(response.body);
        return DBResponse.success(
          eventsJson.map((json) => Event.fromJson(json)).toList(),
          statusCode: response.statusCode,
        );
      }
      return DBResponse.error(
        'Failed to get events: ${response.statusCode}',
        statusCode: response.statusCode,
      );
    } catch (e) {
      log('Error getting all events: $e');
      return DBResponse.error('Error getting all events: $e');
    }
  }

  Future<DBResponse<bool>> createEvent(Event event) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/events'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'id': event.id,
          'name': event.name,
          'location': event.location,
          'date': event.startDate?.toIso8601String(),
          'description': event.description,
        }),
      );
      
      if (response.statusCode == 201) {
        return DBResponse.success(true, statusCode: response.statusCode);
      }
      return DBResponse.error(
        'Failed to create event: ${response.statusCode}',
        statusCode: response.statusCode,
      );
    } catch (e) {
      log('Error creating event: $e');
      return DBResponse.error('Error creating event: $e');
    }
  }

  Future<DBResponse<bool>> deleteEvent(int eventId) async {
    try {
      final response = await http.delete(
        Uri.parse('$baseUrl/events/$eventId'),
      );
      
      if (response.statusCode == 200) {
        return DBResponse.success(true, statusCode: response.statusCode);
      }
      return DBResponse.error(
        'Failed to delete event: ${response.statusCode}',
        statusCode: response.statusCode,
      );
    } catch (e) {
      log('Error deleting event: $e');
      return DBResponse.error('Error deleting event: $e');
    }
  }

  // Relationship Operations
  Future<DBResponse<bool>> createFriendship(int user1Id, int user2Id) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/friendship'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'user1Id': user1Id,
          'user2Id': user2Id,
        }),
      );
      
      if (response.statusCode == 200) {
        return DBResponse.success(true, statusCode: response.statusCode);
      }
      return DBResponse.error(
        'Failed to create friendship: ${response.statusCode}',
        statusCode: response.statusCode,
      );
    } catch (e) {
      log('Error creating friendship: $e');
      return DBResponse.error('Error creating friendship: $e');
    }
  }

  Future<DBResponse<bool>> attendEvent(int userId, int eventId) async {
    try {
      final response = await http.post(
        Uri.parse('$baseUrl/attend'),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode({
          'userId': userId,
          'eventId': eventId,
        }),
      );
      
      if (response.statusCode == 200) {
        return DBResponse.success(true, statusCode: response.statusCode);
      }
      return DBResponse.error(
        'Failed to attend event: ${response.statusCode}',
        statusCode: response.statusCode,
      );
    } catch (e) {
      log('Error attending event: $e');
      return DBResponse.error('Error attending event: $e');
    }
  }

  Future<DBResponse<List<User>>> getFriendsOfFriends(int userId) async {
    try {
      final response = await http.get(
        Uri.parse('$baseUrl/friends-of-friends/$userId'),
      );
      
      if (response.statusCode == 200) {
        final List<dynamic> usersJson = jsonDecode(response.body);
        return DBResponse.success(
          usersJson.map((json) => User.fromJson(json)).toList(),
          statusCode: response.statusCode,
        );
      }
      return DBResponse.error(
        'Failed to get friends of friends: ${response.statusCode}',
        statusCode: response.statusCode,
      );
    } catch (e) {
      log('Error getting friends of friends: $e');
      return DBResponse.error('Error getting friends of friends: $e');
    }
  }
}

void main() async {
  final dbService = DBService();
  
  print('Testing DB Service...\n');

  // First test the connection
  print('Testing connection to backend:');
  final isConnected = await dbService.validateConnection();
  if (!isConnected) {
    print('Failed to connect to backend. Please check:');
    print('1. Is the backend server running?');
    print('2. Is the DB_ENDPOINT correct in constants.dart?');
    print('3. Are there any CORS issues?');
    return;
  }
  print('Successfully connected to backend!\n');

  // Test getting all users
  print('Testing getAllUsers:');
  final usersResponse = await dbService.getAllUsers();
  if (usersResponse.success) {
    print('Success! Found ${usersResponse.data?.length} users');
    usersResponse.data?.forEach((user) {
      print('- ${user.name} (ID: ${user.userID})');
    });
  } else {
    print('Failed to get users: ${usersResponse.error}');
    print('Status code: ${usersResponse.statusCode}');
  }
  print('\n');

  // Test creating a user
  print('Testing createUser:');
  final testUser = User(
    userID: 1,
    name: 'Test User',
    dateOfBirth: DateTime(2000),
    gender: 'male',
    address: 'Test Address',
    phoneNumber: '1234567890',
    email: 'test@example.com',
    languages: ['English'],
    countryOfOrigin: 'USA', tags: {},
  );
  final createUserResponse = await dbService.createUser(testUser);
  if (createUserResponse.success) {
    print('Successfully created test user');
  } else {
    print('Failed to create user: ${createUserResponse.error}');
    print('Status code: ${createUserResponse.statusCode}');
  }
  print('\n');
}
