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
      throw UnsupportedError(
        'DefaultFirebaseOptions have not been configured for web - '
        'you can reconfigure this by running the FlutterFire CLI again.',
      );
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

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyBPS7CwwKc_0DAmz1NDpWv82Zleu2hb7eU',
    appId: '1:551616110234:android:8aec46635ed594b9844923',
    messagingSenderId: '551616110234',
    projectId: 'taxibaghdad-6890f',
    databaseURL: 'https://taxibaghdad-6890f-default-rtdb.firebaseio.com',
    storageBucket: 'taxibaghdad-6890f.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCG8v8UYBJCRPlIBd8UYjiLSSFhq36C2RY',
    appId: '1:551616110234:ios:8e7320ebb742ade1844923',
    messagingSenderId: '551616110234',
    projectId: 'taxibaghdad-6890f',
    databaseURL: 'https://taxibaghdad-6890f-default-rtdb.firebaseio.com',
    storageBucket: 'taxibaghdad-6890f.appspot.com',
    iosClientId: '551616110234-ve64ieq512b7mdr63586sn3i71r5mu65.apps.googleusercontent.com',
    iosBundleId: 'com.example.taxiBaghdad',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCG8v8UYBJCRPlIBd8UYjiLSSFhq36C2RY',
    appId: '1:551616110234:ios:8e7320ebb742ade1844923',
    messagingSenderId: '551616110234',
    projectId: 'taxibaghdad-6890f',
    databaseURL: 'https://taxibaghdad-6890f-default-rtdb.firebaseio.com',
    storageBucket: 'taxibaghdad-6890f.appspot.com',
    iosClientId: '551616110234-ve64ieq512b7mdr63586sn3i71r5mu65.apps.googleusercontent.com',
    iosBundleId: 'com.example.taxiBaghdad',
  );
}
