import 'package:dartz/dartz.dart';
import 'package:saianati_app/src/domain/entities/user_entity.dart';

// أنواع الأخطاء
abstract class AuthFailure {
  final String message;
  const AuthFailure(this.message);
}

class NetworkFailure extends AuthFailure {
  const NetworkFailure() : super('خطأ في الاتصال بالإنترنت');
}

class ServerFailure extends AuthFailure {
  const ServerFailure() : super('خطأ في الخادم');
}

class InvalidCredentialsFailure extends AuthFailure {
  const InvalidCredentialsFailure() : super('بيانات الدخول غير صحيحة');
}

class EmailAlreadyExistsFailure extends AuthFailure {
  const EmailAlreadyExistsFailure() : super('البريد الإلكتروني مستخدم بالفعل');
}

// واجهة مستودع المصادقة
abstract class AuthRepository {
  // تسجيل الدخول
  Future<Either<AuthFailure, UserEntity>> loginWithEmailAndPassword(
    String email, 
    String password
  );
  
  // إنشاء حساب جديد
  Future<Either<AuthFailure, UserEntity>> registerWithEmailAndPassword(
    String name,
    String email,
    String phone,
    String password,
    String userType,
  );
  
  // تسجيل الدخول برقم الهاتف
  Future<Either<AuthFailure, String>> loginWithPhone(String phone);
  
  // التحقق من كود الهاتف
  Future<Either<AuthFailure, UserEntity>> verifyPhoneCode(
    String verificationId, 
    String code
  );
  
  // تسجيل الخروج
  Future<Either<AuthFailure, Unit>> logout();
  
  // إعادة تعيين كلمة المرور
  Future<Either<AuthFailure, Unit>> resetPassword(String email);
  
  // التحقق من حالة المصادقة
  Future<Either<AuthFailure, UserEntity?>> getCurrentUser();
  
  // تحديث الملف الشخصي
  Future<Either<AuthFailure, Unit>> updateProfile(
    String name, 
    String phone, 
    String? avatar
  );
  
  // تحديث كلمة المرور
  Future<Either<AuthFailure, Unit>> updatePassword(
    String oldPassword, 
    String newPassword
  );
}