import '../../domain/models/news_article.dart';
import '../../domain/repositories/repositories.dart';

/// Mock veri kaynağı - INewsRepository implementasyonu.
/// LSP: Bu sınıf, INewsRepository arayüzünü tam olarak karşılar.
class MockNewsRepository implements INewsRepository {
  @override
  Future<NewsArticle?> getFeaturedNews() async {
    return const NewsArticle(
      id: 'featured-1',
      title: 'Antrenman Günlüğü',
      category: 'Öne Çıkan',
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBFggM7f_V7uPuKYoOk3IpFD5PtyrK3iqTZtgwcLOscolfiDDIeqRiccWVemxWjJruNxAXDCxm9PlufbmZVt9NrWhJHjxYucK3MVXwdKYqtm1UtxNvpOh0UmDvf4vAlJ5NWW1WptSxgki2dlTuFHvVfi73aJGTg1kkaAe9f8RGUdBEp_LY19NZ3kUgw7neMvPCG0YCj4P-9a8xwJCm_gUCuIkGFSiKvdjbG6nhhWkgE7Y5aYVfLLND9Wpz2_tFocdmyUKg6jnf8Vgs',
      timeAgo: 'Bugün',
      publishedAt: null,
    );
  }

  @override
  Future<List<NewsArticle>> getLatestNews() async {
    return const [
      NewsArticle(
        id: 'news-1',
        title: 'Taktik İdman Sona Erdi',
        category: 'Antrenman',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuDvhqZHCbACaIgyq88pqernKvF2br_CEslI_5KmLY82NzJqgQR9YaW9b5tQKo8IqCHKZJnWhgHPgs6VwHoZMaWeKtkuouoAZuwJ0dw3QrFZDqDYlgRtuGRug0wLx8Nsr3iqrGvN7zxcxN-qAoBCDAD3I1cgKQt1w8VwJw135lYIVXOXQ3J-d7J1UCNYnqA2IZrdU2YuJfHwqMS-7iE7zee2YnAqeHcwDoPIUCAwcxk8-4_ml2weBSAyPFtuuCIpYwpcOc8Vxd17jJc',
        timeAgo: '2 saat önce',
        publishedAt: null,
      ),
      NewsArticle(
        id: 'news-2',
        title: 'Yeni Transferimiz Basın Önünde Sözleşme İmzaladı',
        category: 'Transfer',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuAIMIzfNSj00nm8n3c4jSYBnLRbIvRLmUctIajgN-L9ezK06w5t-e8xnR7YZjlepMgBT4zOfnzlzmimrzGps0bOm4VkI9TjAywbQqrXwLLlrM3_bSGcVUpQTN7TnYAZh4Vb2j0Vs29YWeSSxGGg6iZWZYp-DpBcTxrBAVdp-q2IagUqgF3WoSNNd1HXnqleliinFlZAAx5weyNFP5Sw5v_Ah97lVcW5lXgpxLYy_qdsb3o_zJRK_ODnJIZX9EX8QEGQpVSexhJPcX0',
        timeAgo: '23 Kasım 2024',
        publishedAt: null,
      ),
      NewsArticle(
        id: 'news-3',
        title: 'Başkanımızdan Önemli Açıklamalar',
        category: 'Kulüp',
        imageUrl:
            'https://lh3.googleusercontent.com/aida-public/AB6AXuCiJzC5X_pTh1VomEvab48bzAn3Wncaoor_HMIs5UKGne7AgAorltubJ_cRDvmr67tS3rEqRhflx8hp3sxDkTZDbOdQtNHnBAsZ7RG22MZwO_u9JqGm6KWMvL89gadr6xk_X3UQ1jV43GPGLSNZi7YQuKnp2NIZMgxlwyF2xoxBcDUHsjagnusxRDpOOdUJYNznDKvn7oa20g0xzvtojlqUFMee-gcjBa1Q-fTmhCxhL65pQ9H80XhmUmLR7bjEDrE__aJCM1yvRD4',
        timeAgo: '21 Kasım 2024',
        publishedAt: null,
      ),
    ];
  }
}
