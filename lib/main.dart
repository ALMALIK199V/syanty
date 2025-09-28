import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'services/app_service.dart';
import 'screens/auth/login_screen.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => AppService(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'صيانتي',
      theme: ThemeData(
        primarySwatch: Colors.green,
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}