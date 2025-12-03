import 'package:equatable/equatable.dart';

/// User entity representing the authenticated user.
class User extends Equatable {
  final String id;
  final String phoneNumber;
  final String name;
  final DateTime createdAt;

  const User({
    required this.id,
    required this.phoneNumber,
    required this.name,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [id, phoneNumber, name, createdAt];

  User copyWith({
    String? id,
    String? phoneNumber,
    String? name,
    DateTime? createdAt,
  }) {
    return User(
      id: id ?? this.id,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      name: name ?? this.name,
      createdAt: createdAt ?? this.createdAt,
    );
  }
}
