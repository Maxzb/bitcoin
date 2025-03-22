part of 'crypto_list_bloc.dart';

abstract class CryptoListState extends Equatable {}

class CryptoListInitial extends CryptoListState {
  @override
  List<Object?> get props => [];
}

// Отображение Лоадера
class CryptoListLoading extends CryptoListState {
  @override
  List<Object?> get props => [];
} // не используется

// Данные загружены
class CryptoListLoaded extends CryptoListState {
  final List<User> coinsListData;

  CryptoListLoaded({required this.coinsListData});

  @override
  List<Object?> get props => [coinsListData];
}

class CryptoListLoadingFailure extends CryptoListState {
  CryptoListLoadingFailure({this.exception});

  final Object? exception;

  @override
  List<Object?> get props => [exception];
}
