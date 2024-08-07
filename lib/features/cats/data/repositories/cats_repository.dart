import 'package:dio/dio.dart';

import '../../../../core/either.dart';
import '../../../../core/error/failure.dart';
import '../../../../shared/data/data_sources/data_holder/data_holder.dart';
import '../../../../shared/data/data_sources/remote/remote_data_source.dart';
import '../../domain/entities/cat.dart';
import '../../domain/repositories/cats_repository.dart';


class CatsRepositoryImpl implements CatsRepository {
  const CatsRepositoryImpl(this.dataSource, this.dataHolder);

  final RemoteDataSource dataSource;
  final DataHolder dataHolder;

  @override
  Future<Either<Failure<String>, List<Cat>>> getCats() async {
    try {
      if (!dataHolder.isDataFetched) {
        final result = await dataSource.fetchData();
        dataHolder.setData(result);
      }
      return Success(dataHolder.getCats()!);  /// Burdaki Success class'ı Either class'tan inherit almis classtir,
      /// Repository data source'dan beslenir. Data source'ta client ile istek yapmakla yukumludur.
      /// Burda Data source remote da olabilir. local da olabilir. Remote olursa dio client'i kullanilarak
      /// data source'dan veri cekilir.
      /// Eger client ile yapilan istekten donen sonuc basarili ise Success class'ı kullanilir.
    } on DioError catch (e) {
      /// Eger hataya duserse de Error class dondurulur.
      return Error(Failure.network(e.message));
    } catch (_) {
      /// Baska hataya duserse Error icinde farkli failure dondurulur.
      return const Error(Failure.other());
    }
  }
}
