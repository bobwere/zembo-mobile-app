import 'package:flutter/material.dart';
import 'package:zembo_agent_app/presentation/widgets/bar.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Bar(title: 'Login'),
          ],
        ),
      ),
    );
  }
}
