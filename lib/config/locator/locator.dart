import 'package:get_it/get_it.dart';
import 'package:outtappxperience/features/home/data/data_source/data_source.dart';
import 'package:outtappxperience/features/home/data/repository/bank_repo_impl.dart';
import 'package:outtappxperience/features/home/domain/usecases/get_bank_use_case.dart';
import 'package:outtappxperience/features/home/domain/usecases/verify_account_use_case.dart';
final locator = GetIt.instance;

void setup() {
  locator.registerLazySingleton(() => BankDataSource());
  locator.registerLazySingleton(() => BankRepositoryImpl());
  locator.registerLazySingleton(() => GetBankUseCase());
  locator.registerLazySingleton(() => VerifyAccountUseCase());
}