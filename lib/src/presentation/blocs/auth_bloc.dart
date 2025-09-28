import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:saianati_app/src/domain/entities/user_entity.dart';
import 'package:saianati_app/src/domain/repositories/auth_repository.dart';
import 'package:saianati_app/src/domain/usecases/login_user.dart';

// أحداث الـ Bloc
abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class LoginEvent extends AuthEvent {
  final String email;
  final String password;

  const LoginEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}

class RegisterEvent extends AuthEvent {
  final String name;
  final String email;
  final String phone;
  final String password;
  final String userType;

  const RegisterEvent({
    required this.name,
    required this.email,
    required this.phone,
    required this.password,
    required this.userType,
  });

  @override
  List<Object> get props => [name, email, phone, password, userType];
}

class LogoutEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}

class CheckAuthEvent extends AuthEvent {
  @override
  List<Object> get props => [];
}

// حالات الـ Bloc
abstract class AuthState extends Equatable {
  const AuthState();
}

class AuthInitial extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthLoading extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthAuthenticated extends AuthState {
  final UserEntity user;

  const AuthAuthenticated({required this.user});

  @override
  List<Object> get props => [user];
}

class AuthUnauthenticated extends AuthState {
  @override
  List<Object> get props => [];
}

class AuthError extends AuthState {
  final String message;

  const AuthError({required this.message});

  @override
  List<Object> get props => [message];
}

// الـ Bloc الرئيسي للمصادقة
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUser loginUser;
  final AuthRepository authRepository;

  AuthBloc({
    required this.loginUser,
    required this.authRepository,
  }) : super(AuthInitial()) {
    on<LoginEvent>(_onLoginEvent);
    on<RegisterEvent>(_onRegisterEvent);
    on<LogoutEvent>(_onLogoutEvent);
    on<CheckAuthEvent>(_onCheckAuthEvent);
  }

  Future<void> _onLoginEvent(LoginEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    
    final result = await loginUser(
      email: event.email,
      password: event.password,
    );
    
    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (user) => emit(AuthAuthenticated(user: user)),
    );
  }

  Future<void> _onRegisterEvent(RegisterEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    
    final result = await authRepository.registerWithEmailAndPassword(
      event.name,
      event.email,
      event.phone,
      event.password,
      event.userType,
    );
    
    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (user) => emit(AuthAuthenticated(user: user)),
    );
  }

  Future<void> _onLogoutEvent(LogoutEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    
    final result = await authRepository.logout();
    
    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (_) => emit(AuthUnauthenticated()),
    );
  }

  Future<void> _onCheckAuthEvent(CheckAuthEvent event, Emitter<AuthState> emit) async {
    emit(AuthLoading());
    
    final result = await authRepository.getCurrentUser();
    
    result.fold(
      (failure) => emit(AuthError(message: failure.message)),
      (user) {
        if (user != null) {
          emit(AuthAuthenticated(user: user));
        } else {
          emit(AuthUnauthenticated());
        }
      },
    );
  }
}