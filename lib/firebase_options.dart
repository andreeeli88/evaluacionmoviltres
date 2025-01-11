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
    apiKey: 'AIzaSyDszRAstkw0H0rUPv07fHFdYfVTbKiuARc',
    appId: '1:926049478526:web:8418b2ed2f800b5da3352f',
    messagingSenderId: '926049478526',
    projectId: 'app-movil-65eff',
    authDomain: 'app-movil-65eff.firebaseapp.com',
    databaseURL: 'https://app-movil-65eff-default-rtdb.firebaseio.com',
    storageBucket: 'app-movil-65eff.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyAhmn7ILVjp2yGmvVuDkbovKuJ7Un-FL9g',
    appId: '1:926049478526:android:026b23763dc3158aa3352f',
    messagingSenderId: '926049478526',
    projectId: 'app-movil-65eff',
    databaseURL: 'https://app-movil-65eff-default-rtdb.firebaseio.com',
    storageBucket: 'app-movil-65eff.firebasestorage.app',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyDszRAstkw0H0rUPv07fHFdYfVTbKiuARc',
    appId: '1:926049478526:web:0f779cecbe2e793ea3352f',
    messagingSenderId: '926049478526',
    projectId: 'app-movil-65eff',
    authDomain: 'app-movil-65eff.firebaseapp.com',
    databaseURL: 'https://app-movil-65eff-default-rtdb.firebaseio.com',
    storageBucket: 'app-movil-65eff.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACZCpAcoeo3_5cpHn3MsHKIzKEnrBJz-0',
    appId: '1:926049478526:ios:d145b8948d85931fa3352f',
    messagingSenderId: '926049478526',
    projectId: 'app-movil-65eff',
    databaseURL: 'https://app-movil-65eff-default-rtdb.firebaseio.com',
    storageBucket: 'app-movil-65eff.firebasestorage.app',
    iosBundleId: 'com.example.evaluacionFinal',
  );

}