import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;
import 'package:outtappxperience/core/utils/http/exceptions/server_exception.dart';

class BankDataSource {
  Future<Either<ServerException, Map<String, dynamic>>> getBanks() async {
    try {
      http.Response? response;

      response = await http
          .get(
            Uri.parse('https://api.paystack.co/bank?country=nigeria'),
          )
          .timeout(
            const Duration(seconds: 30),
          );
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        return Right(data);
      } else {
        return Left(
          ServerException(
            message: data['message'],
            code: response.statusCode.toString(),
          ),
        );
      }
    } catch (error) {
      return Left(
        ServerException(
          message: 'Something went wrong',
          code: '500',
        ),
      );
    }
  }

  Future<Either<ServerException, Map<String, dynamic>>> verifyAccount(
      {required String accountNumber, required String code}) async {
    try {
      http.Response? response;
      final body = json.encode({
        "account_number": accountNumber,
        "bank_code": code,
      });

      response = await http
          .post(
            Uri.parse('https://verifyaccountnumber-7l2bkb353q-uc.a.run.app'),
            headers: {
              'Content-Type': 'application/json',
            },
            body: body,
          )
          .timeout(
            const Duration(seconds: 30),
          );
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        return Right(data);
      } else {
        return Left(
          ServerException(
            message: data['message'],
            code: response.statusCode.toString(),
          ),
        );
      }
    } catch (error) {
      return Left(
        ServerException(
          message: 'Something went wrong',
          code: '500',
        ),
      );
    }
  }
}
