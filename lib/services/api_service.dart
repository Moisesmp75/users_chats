// services/api_service.dart
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:users_app/models/user.dart';

class ApiService {
  final String _baseUrl = "https://reqres.in/api/users";

  Future<List<User>> fetchUsers() async {
    final response = await http.get(
      Uri.parse(_baseUrl),
      headers: {
        'x-api-key': 'reqres-free-v1',
      },
    );

    if (response.statusCode != 200) throw Exception('Error fetching users');

    final data = jsonDecode(response.body);
    final List<dynamic> usersJson = data['data'];
    return usersJson.map((json) => User.fromJson(json)).toList();
  }
}
