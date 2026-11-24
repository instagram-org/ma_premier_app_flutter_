import 'package:flutter/material.dart';

import 'login_page.dart';

import 'package:shared_preferences/shared_preferences.dart';

import 'home_page.dart';

late SharedPreferences prefs;
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    final connecte = prefs.getBool('connecte') ?? false;
    return MaterialApp(
      
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorSchemeSeed: Colors.lightGreen,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.lightGreen),
      ),
      home: connecte ? const HomePage() : const LoginPage(),
    );
  }
}
//push : ajoute la page par-dessus (retour possible).

//pushReplacement : remplace la page actuelle (pas de retour).

//Navigator.pop avant d'ouvrir Animé :

//Ferme le dialog/menu actuel pour éviter d'accumuler les écrans.

//Flèche retour (Animé vs Accueil) :

//Animé a un parent dans la pile (accédée par push). L'accueil est la racine de l'application (page de départ).
