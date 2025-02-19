// import 'package:bitcoin/features/crypto_list/model/abstract_user.dart';
import 'package:bitcoin/features/crypto_list/service/service.dart';
import 'package:bitcoin/features/crypto_list/model/user.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc() : super(CryptoListInitial()) {
    on<LoadCryptoListEvent>((event, emit) async {
      try {
        final coinsListData = await UsersRepository().loadUsers();
        emit(CryptoListLoaded(coinsListData: coinsListData));
      } catch (err) {
        emit(CryptoListLoadingFailure(exception: err));
      }
    });
  }
}
