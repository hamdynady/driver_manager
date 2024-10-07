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
    apiKey: 'AIzaSyBuTaevZMQmn4msbiIU4Ni8-x6PLHkebm0',
    appId: '1:936352345850:web:e0607535a66067597fa343',
    messagingSenderId: '936352345850',
    projectId: 'driver-manager-e8224',
    authDomain: 'driver-manager-e8224.firebaseapp.com',
    storageBucket: 'driver-manager-e8224.appspot.com',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCy92wfijus65RnylZx5F48RAjm1__WvO8',
    appId: '1:936352345850:android:51c1f384ee1a57077fa343',
    messagingSenderId: '936352345850',
    projectId: 'driver-manager-e8224',
    storageBucket: 'driver-manager-e8224.appspot.com',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyBK6SpHnRR_-luA34ixXIJdCmuBmGEbkXc',
    appId: '1:936352345850:ios:94c1df519a958f8e7fa343',
    messagingSenderId: '936352345850',
    projectId: 'driver-manager-e8224',
    storageBucket: 'driver-manager-e8224.appspot.com',
    iosClientId: '936352345850-iufmppvguequ3p02t6gjsd5hb4e39r00.apps.googleusercontent.com',
    iosBundleId: 'com.example.driverManager',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyBK6SpHnRR_-luA34ixXIJdCmuBmGEbkXc',
    appId: '1:936352345850:ios:94c1df519a958f8e7fa343',
    messagingSenderId: '936352345850',
    projectId: 'driver-manager-e8224',
    storageBucket: 'driver-manager-e8224.appspot.com',
    iosClientId: '936352345850-iufmppvguequ3p02t6gjsd5hb4e39r00.apps.googleusercontent.com',
    iosBundleId: 'com.example.driverManager',
  );

  static const FirebaseOptions windows = FirebaseOptions(
    apiKey: 'AIzaSyBuTaevZMQmn4msbiIU4Ni8-x6PLHkebm0',
    appId: '1:936352345850:web:541867f63cfb34f27fa343',
    messagingSenderId: '936352345850',
    projectId: 'driver-manager-e8224',
    authDomain: 'driver-manager-e8224.firebaseapp.com',
    storageBucket: 'driver-manager-e8224.appspot.com',
  );
}
