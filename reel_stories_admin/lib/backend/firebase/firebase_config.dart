import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyAm2wb0vwQfUZLIybrbfelUHYSIqYzr1Os",
            authDomain: "reel-stories.firebaseapp.com",
            projectId: "reel-stories",
            storageBucket: "reel-stories.appspot.com",
            messagingSenderId: "36385560518",
            appId: "1:36385560518:web:1fb31b8e9e85ed258284c7",
            measurementId: "G-3LY9FYE38P"));
  } else {
    await Firebase.initializeApp();
  }
}
