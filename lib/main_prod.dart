// ignore_for_file: depend_on_referenced_packages

import 'package:cafe_sabor/my_app.dart';
import 'package:flutter/material.dart';
import 'package:cafe_sabor/injection_container.dart' as di;
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  di.init();
  FlutterNativeSplash.remove();
  runApp(const MyApp());
}


