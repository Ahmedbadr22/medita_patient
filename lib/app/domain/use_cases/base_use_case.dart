import 'package:dartz/dartz.dart';
import 'package:medita_patient/app/data/models/failure.dart';

abstract class BaseUseCase<In, Out> {
  Future<Either<Failure, Out>> execute(In input);
}