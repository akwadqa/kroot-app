import 'package:kroot_app/features/cards/data/data%20source/cards_remote_data_source.dart';
import 'package:kroot_app/src/network/services/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cards_repository.g.dart';

@Riverpod(keepAlive: true)
CardsRepository cardsRepository(Ref ref) {
  final networkService = ref.watch(networkServiceProvider());
  return CardsRepository(CardsRemoteDataSource(networkService));
}
class CardsRepository {
  final CardsRemoteDataSource _cardsRemoteDataSource;

  CardsRepository(this._cardsRemoteDataSource);
}