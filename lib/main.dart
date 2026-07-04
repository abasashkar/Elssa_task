import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/constants/app_routes.dart';
import 'core/theme/app_theme.dart';
import 'firebase_options.dart';
import 'screens/auth/login_screen.dart';
import 'screens/auth/otp_screen.dart';
import 'screens/auth/sign_up_screen.dart';
import 'screens/home/main_shell.dart';
import 'screens/location/location_screen.dart';
import 'screens/splash/splash_screen.dart';
import 'services/auth_service.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AuthService.instance.initialize();
  GoogleFonts.config.allowRuntimeFetching = false;
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  runApp(const ElssaApp());
}

class ElssaApp extends StatelessWidget {
  const ElssaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Elssa',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.light,
      initialRoute: AppRoutes.splash,
      routes: {
        AppRoutes.splash: (_) => const SplashScreen(),
        AppRoutes.signUp: (_) => const SignUpScreen(),
        AppRoutes.login: (_) => const LoginScreen(),
        AppRoutes.otp: (_) => const OtpScreen(),
        AppRoutes.location: (_) => const LocationScreen(),
        AppRoutes.home: (_) => const MainShell(),
      },
    );
  }
}
