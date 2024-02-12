// ignore_for_file: depend_on_referenced_packages

import 'package:cafe_sabor/config/credentials.dart';
import 'package:cafe_sabor/config/my_app.dart';
import 'package:flutter/material.dart';
import 'package:cafe_sabor/injection_container.dart' as di;
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  await Firebase.initializeApp();
  final credentials = await Credentials().get();
  di.init();
  FlutterNativeSplash.remove();
  runApp(MyApp(credentials: credentials,));
}


