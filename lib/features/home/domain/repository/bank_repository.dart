import 'package:dartz/dartz.dart';
import 'package:outtappxperience/core/utils/http/exceptions/server_exception.dart';
import 'package:outtappxperience/features/home/data/model/account.dart';
import 'package:outtappxperience/features/home/data/model/bank.dart';

abstract class BankRepository {
  Future<Either<ServerException, List<Bank>>> getBanks();

  Future<Either<ServerException, Account>> verifyAccount(
      {required String accountNumber, required String code});
}
