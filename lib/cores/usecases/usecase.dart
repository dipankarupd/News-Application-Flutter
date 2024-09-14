// create a generic usecase
// have two generics where we should define success type and the parameters
import 'package:fpdart/fpdart.dart';
import 'package:news_app/cores/failures/failure.dart';

abstract interface class UseCase<SuccessType, Parameters> {
  Future<Either<Failure, SuccessType>> call(Parameters params);
}

// create a general class NoParams if in case we need not add any parameters
class NoParams {}
