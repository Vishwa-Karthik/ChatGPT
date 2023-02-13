import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

void showErrorToast(
  context,
  errorMessage,
) {
  MotionToast.error(
    description: Text(errorMessage),
    toastDuration: const Duration(milliseconds: 450),
    enableAnimation: true,
  ).show(context);
}
