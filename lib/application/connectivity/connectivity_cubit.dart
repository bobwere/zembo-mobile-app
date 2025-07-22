import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:simple_connection_checker/simple_connection_checker.dart';

part 'connectivity_cubit.freezed.dart';
part 'connectivity_state.dart';

@injectable
class ConnectivityCubit extends Cubit<ConnectivityState> {
  ConnectivityCubit(this._connectivtiy) : super(ConnectivityState.initial());

  final SimpleConnectionChecker _connectivtiy;

  StreamSubscription<bool>? subscription;

  Future<void> checkConnectivity() async {
    subscription = _connectivtiy.onConnectionChange.listen((connected) {
      emit(state.copyWith.call(isConnected: connected));
    });
  }

  @override
  Future<void> close() {
    subscription?.cancel();
    return super.close();
  }
}
