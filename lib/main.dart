import 'package:flutter/material.dart';
import 'package:music_app/themes/light_mode.dart';
import 'package:music_app/themes/theme_provider.dart';
import 'package:provider/provider.dart';
import 'models/playlist_provider.dart';
import 'pages/home_page.dart';
void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider( create: (context)=> ThemeProvider()),
    ChangeNotifierProvider( create: (context)=> PlaylistProvider()),

  ],
    child: const MyApp(),
  )
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      theme : Provider.of<ThemeProvider>(context).themeData,
    );
  }
}

