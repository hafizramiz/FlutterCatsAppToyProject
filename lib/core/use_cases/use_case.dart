import 'package:equatable/equatable.dart';

import '../either.dart';
import '../error/failure.dart';


/// Core katmanindaki use case'dir. Butun use case'ler bundan enxtend eder.
abstract class Usecase<T, Type, Params> {
  Future<Either<Failure<T>, Type>> call();
}
/// Type burda Success'i isaret etmektedir.

/// Burda Either Class'a bir bakalim
/// Either class normalde boyle bir classtir. abstract class Either<E, S>


class NoParams extends Equatable {
  @override
  List<Object?> get props => [];
}



/// Burda test ediyorum.
/// Iki farkli tipte parametre aliyorum. Birisi Failure digeri ise Success.
// abstract class Usecase<T, Type, Params> {
//   Future<Either<T, Type>> call();
//
//   /// call network istekleri atilan fonksiyondur.
// /// Call fonksiyonu Future doner. Future<Either donecem diyorsun> Either icinde de iki farkli parametere olacak.
// ///  Icinde iki farkli tipte parametere olur.
// ///  Diger Params network istegi atarken query parametresi vermek istersek onu belirtir.
// }