// File generated by FlutterFire CLI.
// ignore_for_file: type=lint
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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for android - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.iOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for ios - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.macOS:
        return macos;
      case TargetPlatform.windows:
        return windows;
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
    apiKey: 'AIzaSyBP0MKnZ_fDALpW0vKecvoOIwp9Hd1rTTM',
    appId: '1:678054929052:web:de78050cb0c04e124dc359',
    messagingSenderId: '678054929052',
    projectId: 'farminity-b8274',
    authDomain: 'farminity-b8274.firebaseapp.com',
    storageBucket: 'farminity-b8274.appspot.com',
    measurementId: 'G-D8YFJM0Q55',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCELdxbXe5dfViufA-iN_6WqMqM-9FiaHE',
    appId: '1:678054929052:ios:c73b44ab3fe56cfb4dc359',
    messagingSenderId: '678054929052',
    projectId: 'farminity-b8274',
    storageBucket: 'farminity-b8274.appspot.com',
    iosBundleId: 'com.example.faminity',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBP0MKnZ_fDALpW0vKecvoOIwp9Hd1rTTM',
    appId: '1:678054929052:web:b56fb1180b8b4b6e4dc359',
    messagingSenderId: '678054929052',
    projectId: 'farminity-b8274',
    authDomain: 'farminity-b8274.firebaseapp.com',
    storageBucket: 'farminity-b8274.appspot.com',
    measurementId: 'G-VM2MCTQ2CC',
  );

}