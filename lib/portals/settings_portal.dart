import 'package:flutter/material.dart';
import 'package:lesson43/controllers/settings_controller.dart';

class SettingsPortal extends InheritedWidget {
  final SettingsController settingsController;
  SettingsPortal({required this.settingsController, required super.child});

  @override
  bool updateShouldNotify(covariant SettingsPortal oldWidget) {
    return oldWidget.settingsController != settingsController;
  }

  static SettingsController of(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<SettingsPortal>()!
        .settingsController;
  }
}
