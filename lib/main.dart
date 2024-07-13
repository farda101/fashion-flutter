import 'package:fashion_lens/splash_screen.dart';
import 'package:fashion_lens/views/screens/auth/signin_page.dart';
import 'package:fashion_lens/views/screens/auth/signup_page.dart';
import 'package:fashion_lens/views/screens/home/components/man.dart';
import 'package:fashion_lens/views/screens/home/components/woman.dart';
import 'package:fashion_lens/views/screens/home/home_page.dart';
import 'package:fashion_lens/views/screens/profile/profile_page.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://xgjiuevzzpnjoispadow.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inhnaml1ZXZ6enBuam9pc3BhZG93Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTg5OTkxNjQsImV4cCI6MjAzNDU3NTE2NH0.sJnOGg3W9KnbLeS80lXKTo8yTADmLCyjqv_AUAceko0',
  );
  runApp(MyApp());
}

final supabase = Supabase.instance.client;

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Simple App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/splash',
      routes: {
        '/splash': (context) => SplashScreen(),
        '/homepage': (context) =>
            supabase.auth.currentSession != null ? HomePage() : SignInPage(),
        '/profile': (context) => ProfilePage(),
        '/signin': (context) => SignInPage(),
        '/signup': (context) => SignUpPage(),
        '/man': (context) => Man(),
        '/woman': (context) => Woman(),
      },
      home: supabase.auth.currentSession != null ? HomePage() : SignInPage(),
    );
  }
}
