import 'package:dartz/dartz.dart';
import 'package:saianati_app/src/domain/entities/user_entity.dart';
import 'package:saianati_app/src/domain/repositories/auth_repository.dart';

// حالة استخدام تسجيل الدخول
class LoginUser {
  final AuthRepository repository;

  LoginUser({required this.repository});

  Future<Either<AuthFailure, UserEntity>> call({
    required String email,
    required String password,
  }) async {
    return await repository.loginWithEmailAndPassword(email, password);
  }
}