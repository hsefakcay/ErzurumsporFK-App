import 'package:erzurumsporfk/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'core/theme/app_theme.dart';
import 'core/constants/app_constants.dart';
import 'data/repositories/firebase_news_repository.dart';
import 'data/repositories/mock_match_repository.dart';
import 'data/repositories/firebase_squad_repository.dart';
import 'data/repositories/mock_shop_repository.dart';
import 'data/repositories/standings_repository.dart';
import 'presentation/pages/main_shell.dart';
import 'presentation/pages/splash/splash_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
      systemNavigationBarColor: Color(0xFF020617),
    ),
  );

  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);

  runApp(const ErzurumsporfkApp());
}

class ErzurumsporfkApp extends StatelessWidget {
  const ErzurumsporfkApp({super.key});

  @override
  Widget build(BuildContext context) {
    final newsRepo = FirebaseNewsRepository();
    // TODO: Real match data integration
    final matchRepo = MockMatchRepository();
    final squadRepo = FirebaseSquadRepository();
    final shopRepo = MockShopRepository();
    final standingsRepo = StandingsRepository();

    return MaterialApp(
      title: AppConstants.appName,
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: SplashPage(
        child: MainShell(
          newsRepository: newsRepo,
          matchRepository: matchRepo,
          squadRepository: squadRepo,
          shopRepository: shopRepo,
          standingsRepository: standingsRepo,
        ),
      ),
    );
  }
}
