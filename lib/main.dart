import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nana_mobile_task/nana_app.dart';
import '/core/injection/injector.dart';
import 'core/utils/resources/observer.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Injector.init();
  Bloc.observer = Observer();

  runApp(
    const NanaApp(),
  );
}
