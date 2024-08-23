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
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macos - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
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
    apiKey: 'AIzaSyB3Ae_Q8fjcJB8z907gz4e-t2tntzPDOyQ',
    appId: '1:624916653434:web:ee78f36a311a46866da2c3',
    messagingSenderId: '624916653434',
    projectId: 'image-to-text-61182',
    authDomain: 'image-to-text-61182.firebaseapp.com',
    storageBucket: 'image-to-text-61182.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDVr8CCs95bMkt25wVqW0YbNsUsOkXHjfQ',
    appId: '1:624916653434:android:5e24291d685bb71b6da2c3',
    messagingSenderId: '624916653434',
    projectId: 'image-to-text-61182',
    storageBucket: 'image-to-text-61182.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyDkuf1wSVNjlDROQgKFV4kuF21vY20fI4g',
    appId: '1:624916653434:ios:9c6f8ea4844a045c6da2c3',
    messagingSenderId: '624916653434',
    projectId: 'image-to-text-61182',
    storageBucket: 'image-to-text-61182.appspot.com',
    iosBundleId: 'com.example.imageToText',
  );
}
