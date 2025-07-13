import 'package:flutter/material.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

enum AppStatus { initial, submitting, success, failure }

enum ButtonType { primary, secondary }

enum SnackbarState {
  info,
  error,
  success,
}

enum BottomNavigationItem {
  ///
  home(0, 'Home', LineAwesomeIcons.home_solid),

  ///
  batteryRequest(1, 'Battery Requests', LineAwesomeIcons.sync_solid),

  ///
  profile(2, 'Profile', LineAwesomeIcons.user_solid);

  const BottomNavigationItem(this.idx, this.name, this.icon);

  ///
  final int idx;

  ///
  final String name;

  ///
  final IconData icon;
}
