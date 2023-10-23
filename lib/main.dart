import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:rmcheckin/app/input/input_screen.dart';
import 'package:rmcheckin/app/shared/theme/colors_theme.dart';
import 'package:rmcheckin/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // Certifique-se de que o Flutter está inicializado
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // Inicialize o Firebase
  runApp(const MyApp()); // Inicie o aplicativo Flutter
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    return MaterialApp(
        title: 'RMCheckIn',
        debugShowCheckedModeBanner: false,
        theme: myTheme,
        localizationsDelegates: const [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('pt', 'BR'),
        ],
        home: const InputScreen());
  }
}
