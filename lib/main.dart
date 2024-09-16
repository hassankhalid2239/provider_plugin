import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_plugin/Provider/counter_provider.dart';
import 'package:provider_plugin/Provider/favorite_provider.dart';
import 'package:provider_plugin/Provider/theme_provider.dart';
import 'package:provider_plugin/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => FavoriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Provider Plugin',
        themeMode: Provider.of<ThemeProvider>(context).themeMode,
        theme: ThemeData(
          brightness: Brightness.light,
          useMaterial3: true,
        ),
        darkTheme: ThemeData(
          brightness: Brightness.dark,
          useMaterial3: true,
        ),
        home: const HomeScreen(),
      ),
    );
  }
}
