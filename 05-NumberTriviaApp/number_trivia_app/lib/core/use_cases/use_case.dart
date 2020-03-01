import 'package:dartz/dartz.dart';
import 'package:numbertriviaapp/core/error/failure.dart';

abstract class UseCase<Type, Params> {
  UseCase();

  Future<Either<Failure, Type>> call(Params params);
}