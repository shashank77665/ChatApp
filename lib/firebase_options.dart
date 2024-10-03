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
    apiKey: 'AIzaSyD2LwjAIsepI1EnLXXdx-WvyY5B60Q9Py4',
    appId: '1:411007179318:web:a68a15bb46321a77309697',
    messagingSenderId: '411007179318',
    projectId: 'chatapp-94df2',
    authDomain: 'chatapp-94df2.firebaseapp.com',
    storageBucket: 'chatapp-94df2.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCmrH3JSW2COcAozpMEyeEmsKC7iqkTous',
    appId: '1:411007179318:android:4ded6eabdf75971f309697',
    messagingSenderId: '411007179318',
    projectId: 'chatapp-94df2',
    storageBucket: 'chatapp-94df2.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDGEOEi49phSug0GDlNR4zZJYGvykiW1mc',
    appId: '1:411007179318:ios:00af76e6ee6f6d65309697',
    messagingSenderId: '411007179318',
    projectId: 'chatapp-94df2',
    storageBucket: 'chatapp-94df2.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyDGEOEi49phSug0GDlNR4zZJYGvykiW1mc',
    appId: '1:411007179318:ios:00af76e6ee6f6d65309697',
    messagingSenderId: '411007179318',
    projectId: 'chatapp-94df2',
    storageBucket: 'chatapp-94df2.appspot.com',
    iosBundleId: 'com.example.chatapp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyD2LwjAIsepI1EnLXXdx-WvyY5B60Q9Py4',
    appId: '1:411007179318:web:abe0e008378fc5fd309697',
    messagingSenderId: '411007179318',
    projectId: 'chatapp-94df2',
    authDomain: 'chatapp-94df2.firebaseapp.com',
    storageBucket: 'chatapp-94df2.appspot.com',
  );
}
