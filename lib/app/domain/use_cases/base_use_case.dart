import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/network/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}