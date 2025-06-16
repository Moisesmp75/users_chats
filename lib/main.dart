import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:users_app/config/router/app_routes.dart';
import 'package:users_app/providers/chat_provider.dart';
import 'package:users_app/providers/user_provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ChatProvider())
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: 'Material App',
      theme: ThemeData(
        useMaterial3: true,
        colorSchemeSeed: Color(0xFF1DA1F2),
        fontFamily: "Serif",
        textTheme: const TextTheme(
          headlineSmall: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
          titleMedium: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          bodyMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),
          labelLarge: TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}