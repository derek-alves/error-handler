// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyAfWD65twi2VOOFLjxCy48K56wHk-02-sA',
    appId: '1:557587871069:web:d1b4a5b77169ff873324b4',
    messagingSenderId: '557587871069',
    projectId: 'clean-firebase-b80c3',
    authDomain: 'clean-firebase-b80c3.firebaseapp.com',
    storageBucket: 'clean-firebase-b80c3.appspot.com',
    measurementId: 'G-DHJCZVXJCB',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDF-sVf8UPWftP_zR1fb_5lF132XLsdOz4',
    appId: '1:557587871069:android:23d81e417466bc4e3324b4',
    messagingSenderId: '557587871069',
    projectId: 'clean-firebase-b80c3',
    storageBucket: 'clean-firebase-b80c3.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBNAFw5QhBawQuxEcr5lPn0wN1cjIEe2Rc',
    appId: '1:557587871069:ios:9a830a03a101a8593324b4',
    messagingSenderId: '557587871069',
    projectId: 'clean-firebase-b80c3',
    storageBucket: 'clean-firebase-b80c3.appspot.com',
    iosClientId: '557587871069-jn5rob3s867u5b5j52o75aesviius0v6.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterErrorHandling',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBNAFw5QhBawQuxEcr5lPn0wN1cjIEe2Rc',
    appId: '1:557587871069:ios:b018d197f628f74b3324b4',
    messagingSenderId: '557587871069',
    projectId: 'clean-firebase-b80c3',
    storageBucket: 'clean-firebase-b80c3.appspot.com',
    iosClientId: '557587871069-8tk6lquhaqp94ppv6h1gt5d1fklai6h7.apps.googleusercontent.com',
    iosBundleId: 'com.example.flutterErrorHandling.RunnerTests',
  );
}
