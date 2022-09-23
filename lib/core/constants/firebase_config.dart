import 'dart:developer';
import 'dart:io';

import 'package:firebase_core/firebase_core.dart';

class DefaultFirebaseConfig {
  static FirebaseOptions? get platformOptions {
    if (Platform.isIOS || Platform.isMacOS) {
      // iOS and MacOS
      return const FirebaseOptions(
          appId: '1:1004112536265:android:6151a2371af4855ea1e318', //
          apiKey: 'AIzaSyA8w0XMpkqJUeDgv9InIqc_n8LF0Qa3n6g',
          projectId: 'acme-helum', //
          messagingSenderId: '1004112536265	', //
          storageBucket: 'acme-helum.appspot.com');
    } else {
      // Android
      log("Analytics Dart-only initializer doesn't work on Android, please make sure to add the config file.");

      return null;
    }
  }
}
