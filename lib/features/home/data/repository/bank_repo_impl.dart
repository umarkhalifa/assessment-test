
import 'dart:developer';

import 'package:dartz/dartz.dart';
import 'package:outtappxperience/config/locator/locator.dart';
import 'package:outtappxperience/core/utils/http/exceptions/server_exception.dart';
import 'package:outtappxperience/features/home/data/data_source/data_source.dart';
import 'package:outtappxperience/features/home/data/model/account.dart';
import 'package:outtappxperience/features/home/data/model/bank.dart';
import 'package:outtappxperience/features/home/domain/repository/bank_repository.dart';

class BankRepositoryImpl implements BankRepository {
  final BankDataSource bankDataSource = locator<BankDataSource>();


  @override
  Future<Either<ServerException, List<Bank>>> getBanks() async {
    final data = await bankDataSource.getBanks();
    return data.fold((l) => Left(l), (r) {
      log(r.toString());
      List<Bank> banks = [];
      for(var element in r['data']){
        banks.add(Bank.fromMap(element));
      }
      return Right(banks);
    });
  }

  @override
  Future<Either<ServerException, Account>> verifyAccount({required String accountNumber, required String code}) async{
    final data = await bankDataSource.verifyAccount(accountNumber: accountNumber, code: code);
    return data.fold((l) => Left(l), (r) {
      log(r.toString());
      return Right(Account.fromMap(r['data']));
    });
  }
}
