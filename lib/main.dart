import 'package:flutter/material.dart';
import 'screens/ana_sayfa.dart';

void main() {
  runApp(YKSProgram());
}

class YKSProgram extends StatelessWidget {
  const YKSProgram({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "YKS KOÇU",
      theme: ThemeData(
        primaryColor: const Color(0xFFD7CCC8), // Açık Kahve
        scaffoldBackgroundColor: const Color(0xFFFFFDE7), // Krem
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFFD7CCC8), // Açık Kahve
          elevation: 4,
          shadowColor: Colors.black12,
          iconTheme: IconThemeData(color: Color(0xFF5D4037)), // Çikolata
          titleTextStyle: TextStyle(
            fontFamily: 'Raleway',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
          centerTitle: true,
        ),
      ),
      home: const AnaSayfa(),
    );
  }
}
