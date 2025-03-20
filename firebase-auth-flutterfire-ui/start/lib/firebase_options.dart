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
      case TargetPlatform.fuchsia:
        throw UnsupportedError('Firebase is not supported on Fuchsia.');
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyBGxa0CIXtCY9LvPwODfDIygQGdNy8pIVw',
    appId: '1:562580978342:web:bc6d69c2a46e33612a9267',
    messagingSenderId: '562580978342',
    projectId: 'final-mobile-login-project',
    authDomain: 'final-mobile-login-project.firebaseapp.com',
    storageBucket: 'final-mobile-login-project.firebasestorage.app',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyDy4SXhcnMyY4Lbt0RLsYSHBA9UoBK00fA',
    appId: '1:562580978342:android:4badbc42e6d57e5f2a9267',
    messagingSenderId: '562580978342',
    projectId: 'final-mobile-login-project',
    storageBucket: 'final-mobile-login-project.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyCWYBueACQdo_r17btvKZS5N_eZABsegpo',
    appId: '1:562580978342:ios:536daf9c4889c1822a9267',
    messagingSenderId: '562580978342',
    projectId: 'final-mobile-login-project',
    storageBucket: 'final-mobile-login-project.firebasestorage.app',
    iosClientId: '562580978342-5itamqcgdvhhsd8podoonnjhq1cdspib.apps.googleusercontent.com',
    iosBundleId: 'com.example.start',
  );

  static const FirebaseOptions macos = FirebaseOptions(
    apiKey: 'AIzaSyCWYBueACQdo_r17btvKZS5N_eZABsegpo',
    appId: '1:562580978342:ios:536daf9c4889c1822a9267',
    messagingSenderId: '562580978342',
    projectId: 'final-mobile-login-project',
    storageBucket: 'final-mobile-login-project.firebasestorage.app',
    iosClientId: '562580978342-5itamqcgdvhhsd8podoonnjhq1cdspib.apps.googleusercontent.com',
    iosBundleId: 'com.example.start',
  );

}