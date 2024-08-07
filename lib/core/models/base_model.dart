import 'package:equatable/equatable.dart';

/// Butun Network modelleri base modelden extend edilir
abstract class BaseModel<T> extends Equatable {
  const BaseModel();

  Map<String, dynamic> toJson();

  T fromJson(dynamic json);
}
