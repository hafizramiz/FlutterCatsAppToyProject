import 'package:meta/meta.dart';

typedef OnError<E> = void Function(E error);
typedef OnSuccess<S> = void Function(S success);

/// Either class BaseResponse class'tir.
/// Bu class, iki tip veri donduren fonksiyonlar icin kullanilir.

@sealed
abstract class Either<E, S> {
  const Either();

  E? getError();

  S? getSuccess();

  bool isError();

  bool isSuccess();

  /// This pattern allows you to define different behaviors based on the current state.
  void when({
    required OnError<E> error,
    required void Function (S success) successFunction,
  });
}


/// Asagidaki buna benziyor aslinda:
class BaseResponse<T> {
  final T? data;
  final String? error;

  BaseResponse({this.data, this.error});
}



@immutable
class Success<E, S> implements Either<E, S> {
  /// Constructorda da Success verecegiz.
  const Success(this._success);

  /// Bursa S tipinde bir parametre alacak.
  final S _success;

  @override
  bool isError() => false;

  @override
  bool isSuccess() => true;

  @override
  E? getError() => null;

  @override
  S? getSuccess() => _success;

  /// Burda bir metot tanimladim. Eger Success'e duserse burdaki Success fonksiyonu calisacak. Aslinda cagirdigimizda
  /// yukardaki abstract classi vermis olacagiz. Eger ki success'e duserse successFunction calisacak.
  /// Yok Error'a duserse error calisacak.
  @override
  void when({
    required OnError<E> error,
    required void Function (S success) successFunction,
  }) {
    successFunction(_success);
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Success && other._success == _success;

  @override
  int get hashCode => _success.hashCode;
}

@immutable
class Error<E, S> implements Either<E, S> {
  const Error(this._error);

  final E _error;

  @override
  bool isError() => true;

  @override
  bool isSuccess() => false;

  @override
  E? getError() => _error;

  @override
  S? getSuccess() => null;

  @override
  void when({
    required OnError<E> error,
    required Function (S success) successFunction,
  }) {
    /// Burda da error function calisacak. Cunku class error class ve bu sinifin icine dustugu belli olacak.
    error(_error);
    /// Burda [successFunction] calistirmadik
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) || other is Error && other._error == _error;

  @override
  int get hashCode => _error.hashCode;
}



/// Burdaki Unit neden kullaniliyor bilmiyorum
@immutable
class Unit {
  const Unit._internal();

  @override
  String toString() => '()';
}

const unit = Unit._internal();



Future<Either> testEither() {
  final success = Success<String, int>(1);
  final error = Error<String, int>('error');

  success.when(
    error: (error) => print('error: $error'),
    successFunction: (success) => print('success: $success'),
  );

  error.when(
    error: (error) => print('error: $error'),
    successFunction: (success) => print('success: $success'),
  );

  /// Burda ben diyorum ki Either donecegim.Either da diyor ki bana
  /// Bana iki farkli tip vermelisin ki ben onlari almadan olusamam.
  return
}