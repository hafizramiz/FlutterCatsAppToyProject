import 'package:cat_app_toy_project/core/either.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/use_cases/fetch_cats.dart';
import 'cats_state.dart';

/// Burasi data holder olarak gecer.Artik presentation katmanina gelmis oluruz.
/// Burda cubit ile state management yapilir. Use case kullanilarak istek atilacak.
/// Ayrica bunlarin hepsi constructor injecttion metotu ile yapilir.
/// Burda get it dependency injection kullanilir.

class CatsCubit extends Cubit<CatsState> {
  CatsCubit(this.fetchCats) : super(CatsInitial());

  final FetchCats fetchCats;

  void getCats() async {
    emit(CatsInProgress());
    /// FetchCats use case'i kullanilarak cats listesi getirilir.
    final Either result = await fetchCats();
    /// Getirilen result aslinda bir Either tipindedir.
    /// Burda yapilmasi gereken result'un tipine gore state degistirme islemi yapmaktir.
    /// Eger result icinde
    print(result);
    // result.when(
    //   errorFunction: (failure) {
    //     print("error function");
    //     emit(CatsFailure(failure.error));
    //   } ,
    //   successFunction: (users) {
    //     print("success function");
    //     emit(CatsSuccess(users));
    //   },
    // );

    if (result is Error) {
      emit(CatsFailure("failure.error"));
    } else if (result is Success) {
      emit(CatsSuccess(result.getSuccess()));
    }


  }
}
