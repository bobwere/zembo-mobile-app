import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:zembo_agent_app/injection.config.dart';

final GetIt getIt = GetIt.instance;

const staging = Environment('staging');

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies(String env) => init(getIt, environment: env);
