import 'package:get/get.dart';
import 'package:in_app_purchase/in_app_purchase.dart';

class SubscriptionController extends GetxController {
  final _inAppPurchase = InAppPurchase.instance;
  RxBool isPremium = false.obs;
  RxList<ProductDetails> products = <ProductDetails>[].obs;

  @override
  void onInit() {
    super.onInit();
    initStore();
  }

  Future<void> initStore() async {
    final available = await _inAppPurchase.isAvailable();
    if (!available) return;

    const ids = {'premium_subscription'};
    final response = await _inAppPurchase.queryProductDetails(ids);
    products.assignAll(response.productDetails);

    _inAppPurchase.purchaseStream.listen((purchaseDetails) {
      _handlePurchase(purchaseDetails);
    });
  }

  Future<void> buySubscription(ProductDetails product) async {
    final purchaseParam = PurchaseParam(productDetails: product);
    await _inAppPurchase.buyNonConsumable(purchaseParam: purchaseParam);
  }

  void _handlePurchase(List<PurchaseDetails> purchaseDetails) {
    for (var purchase in purchaseDetails) {
      if (purchase.status == PurchaseStatus.purchased) {
        isPremium.value = true;
      }
    }
  }
}