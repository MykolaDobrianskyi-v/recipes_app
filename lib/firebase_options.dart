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
    apiKey: 'AIzaSyDaMoyxahy68DIRaMBziVXgUYzQp1N52T8',
    appId: '1:743755371831:web:a76a6816b5b93cd46936b2',
    messagingSenderId: '743755371831',
    projectId: 'flutter-chat-18981',
    authDomain: 'flutter-chat-18981.firebaseapp.com',
    storageBucket: 'flutter-chat-18981.firebasestorage.app',
    measurementId: 'G-SYJGPZXGTM',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDA_1f_2LXogzQhJcb1sHeBMJY6HPl_LFo',
    appId: '1:743755371831:android:4aa8a1798fd65df76936b2',
    messagingSenderId: '743755371831',
    projectId: 'flutter-chat-18981',
    storageBucket: 'flutter-chat-18981.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCnWeqkhcyV7_bpp0xRIhn-G_6kLNzSB54',
    appId: '1:743755371831:ios:019f36abe2aa82876936b2',
    messagingSenderId: '743755371831',
    projectId: 'flutter-chat-18981',
    storageBucket: 'flutter-chat-18981.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCnWeqkhcyV7_bpp0xRIhn-G_6kLNzSB54',
    appId: '1:743755371831:ios:019f36abe2aa82876936b2',
    messagingSenderId: '743755371831',
    projectId: 'flutter-chat-18981',
    storageBucket: 'flutter-chat-18981.firebasestorage.app',
    iosBundleId: 'com.example.chatApp',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDaMoyxahy68DIRaMBziVXgUYzQp1N52T8',
    appId: '1:743755371831:web:9e4cc47b92f7410e6936b2',
    messagingSenderId: '743755371831',
    projectId: 'flutter-chat-18981',
    authDomain: 'flutter-chat-18981.firebaseapp.com',
    storageBucket: 'flutter-chat-18981.firebasestorage.app',
    measurementId: 'G-H9FTJ8LZ9N',
  );
}
