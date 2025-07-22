part of 'connectivity_cubit.dart';

@freezed
abstract class ConnectivityState with _$ConnectivityState {
  factory ConnectivityState({
    bool? isConnected,
  }) = _ConnectivityState;

  factory ConnectivityState.initial() => ConnectivityState(isConnected: true);
}
