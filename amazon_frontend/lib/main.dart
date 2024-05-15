import 'package:amazon_frontend/core/constant/app_color.dart';
import 'package:amazon_frontend/core/routes/app_router.dart';
import 'package:amazon_frontend/features/auth/screens/auth_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Amazon Clone',
      theme: ThemeData(
        scaffoldBackgroundColor: AppColor.backgroundColor,
        colorScheme: const ColorScheme.light(
          primary: AppColor.secondaryColor,
        ),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      ),
      onGenerateRoute: onGenerateRoute,
      debugShowCheckedModeBanner: false,
      home: const AuthScreen(),
    );
  }
}
