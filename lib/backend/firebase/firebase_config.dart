import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyD55AuAUKJi2xBr13eBTULXQ4uSmHO_-f4",
            authDomain: "agricoo-b9c46.firebaseapp.com",
            projectId: "agricoo-b9c46",
            storageBucket: "agricoo-b9c46.firebasestorage.app",
            messagingSenderId: "791860873092",
            appId: "1:791860873092:web:7d66315248689a494d3fd1",
            measurementId: "G-VSWL68SM39"));
  } else {
    await Firebase.initializeApp();
  }
}
