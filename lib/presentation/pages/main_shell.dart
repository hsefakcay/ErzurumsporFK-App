import 'package:flutter/material.dart';
import '../../domain/repositories/repositories.dart';
import '../widgets/drawer/app_drawer.dart';
import '../widgets/erzurum_app_bar.dart';
import '../widgets/erzurum_bottom_nav_bar.dart';
import 'home/home_page.dart';
import 'fixture/fixture_page.dart';
import 'squad/squad_page.dart';
import 'shop/shop_page.dart';

class MainShell extends StatefulWidget {
  final INewsRepository newsRepository;
  final IMatchRepository matchRepository;
  final ISquadRepository squadRepository;
  final IShopRepository shopRepository;
  final IStandingsRepository standingsRepository;

  const MainShell({
    super.key,
    required this.newsRepository,
    required this.matchRepository,
    required this.squadRepository,
    required this.shopRepository,
    required this.standingsRepository,
  });

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: ErzurumAppBar(),
      endDrawer: const AppDrawer(),
      body: SafeArea(
        top: false,
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top + 64),
          child: _buildPage(),
        ),
      ),
      bottomNavigationBar: ErzurumBottomNavBar(
        currentIndex: _currentIndex,
        onTap: (i) => setState(() => _currentIndex = i),
      ),
    );
  }

  Widget _buildPage() {
    switch (_currentIndex) {
      case 0:
        return HomePage(
          newsRepository: widget.newsRepository,
          matchRepository: widget.matchRepository,
        );
      case 1:
        return FixturePage(
          matchRepository: widget.matchRepository,
          standingsRepository: widget.standingsRepository,
        );
      case 2:
        return SquadPage(squadRepository: widget.squadRepository);
      case 3:
        return ShopPage(shopRepository: widget.shopRepository);
      default:
        return const SizedBox();
    }
  }
}
