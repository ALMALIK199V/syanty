import 'package:dartz/dartz.dart';
import 'package:saianati_app/src/data/models/user_model.dart';
import 'package:saianati_app/src/domain/entities/user_entity.dart';
import 'package:saianati_app/src/domain/repositories/auth_repository.dart';

// تنفيذ مستودع المصادقة
class AuthRepositoryImpl implements AuthRepository {
  final AuthDataSource dataSource;

  AuthRepositoryImpl({required this.dataSource});

  @override
  Future<Either<AuthFailure, UserEntity>> loginWithEmailAndPassword(
    String email, String password) async {
    try {
      final userModel = await dataSource.loginWithEmailAndPassword(email, password);
      return Right(_mapModelToEntity(userModel));
    } on NetworkException {
      return Left(NetworkFailure());
    } on ServerException {
      return Left(ServerFailure());
    } on InvalidCredentialsException {
      return Left(InvalidCredentialsFailure());
    }
  }

  @override
  Future<Either<AuthFailure, UserEntity>> registerWithEmailAndPassword(
    String name, String email, String phone, String password, String userType) async {
    try {
      final userModel = await dataSource.registerWithEmailAndPassword(
        name, email, phone, password, userType);
      return Right(_mapModelToEntity(userModel));
    } on NetworkException {
      return Left(NetworkFailure());
    } on ServerException {
      return Left(ServerFailure());
    } on EmailAlreadyExistsException {
      return Left(EmailAlreadyExistsFailure());
    }
  }

  @override
  Future<Either<AuthFailure, String>> loginWithPhone(String phone) async {
    try {
      final verificationId = await dataSource.loginWithPhone(phone);
      return Right(verificationId);
    } on NetworkException {
      return Left(NetworkFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<AuthFailure, UserEntity>> verifyPhoneCode(
    String verificationId, String code) async {
    try {
      final userModel = await dataSource.verifyPhoneCode(verificationId, code);
      return Right(_mapModelToEntity(userModel));
    } on NetworkException {
      return Left(NetworkFailure());
    } on ServerException {
      return Left(ServerFailure());
    } on InvalidCredentialsException {
      return Left(InvalidCredentialsFailure());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> logout() async {
    try {
      await dataSource.logout();
      return const Right(unit);
    } on NetworkException {
      return Left(NetworkFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> resetPassword(String email) async {
    try {
      await dataSource.resetPassword(email);
      return const Right(unit);
    } on NetworkException {
      return Left(NetworkFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<AuthFailure, UserEntity?>> getCurrentUser() async {
    try {
      final userModel = await dataSource.getCurrentUser();
      return Right(userModel != null ? _mapModelToEntity(userModel) : null);
    } on NetworkException {
      return Left(NetworkFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> updateProfile(
    String name, String phone, String? avatar) async {
    try {
      await dataSource.updateProfile(name, phone, avatar);
      return const Right(unit);
    } on NetworkException {
      return Left(NetworkFailure());
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<AuthFailure, Unit>> updatePassword(
    String oldPassword, String newPassword) async {
    try {
      await dataSource.updatePassword(oldPassword, newPassword);
      return const Right(unit);
    } on NetworkException {
      return Left(NetworkFailure());
    } on ServerException {
      return Left(ServerFailure());
    } on InvalidCredentialsException {
      return Left(InvalidCredentialsFailure());
    }
  }

  // تحويل UserModel إلى UserEntity
  UserEntity _mapModelToEntity(UserModel model) {
    return UserEntity(
      id: model.id,
      name: model.name,
      email: model.email,
      phone: model.phone,
      type: model.type.toString(),
      avatar: model.avatar,
      walletBalance: model.walletBalance,
      points: model.points,
      joinedAt: model.joinedAt,
      isActive: model.isActive,
    );
  }
}

// استثناءات مصدر البيانات
class NetworkException implements Exception {}
class ServerException implements Exception {}
class InvalidCredentialsException implements Exception {}
class EmailAlreadyExistsException implements Exception {}