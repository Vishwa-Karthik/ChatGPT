import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

void showErrorToast(context, errorMessage) {
  MotionToast.error(
    height: MediaQuery.of(context).size.height * 0.1,
    width: MediaQuery.of(context).size.width * 0.7,
    description: Text(errorMessage),
    toastDuration: const Duration(milliseconds: 450),
    enableAnimation: true,
  ).show(context);
}
