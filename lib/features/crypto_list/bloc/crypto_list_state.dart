part of 'crypto_list_bloc.dart';

class CryptoListState {}

class CryptoListInitial extends CryptoListState {}

class CryptoListLoading extends CryptoListState {} // не используется

class CryptoListLoaded extends CryptoListState {
  final List<User> coinsListData;

  CryptoListLoaded({required this.coinsListData});
}

class CryptoListLoadingFailure extends CryptoListState {
  CryptoListLoadingFailure({this.exception});

  final Object? exception;
}
