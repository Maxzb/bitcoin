part of 'crypto_list_bloc.dart';

class CryptoListState {}

class CryptoListInitial extends CryptoListState {}

// Отображение Лоадера
class CryptoListLoading extends CryptoListState {} // не используется

// Данные загружены
class CryptoListLoaded extends CryptoListState {
  final List<User> coinsListData;

  CryptoListLoaded({required this.coinsListData});
}

class CryptoListLoadingFailure extends CryptoListState {
  CryptoListLoadingFailure({this.exception});

  final Object? exception;
}
