import '../../domain/models/product.dart';
import '../../domain/repositories/repositories.dart';

/// Mock veri kaynağı - IShopRepository implementasyonu.
class MockShopRepository implements IShopRepository {
  static const _products = [
    Product(
      id: 'prod-1',
      name: '24/25 İç Saha Forması - Yetişkin',
      category: 'Formalar',
      price: 1450,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuAAdUfbO5IFDY2neKhF-IGcbqHIQ4WzHstuL-uBXPKrp2mOQXFuxLUXud5bHyw8iX88IxZblnoOqleKuFURAe4JgpbGZKC1Fr60dmxbPik2G6PQmI9_56iGrjCIB7uj8Zf0i6cKc9JrUNTi2TjC6iRUXuGHXP7eyUheKLHNA5DaFK7aRJrtQBNbaEXsNcnNcabiAKNwZ1tYAhd_qwfzF99vBggzddxUUfV_H9i_n9tfcHaHwCQWdXCtupEgI55UNBu4ERMR7LbUNew',
      isNew: true,
    ),
    Product(
      id: 'prod-2',
      name: 'Erzurumspor Kapüşonlu Sweatshirt',
      category: 'Günlük Giyim',
      price: 850,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuDizu8EjQ078-mIk-EouCDDqVf96J6dCICo9yu6_dI4rtGvuzT94o5LzJ9QXJ9m-HYdUTE06nYznQJB3qdHW8iBX4zSRJ8JTjgyU0r-e7fH2fYVRolInkMTNFa5gLewJxr6wnO0IxThAyrdX6bzp8GHqqUU0SdeMp_AUsGDbo6zlkNlNqSlbXmrbtmAt2a-TIpuLlCwxMTEzzrE9SRX2fkU1pN9CmwTjfslwG3_ISgYVpq_Th69u-wi40A5k93C9h9C_CAG_iHA3g8',
    ),
    Product(
      id: 'prod-3',
      name: 'Teknik Ekip Polo Tişört',
      category: 'Antrenman',
      price: 600,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuB4xNzEtvBEz4EWq81_hV7GcvrrmapBVffkznsJWe93Ayrc5Ms2N3fnK2iYZ8ziiWcluF2zxJVMDrbOKQmnOMdFlx7_yHZzJ4chbMxodC_SoFOg5uh-BLLQQZwEc9f9MK-NZsCUxY6fV1SICTnbWWzalPleF7L99fh4M3aMGEttR3ReWoKHvEmyj1v1HCDa5Oxx8v96dX70S7_31C0xLJDqrmVk6WXlCUwX4KIm-t2q3r-0JMB944WeZd1w6lKYqnPEji1h50CJLx0',
    ),
    Product(
      id: 'prod-4',
      name: 'Pro Spor Çantası',
      category: 'Aksesuar',
      price: 950,
      imageUrl:
          'https://lh3.googleusercontent.com/aida-public/AB6AXuBfC3-DFWodYDYObAoJVBSfNQftgRIK5EvweDaUWy7texcgwP9atcArGBbsC_2BAy2ud3qg23sCjie6xSw2WR_fP-LqVKdO2N3qPN5shcmER3RvPj4xPaFnoPvtiN1P2uiPWS8-Hl5sgAx8Hii8RV8yxyMiNPGi7j6669i2Wkz3ihfYSuewvrNNM4BR14lC9ZN9TBAPR6aGJhaLie1LHxmjJaV0vKfxVv2hKSGC4fUmR-D6SH0XwM4FziM9Bblg2PyY70d432GS2Uc',
    ),
  ];

  @override
  List<Product> getProducts() => _products;

  @override
  List<Product> getProductsByCategory(String category) {
    if (category == 'Tümü') return _products;
    return _products.where((p) => p.category == category).toList();
  }

  @override
  List<String> getCategories() {
    return ['Tümü', 'Formalar', 'Antrenman', 'Aksesuar', 'Günlük Giyim'];
  }

  @override
  Product? getFeaturedProduct() => _products.firstOrNull;
}
