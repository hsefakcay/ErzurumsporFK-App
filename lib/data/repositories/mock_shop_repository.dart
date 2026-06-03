import '../../core/constants/app_constants.dart';
import '../../domain/models/product.dart';
import '../../domain/repositories/repositories.dart';

/// Mock data source — IShopRepository implementation.
/// Lists local asset jersey images as a product showcase.
class MockShopRepository implements IShopRepository {
  static const _products = [
    Product(
      id: 'forma-1',
      name: 'Efsane Çubuklu Forma',
      category: 'Formalar',
      localAssetPath: AppAssets.productEfsaneCubuklu,
      description: 'Efsane çubuklu tasarımıyla Erzurumspor FK\'nın ikonik forması.',
      isNew: true,
    ),
    Product(
      id: 'forma-2',
      name: 'Bahar Forması',
      category: 'Formalar',
      localAssetPath: AppAssets.productBahar,
      description: 'Bahar sezonuna özel tasarlanmış yeni sezon forması.',
    ),
    Product(
      id: 'forma-3',
      name: 'Güz Forması',
      category: 'Formalar',
      localAssetPath: AppAssets.productGuz,
      description: 'Güz sezonuna özel tasarlanmış yeni sezon forması.',
    ),
    Product(
      id: 'forma-4',
      name: 'Kış Forması',
      category: 'Formalar',
      localAssetPath: AppAssets.productKis,
      description: 'Kış sezonuna özel tasarlanmış yeni sezon forması.',
    ),
  ];

  @override
  List<Product> getProducts() => _products;

  @override
  Product? getFeaturedProduct() =>
      _products.where((p) => p.id == 'forma-1').firstOrNull;

  @override
  String getStoreUrl() => AppUrls.store;
}
