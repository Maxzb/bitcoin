import 'package:bitcoin/features/crypto_list/service/service.dart';
import 'package:bitcoin/model/user.dart';
// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';

part 'crypto_list_event.dart';
part 'crypto_list_state.dart';

class CryptoListBloc extends Bloc<CryptoListEvent, CryptoListState> {
  CryptoListBloc() : super(CryptoListInitial()) {
    on<LoadCryptoListEvent>((event, emit) async {
      try {
        final coinsListData = await loadUsers();
        emit(CryptoListLoaded(coinsListData: coinsListData));
      } catch (err) {
        emit(CryptoListLoadingFailure(exception: err));
      }
    });
  }
}
