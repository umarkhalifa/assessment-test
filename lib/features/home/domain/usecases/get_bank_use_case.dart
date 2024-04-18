import 'package:outtappxperience/config/locator/locator.dart';
import 'package:outtappxperience/core/utils/http/exceptions/server_exception.dart';
import 'package:outtappxperience/core/utils/usecase/usecase.dart';
import 'package:outtappxperience/features/home/data/model/bank.dart';
import 'package:dartz/dartz.dart';
import 'package:outtappxperience/features/home/data/repository/bank_repo_impl.dart';
import 'package:outtappxperience/features/home/domain/repository/bank_repository.dart';

class GetBankUseCase implements UseCase<void, List<Bank>> {
  final BankRepository _bankRepository = locator<BankRepositoryImpl>();

  @override
  Future<Either<ServerException, List<Bank>>> call(void params) async {
    return await _bankRepository.getBanks();
  }
}
