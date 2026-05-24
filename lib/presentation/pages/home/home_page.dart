import 'package:flutter/material.dart';
import '../../../core/theme/app_colors.dart';
import '../../../core/theme/app_text_styles.dart';
import '../../../domain/models/news_article.dart';
import '../../../domain/models/match.dart';
import '../../../domain/repositories/repositories.dart';
import 'widgets/featured_banner.dart';
import 'widgets/next_match_card.dart';
import 'widgets/news_card.dart';
import 'widgets/section_header.dart';

/// Ana sayfa.
/// SRP: Sadece ana sayfa düzenini (layout) yönetir.
/// Alt widget'lar ayrı dosyalarda tanımlıdır.
class HomePage extends StatefulWidget {
  final INewsRepository newsRepository;
  final IMatchRepository matchRepository;

  const HomePage({super.key, required this.newsRepository, required this.matchRepository});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<NewsArticle?> _featuredFuture;
  late Future<List<NewsArticle>> _newsFuture;
  late Future<Match?> _matchFuture;

  @override
  void initState() {
    super.initState();
    _featuredFuture = widget.newsRepository.getFeaturedNews();
    _newsFuture = widget.newsRepository.getLatestNews();
    _matchFuture = widget.matchRepository.getNextMatch();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildFeaturedSection(),
          const SizedBox(height: 32),
          _buildNextMatchSection(),
          _buildNewsHeader(),
          const SizedBox(height: 16),
          _buildNewsList(),
        ],
      ),
    );
  }

  /// Öne çıkan haber banner'ı.
  Widget _buildFeaturedSection() {
    return FutureBuilder<NewsArticle?>(
      future: _featuredFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const SizedBox(
            height: 300,
            child: Center(child: CircularProgressIndicator(color: AppColors.primary)),
          );
        }
        final featured = snapshot.data;
        if (featured != null) {
          return FeaturedBanner(article: featured);
        }
        return const SizedBox.shrink();
      },
    );
  }

  /// Sıradaki maç bölümü.
  Widget _buildNextMatchSection() {
    return FutureBuilder<Match?>(
      future: _matchFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        }
        final nextMatch = snapshot.data;
        if (nextMatch == null) return const SizedBox.shrink();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SectionHeader(icon: Icons.sports_soccer, title: 'Sıradaki Maç'),
            const SizedBox(height: 16),
            NextMatchCard(match: nextMatch),
            const SizedBox(height: 32),
          ],
        );
      },
    );
  }

  /// Son haberler başlığı.
  Widget _buildNewsHeader() {
    return SectionHeader(
      icon: Icons.article_outlined,
      title: 'Son Haberler',
      trailing: TextButton(
        onPressed: () {},
        child: Text(
          'Tümünü Gör',
          style: AppTextStyles.labelMd.copyWith(
            color: AppColors.primary.withValues(alpha: 0.8),
          ),
        ),
      ),
    );
  }

  /// Haber listesi.
  Widget _buildNewsList() {
    return FutureBuilder<List<NewsArticle>>(
      future: _newsFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 20),
              child: CircularProgressIndicator(color: AppColors.primary),
            ),
          );
        }
        final news = snapshot.data ?? [];
        if (news.isEmpty) {
          return const Padding(
            padding: EdgeInsets.all(16.0),
            child: Text('Henüz haber bulunmuyor.'),
          );
        }
        return Column(
          children: news
              .map(
                (a) => Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: NewsCard(article: a),
                ),
              )
              .toList(),
        );
      },
    );
  }
}
