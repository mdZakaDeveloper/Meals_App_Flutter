import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:meals_app/screens/tab_bar.dart';


final theme = ThemeData(
  useMaterial3: true,
  colorScheme: ColorScheme.fromSeed(
    seedColor: const Color.fromARGB(255, 6, 90, 96)
   
    
    ),
    textTheme: GoogleFonts.interTextTheme()

);

void main(){
  runApp(const ProviderScope(child:  App()));
}

class App extends StatelessWidget{
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const TabsScreen()
    );
  }
}