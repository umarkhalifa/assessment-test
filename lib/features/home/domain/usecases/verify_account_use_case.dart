import 'package:outtappxperience/config/locator/locator.dart';
import 'package:outtappxperience/core/utils/http/exceptions/server_exception.dart';
import 'package:outtappxperience/core/utils/usecase/usecase.dart';
import 'package:dartz/dartz.dart';
import 'package:outtappxperience/features/home/data/model/account.dart';
import 'package:outtappxperience/features/home/data/repository/bank_repo_impl.dart';
import 'package:outtappxperience/features/home/domain/repository/bank_repository.dart';

class VerifyAccountUseCase implements UseCase<Map<String,Account>,dynamic>{
  final BankRepository _bankRepository = locator<BankRepositoryImpl>();

  @override
  Future<Either<ServerException, Account>> call(Map<String,dynamic> params) async{
    return await _bankRepository.verifyAccount(accountNumber: params['number'], code: params['code']);
  }

}