import 'package:dartz/dartz.dart';

import '/core/error/failure.dart';

abstract class UseCaseBase<T> {
  Future<Either<Failure, T>> call();
}
