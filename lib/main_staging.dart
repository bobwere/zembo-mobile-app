import 'package:zembo_agent_app/app/app_wrapper.dart';
import 'package:zembo_agent_app/app/bootstrap.dart';
import 'package:zembo_agent_app/injection.dart';

void main() {
  bootstrap(
    () => const AppWrapper(),
    staging.name,
  );
}
