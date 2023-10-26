import 'package:Inova/helpers/json_converter.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'configs/bloc_observer.dart';
import 'inits.dart';
import 'injection_container.dart';
import 'my_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();
  await initGetIt();
  await Inits.initHive();
  runApp(const MyApp());
}
