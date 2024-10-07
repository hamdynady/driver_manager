import 'package:driver_manager/core/services/database_service.dart';
import 'package:driver_manager/core/services/firebase_auth_service.dart';
import 'package:driver_manager/core/services/firestore_servicse.dart';
import 'package:driver_manager/features/auth/data/repo/auth_repo_imp.dart';
import 'package:driver_manager/features/auth/domain/repo/auth_repo.dart';
import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;
void setUpGetItService() {
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<DatabaseService>(FirestoreServicse());

  getIt.registerSingleton<AuthRepo>(
    AuthRepoImp(
        firebaseAuthService: getIt<FirebaseAuthService>(),
        databaseService: getIt<DatabaseService>()),
  );
}
