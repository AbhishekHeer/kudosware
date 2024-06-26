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
        return android;
      case TargetPlatform.iOS:
        return ios;
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
    apiKey: 'AIzaSyCHrQ_G-nlZDm-y6NQU8DlNWp746Hbxr0A',
    appId: '1:423867017928:web:69128a41a88cc9d22213fd',
    messagingSenderId: '423867017928',
    projectId: 'assignment-a10e9',
    authDomain: 'assignment-a10e9.firebaseapp.com',
    databaseURL: 'https://assignment-a10e9-default-rtdb.firebaseio.com',
    storageBucket: 'assignment-a10e9.appspot.com',
    measurementId: 'G-BNPDPESEZG',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCqC3wJFL5qf4JOSXeNq5_Z8ltxLtT4-gk',
    appId: '1:423867017928:android:4f777749e6cf175c2213fd',
    messagingSenderId: '423867017928',
    projectId: 'assignment-a10e9',
    databaseURL: 'https://assignment-a10e9-default-rtdb.firebaseio.com',
    storageBucket: 'assignment-a10e9.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBP-65m2ur21KP69TNfc-H1CTLzTvZvAZk',
    appId: '1:423867017928:ios:d44493093e4eb4632213fd',
    messagingSenderId: '423867017928',
    projectId: 'assignment-a10e9',
    databaseURL: 'https://assignment-a10e9-default-rtdb.firebaseio.com',
    storageBucket: 'assignment-a10e9.appspot.com',
    iosBundleId: 'com.example.kudosware',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBP-65m2ur21KP69TNfc-H1CTLzTvZvAZk',
    appId: '1:423867017928:ios:d44493093e4eb4632213fd',
    messagingSenderId: '423867017928',
    projectId: 'assignment-a10e9',
    databaseURL: 'https://assignment-a10e9-default-rtdb.firebaseio.com',
    storageBucket: 'assignment-a10e9.appspot.com',
    iosBundleId: 'com.example.kudosware',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyCHrQ_G-nlZDm-y6NQU8DlNWp746Hbxr0A',
    appId: '1:423867017928:web:a9643995701b09462213fd',
    messagingSenderId: '423867017928',
    projectId: 'assignment-a10e9',
    authDomain: 'assignment-a10e9.firebaseapp.com',
    databaseURL: 'https://assignment-a10e9-default-rtdb.firebaseio.com',
    storageBucket: 'assignment-a10e9.appspot.com',
    measurementId: 'G-D21GVHMBR4',
  );

}