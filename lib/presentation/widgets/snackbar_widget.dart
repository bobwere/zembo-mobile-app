import 'package:flutter/material.dart';
import 'package:oktoast/oktoast.dart';
import 'package:zembo_agent_app/core/constants/enum.dart';

void showSnackBar(
  BuildContext context, {
  SnackbarState? state = SnackbarState.error,
  String? title = '',
  String? message =
      'Kindly try again, if the issue persist contact our support team',
}) {
  try {
    showToast(
      message!,
      position: ToastPosition.bottom,
      duration: const Duration(seconds: 3),
      backgroundColor: state == SnackbarState.error
          ? Colors.redAccent
          : state == SnackbarState.success
          ? Colors.green
          : Colors.blueAccent,
      dismissOtherToast: true,
    );
  } catch (e) {
    //
  }
}
