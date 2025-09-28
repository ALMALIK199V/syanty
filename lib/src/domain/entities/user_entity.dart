import 'package:equatable/equatable.dart';

// كيان المستخدم (طبقة Domain)
class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String type;
  final String? avatar;
  final double walletBalance;
  final int points;
  final DateTime joinedAt;
  final bool isActive;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.type,
    this.avatar,
    this.walletBalance = 0,
    this.points = 0,
    required this.joinedAt,
    this.isActive = true,
  });

  @override
  List<Object?> get props => [
    id,
    name,
    email,
    phone,
    type,
    avatar,
    walletBalance,
    points,
    joinedAt,
    isActive,
  ];
}