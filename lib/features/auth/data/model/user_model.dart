import 'package:supabase_studying/features/auth/domain/entities/user.dart';

class UserModel extends User {
  UserModel({
    required super.id,
    required super.email,
    required super.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> e) {
    return UserModel(
      id: e['id'] ?? '',
      email: e['email'] ?? '',
      name: e['name'] ?? '',
    );
  }
}
