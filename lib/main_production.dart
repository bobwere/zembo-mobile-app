import 'package:injectable/injectable.dart';
import 'package:zembo_agent_app/app/app_wrapper.dart';
import 'package:zembo_agent_app/app/bootstrap.dart';

void main() {
  bootstrap(
    () => const AppWrapper(),
    Environment.prod,
  );
}
