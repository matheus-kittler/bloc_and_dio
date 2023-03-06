import 'package:bloc_and_dio_test/settings/hive_settings.dart';
import 'package:flutter/material.dart';
import 'app_widget.dart';
import 'locator.dart';

  void main() async {
    WidgetsFlutterBinding.ensureInitialized();
    await HiveSettings.startHive();
    registerDependencies();
    runApp(const PokemonPoc());
  }