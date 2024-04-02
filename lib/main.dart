import 'dart:async';

import 'package:error_handler/error_handler.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_error_handling/presentation/ui/pages/pages.dart';

import 'firebase_options.dart';
import 'infra/di/di.dart';
import 'presentation/ui/pages/connection/connection_page.dart';

void main() {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp(options: DefaultFirebaseOptions.android);
    await FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(true);
    FlutterError.onError = onFlutterError;

    runApp(const MyApp());
  }, (error, stack) {
    FirebaseCrashlytics.instance.recordError(error, stack);
  });
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    ErrorHandler.init((error) {
      print(error);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(brightness: Brightness.dark),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.dark,
      debugShowCheckedModeBanner: false,
      debugShowMaterialGrid: false,
      initialRoute: "/home",
      routes: {
        "/home": (context) => makeHomePage(),
        "/scroll": (context) => const ScrollablePage(),
        "/renderObject": (context) => const RenderObjectPage(),
        "/animations": (context) => const AnimationPage(),
        '/connection': (context) => const ConnectionPage(),
        '/unlogged': (context) => const ConnectionPage(),
      },
    );
  }
}

void onFlutterError(FlutterErrorDetails details) {
  FirebaseCrashlytics.instance.recordFlutterError(details);
  FirebaseCrashlytics.instance
      .recordError(Exception("UI ERROR"), StackTrace.current);
  FlutterError.presentError(details);
}


// void main() {
//   var value = NewClass(value: NewClass2(),title: "Ola");
  

//   print(NewClass.new.runtimeType);
  
// }

// getRightType<T>(NewClass value) {
  
  
//   if (value.title.runtimeType == T) {
//     print("TITLE");
//   } else if (value.value.runtimeType == T) {
//     print("VALUE");
//   }
  
  

// }

// class NewClass {
//   final NewClass2 value;
//   final String? title;
//   const NewClass({required this.value, this.title});
// }

// class NewClass2 {
//   const NewClass2();
// }
