import 'package:get_it/get_it.dart';
import 'package:saianati_app/src/data/datasources/firebase_datasource.dart';
import 'package:saianati_app/src/data/repositories/auth_repository_impl.dart';
import 'package:saianati_app/src/domain/repositories/auth_repository.dart';
import 'package:saianati_app/src/domain/usecases/login_user.dart';
import 'package:saianati_app/src/presentation/blocs/auth_bloc.dart';

final getIt = GetIt.instance;

Future<void> setupDependencyInjection() async {
  // Data Sources
  getIt.registerLazySingleton<FirebaseDataSource>(() => FirebaseDataSource());
  
  // Repositories
  getIt.registerLazySingleton<AuthRepository>(
    () => AuthRepositoryImpl(dataSource: getIt<FirebaseDataSource>()),
  );
  
  // Use Cases
  getIt.registerLazySingleton<LoginUser>(
    () => LoginUser(repository: getIt<AuthRepository>()),
  );
  
  // Blocs
  getIt.registerFactory<AuthBloc>(
    () => AuthBloc(
      loginUser: getIt<LoginUser>(),
      authRepository: getIt<AuthRepository>(),
    ),
  );
}