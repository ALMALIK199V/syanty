import 'package:saianati_app/src/data/models/user_model.dart';

// مصدر بيانات تجريبي للتجربة
class MockDataSource {
  // مستخدمين تجريبيين للاختبار
  final List<UserModel> _mockUsers = [
    UserModel(
      id: '1',
      name: 'عميل تجريبي',
      email: 'test@test.com',
      phone: '07701234567',
      type: UserType.customer,
      joinedAt: DateTime.now(),
      walletBalance: 100000,
      points: 100,
      isActive: true,
    ),
    UserModel(
      id: '2',
      name: 'فني تجريبي',
      email: 'tech@test.com',
      phone: '07707654321',
      type: UserType.technician,
      joinedAt: DateTime.now(),
      walletBalance: 50000,
      points: 50,
      isActive: true,
    ),
  ];

  Future<UserModel> loginWithEmailAndPassword(String email, String password) async {
    // محاكاة التأخير الشبكي
    await Future.delayed(const Duration(seconds: 2));
    
    // البحث عن المستخدم
    final user = _mockUsers.firstWhere(
      (user) => user.email == email,
      orElse: () => throw Exception('المستخدم غير موجود'),
    );
    
    // كلمة المرور التجريبية: 123456
    if (password != '123456') {
      throw Exception('كلمة المرور غير صحيحة');
    }
    
    return user;
  }

  Future<UserModel> registerWithEmailAndPassword(
    String name, String email, String phone, String password, String userType) async {
    
    await Future.delayed(const Duration(seconds: 2));
    
    // إنشاء مستخدم جديد
    final newUser = UserModel(
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      name: name,
      email: email,
      phone: phone,
      type: UserType.customer, // دائماً عميل للتسجيل
      joinedAt: DateTime.now(),
      walletBalance: 0,
      points: 0,
      isActive: true,
    );
    
    _mockUsers.add(newUser);
    return newUser;
  }
}