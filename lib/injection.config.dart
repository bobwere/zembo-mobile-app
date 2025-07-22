// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:flutter_secure_storage/flutter_secure_storage.dart' as _i558;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:simple_connection_checker/simple_connection_checker.dart'
    as _i271;

import 'application/auth/auth_cubit.dart' as _i457;
import 'application/auth/i_auth_facade.dart' as _i485;
import 'application/connectivity/connectivity_cubit.dart' as _i199;
import 'application/notification/i_notification_facade.dart' as _i987;
import 'application/notification/notification_cubit.dart' as _i478;
import 'application/shift/i_shift_facade.dart' as _i833;
import 'application/shift/shift_cubit.dart' as _i992;
import 'core/injectable/http_module.dart' as _i225;
import 'core/injectable/utility_module.dart' as _i959;
import 'infrastructure/auth/auth_facade.dart' as _i480;
import 'infrastructure/notification/notification_facade.dart' as _i459;
import 'infrastructure/shift/shift_facade.dart' as _i397;

const String _staging = 'staging';
const String _dev = 'dev';
const String _prod = 'prod';

// initializes the registration of main-scope dependencies inside of GetIt
_i174.GetIt init(
  _i174.GetIt getIt, {
  String? environment,
  _i526.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i526.GetItHelper(getIt, environment, environmentFilter);
  final utilityModule = _$UtilityModule();
  final dioModule = _$DioModule();
  gh.lazySingleton<_i271.SimpleConnectionChecker>(
    () => utilityModule.simpleConnectionChecker,
  );
  gh.lazySingleton<_i558.FlutterSecureStorage>(
    () => utilityModule.flutterSecureStorage,
  );
  gh.factory<String>(
    () => dioModule.provideStagingBaseUrl(),
    instanceName: 'STAGING_SERVER_URL',
    registerFor: {_staging},
  );
  gh.factory<String>(
    () => dioModule.provideDevBaseUrl(),
    instanceName: 'DEV_SERVER_URL',
    registerFor: {_dev},
  );
  gh.factory<_i199.ConnectivityCubit>(
    () => _i199.ConnectivityCubit(gh<_i271.SimpleConnectionChecker>()),
  );
  gh.factory<String>(
    () => dioModule.provideProdBaseUrl(),
    instanceName: 'PROD_SERVER_URL',
    registerFor: {_prod},
  );
  gh.lazySingleton<_i361.BaseOptions>(
    () => dioModule.provideProdBaseOptions(
      gh<String>(instanceName: 'PROD_SERVER_URL'),
    ),
    registerFor: {_prod},
  );
  gh.lazySingleton<_i361.BaseOptions>(
    () => dioModule.provideStagingBaseOptions(
      gh<String>(instanceName: 'STAGING_SERVER_URL'),
    ),
    registerFor: {_staging},
  );
  gh.lazySingleton<_i361.BaseOptions>(
    () => dioModule.provideDevBaseOptions(
      gh<String>(instanceName: 'DEV_SERVER_URL'),
    ),
    registerFor: {_dev},
  );
  gh.lazySingleton<_i361.Dio>(
    () => dioModule.dio(
      gh<_i361.BaseOptions>(),
      gh<_i558.FlutterSecureStorage>(),
      gh<_i271.SimpleConnectionChecker>(),
    ),
  );
  gh.lazySingleton<_i833.IShiftFacade>(
    () => _i397.ShiftFacade(gh<_i361.Dio>()),
  );
  gh.factory<_i992.ShiftCubit>(
    () => _i992.ShiftCubit(gh<_i833.IShiftFacade>()),
  );
  gh.lazySingleton<_i987.INotificationFacade>(
    () => _i459.NotificationFacade(gh<_i361.Dio>()),
  );
  gh.lazySingleton<_i485.IAuthFacade>(
    () => _i480.AuthFacade(gh<_i361.Dio>(), gh<_i558.FlutterSecureStorage>()),
  );
  gh.factory<_i457.AuthCubit>(() => _i457.AuthCubit(gh<_i485.IAuthFacade>()));
  gh.factory<_i478.NotificationCubit>(
    () => _i478.NotificationCubit(gh<_i987.INotificationFacade>()),
  );
  return getIt;
}

class _$UtilityModule extends _i959.UtilityModule {}

class _$DioModule extends _i225.DioModule {}
