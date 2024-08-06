import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

class Messages {
  final BuildContext context;

  Messages._(this.context);

  factory Messages.of(BuildContext context) {
    return Messages._(context);
  }

  void showError(String message) =>
      _messages(message, ToastificationType.error);
  void showInfo(String message) => _messages(message, ToastificationType.info);
  void showSuccess(String message) =>
      _messages(message, ToastificationType.success);

  void _messages(String message, ToastificationType type) {
    toastification.show(
      type: type,
      style: ToastificationStyle.fillColored,
      context: context,
      title: Text(message),
      showProgressBar: true,
      alignment: Alignment.bottomRight,
      autoCloseDuration: const Duration(seconds: 3),
    );
  }
}
