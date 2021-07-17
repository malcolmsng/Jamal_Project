import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:jamal_v1/ui/authentication.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        StreamProvider<User>.value(
          initialData: null,
          value: FirebaseAuth.instance.authStateChanges(),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: "jamal",
        home: Authentication(),
      ),
    );
  }
}
