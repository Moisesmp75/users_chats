import 'package:flutter/material.dart';
import 'package:users_app/models/user.dart';
import 'package:users_app/services/api_service.dart';

class UserProvider with ChangeNotifier {
  final ApiService _apiService = ApiService();
  Future<List<User>>? _usersFuture;

  Future<List<User>> get users {
    _usersFuture ??= _apiService.fetchUsers();
    return _usersFuture!;
  }
}