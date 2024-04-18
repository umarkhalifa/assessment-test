import 'package:dartz/dartz.dart';
import 'package:outtappxperience/core/utils/http/exceptions/server_exception.dart';

abstract class UseCase<Params, Type>{
  Future<Either<ServerException,Type>> call(Params params);
}