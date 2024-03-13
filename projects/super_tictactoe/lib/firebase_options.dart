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
    apiKey: 'AIzaSyC6qB8YbUoTTSxso9HjW1CZiqcOpHYEQ14',
    appId: '1:1023739173542:web:5d73cee5bd7bbe16a47267',
    messagingSenderId: '1023739173542',
    projectId: 'messenger-7a021',
    authDomain: 'messenger-7a021.firebaseapp.com',
    storageBucket: 'messenger-7a021.appspot.com',
    measurementId: 'G-TD7X0T2WV9',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBLDgrhXUOJ3vZoW8SvcdzE30GYYDyhSU0',
    appId: '1:1023739173542:android:38ce7048a85c6cefa47267',
    messagingSenderId: '1023739173542',
    projectId: 'messenger-7a021',
    storageBucket: 'messenger-7a021.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDsQx63oZdpiskpcQILdi3Ea5lOo0Hlrfw',
    appId: '1:1023739173542:ios:0637ca2ab0d9db19a47267',
    messagingSenderId: '1023739173542',
    projectId: 'messenger-7a021',
    storageBucket: 'messenger-7a021.appspot.com',
    iosBundleId: 'com.example.todoApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDsQx63oZdpiskpcQILdi3Ea5lOo0Hlrfw',
    appId: '1:1023739173542:ios:60e01760fcaca2d0a47267',
    messagingSenderId: '1023739173542',
    projectId: 'messenger-7a021',
    storageBucket: 'messenger-7a021.appspot.com',
    iosBundleId: 'com.example.todoApp.RunnerTests',
  );
}
