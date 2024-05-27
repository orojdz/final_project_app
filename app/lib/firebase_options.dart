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
///

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
    apiKey: 'AIzaSyA58_k0J12qH0aUaikt7WEKMRj-iprU5nA',
    appId: '1:231100553534:web:f5813c5845333b4b60f46f',
    messagingSenderId: '231100553534',
    projectId: 'recipesdb-f26f4',
    authDomain: 'recipesdb-f26f4.firebaseapp.com',
    storageBucket: 'recipesdb-f26f4.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBANEctFm-MvrRVAaWCpdHhC1ju8T_wDdk',
    appId: '1:231100553534:android:7ee43be90c29020260f46f',
    messagingSenderId: '231100553534',
    projectId: 'recipesdb-f26f4',
    storageBucket: 'recipesdb-f26f4.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyC8L_W1awXrWJ3JZskxkgDGXnVTyKUocw8',
    appId: '1:231100553534:ios:d932d5a20ec2762360f46f',
    messagingSenderId: '231100553534',
    projectId: 'recipesdb-f26f4',
    storageBucket: 'recipesdb-f26f4.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyC8L_W1awXrWJ3JZskxkgDGXnVTyKUocw8',
    appId: '1:231100553534:ios:d932d5a20ec2762360f46f',
    messagingSenderId: '231100553534',
    projectId: 'recipesdb-f26f4',
    storageBucket: 'recipesdb-f26f4.appspot.com',
    iosBundleId: 'com.example.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyA58_k0J12qH0aUaikt7WEKMRj-iprU5nA',
    appId: '1:231100553534:web:1b300a91541e2f3c60f46f',
    messagingSenderId: '231100553534',
    projectId: 'recipesdb-f26f4',
    authDomain: 'recipesdb-f26f4.firebaseapp.com',
    storageBucket: 'recipesdb-f26f4.appspot.com',
  );
}