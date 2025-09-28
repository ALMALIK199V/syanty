class UserModel {
  final String id;
  final String name;
  final String email;
  final String phone;
  final String userType;
  final double walletBalance;
  final int points;
  final String? address;
  final DateTime joinDate;

  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phone,
    required this.userType,
    this.walletBalance = 0.0,
    this.points = 0,
    this.address,
    required this.joinDate,
  });

  UserModel copyWith({
    String? name,
    String? email,
    String? phone,
    double? walletBalance,
    int? points,
    String? address,
  }) {
    return UserModel(
      id: id,
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      userType: userType,
      walletBalance: walletBalance ?? this.walletBalance,
      points: points ?? this.points,
      address: address ?? this.address,
      joinDate: joinDate,
    );
  }
}