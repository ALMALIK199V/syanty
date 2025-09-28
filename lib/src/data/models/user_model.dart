import 'package:equatable/equatable.dart';

// أنواع المستخدمين
enum UserType { 
  customer,    // عميل
  technician,  // فني
  admin,       // مدير
  accountant,  // محاسب
  delivery     // مندوب توصيل
}

// نموذج بيانات المستخدم
class UserModel extends Equatable {
  final String id;
  final String name;
  final String email;
  final String phone;
  final UserType type;
  final String? avatar;
  final double walletBalance;
  final int points;
  final DateTime joinedAt;
  final bool isActive;
  final String? fcmToken;
  final String? address;
  final double? rating;
  final int? completedRequests;

  const UserModel({
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
    this.fcmToken,
    this.address,
    this.rating,
    this.completedRequests,
  });

  // تحويل من Map إلى UserModel
  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      phone: map['phone'] ?? '',
      type: _parseUserType(map['type']),
      avatar: map['avatar'],
      walletBalance: (map['walletBalance'] ?? 0).toDouble(),
      points: map['points'] ?? 0,
      joinedAt: DateTime.parse(map['joinedAt']),
      isActive: map['isActive'] ?? true,
      fcmToken: map['fcmToken'],
      address: map['address'],
      rating: map['rating']?.toDouble(),
      completedRequests: map['completedRequests'],
    );
  }

  // تحويل UserModel إلى Map
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'phone': phone,
      'type': _userTypeToString(type),
      'avatar': avatar,
      'walletBalance': walletBalance,
      'points': points,
      'joinedAt': joinedAt.toIso8601String(),
      'isActive': isActive,
      'fcmToken': fcmToken,
      'address': address,
      'rating': rating,
      'completedRequests': completedRequests,
    };
  }

  // تحويل String إلى UserType
  static UserType _parseUserType(String type) {
    switch (type) {
      case 'technician': return UserType.technician;
      case 'admin': return UserType.admin;
      case 'accountant': return UserType.accountant;
      case 'delivery': return UserType.delivery;
      default: return UserType.customer;
    }
  }

  // تحويل UserType إلى String
  static String _userTypeToString(UserType type) {
    switch (type) {
      case UserType.technician: return 'technician';
      case UserType.admin: return 'admin';
      case UserType.accountant: return 'accountant';
      case UserType.delivery: return 'delivery';
      default: return 'customer';
    }
  }

  // نسخة جديدة مع تحديث بعض الحقول
  UserModel copyWith({
    String? name,
    String? email,
    String? phone,
    String? avatar,
    double? walletBalance,
    int? points,
    bool? isActive,
    String? fcmToken,
    String? address,
    double? rating,
    int? completedRequests,
  }) {
    return UserModel(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      type: type,
      avatar: avatar ?? this.avatar,
      walletBalance: walletBalance ?? this.walletBalance,
      points: points ?? this.points,
      joinedAt: joinedAt,
      isActive: isActive ?? this.isActive,
      fcmToken: fcmToken ?? this.fcmToken,
      address: address ?? this.address,
      rating: rating ?? this.rating,
      completedRequests: completedRequests ?? this.completedRequests,
    );
  }

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
    fcmToken,
    address,
    rating,
    completedRequests,
  ];
}