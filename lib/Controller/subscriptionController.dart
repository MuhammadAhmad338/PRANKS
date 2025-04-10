import 'package:get/get.dart';
import 'package:flutter/foundation.dart';
import 'package:purchases_flutter/purchases_flutter.dart';
import 'package:get_storage/get_storage.dart';

class SubscriptionController extends GetxController {
  final isLoading = true.obs;
  final isSubscribed = false.obs;
  final offerings = Rxn<Offerings>();
  
  // Track the premium status
  final hasPremium = false.obs;
  
  // Storage key constants
  static const String _keyIsPremium = 'is_premium';
  
  // Local storage instance
  final _storage = GetStorage();
  
  // List of premium prank types - you can adjust this as needed
  final premiumPrankTypes = <String>[
    'Gun Sound',
    'Piano Sound',
    'Glass Sound',
    'Scissors Sound',
  ].obs;
  
  @override
  void onInit() {
    super.onInit();
    _loadSavedSubscriptionState();
    initPurchases();
  }
  
  /// Loads the saved subscription state from local storage
  void _loadSavedSubscriptionState() {
    final savedPremiumStatus = _storage.read<bool>(_keyIsPremium);
    if (savedPremiumStatus != null) {
      hasPremium.value = savedPremiumStatus;
      isSubscribed.value = savedPremiumStatus;
      debugPrint('Loaded saved subscription state: $savedPremiumStatus');
    }
  }
  
  /// Saves the current subscription state to local storage
  void _saveSubscriptionState() {
    _storage.write(_keyIsPremium, hasPremium.value);
    debugPrint('Saved subscription state: ${hasPremium.value}');
  }
  
  Future<void> initPurchases() async {
    isLoading.value = true;
    
    try {
      await Purchases.setDebugLogsEnabled(kDebugMode);
      
      const apiKey = 'goog_FJFozujwLDkGNBZHdgkNFbABgLy';
      
      await Purchases.setup(apiKey);
      
      // Update purchase status from server
      await _updatePurchaseStatus();
      
      await _loadOfferings();
    } catch (e) {
      debugPrint('Error initializing purchases: $e');
    } finally {
      isLoading.value = false;
    }
  }
  
  Future<void> _updatePurchaseStatus() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      final isPro = customerInfo.entitlements.active.containsKey('gold');
      
      // Update the subscription status
      isSubscribed.value = isPro;
      hasPremium.value = isPro;
      
      // Save the updated state to local storage
      _saveSubscriptionState();
    } catch (e) {
      debugPrint('Error checking purchase status: $e');
    }
  }
  
  Future<void> _loadOfferings() async {
    try {
      offerings.value = await Purchases.getOfferings();
    } catch (e) {
      debugPrint('Error loading offerings: $e');
    }
  }
  
  Future<void> purchasePackage(Package package) async {
    try {
      isLoading.value = true;
      final customerInfo = await Purchases.purchasePackage(package);
      
      isSubscribed.value = customerInfo.entitlements.active.containsKey('gold');
      hasPremium.value = isSubscribed.value;
      
      // Save the updated state to local storage
      _saveSubscriptionState();
    } catch (e) {
      debugPrint('Error during purchase: $e');
    } finally {
      isLoading.value = false;
    }
  }
  
  bool isPrankLocked(String prankType) {
    if (hasPremium.value) return false;
    
    return premiumPrankTypes.contains(prankType);
  }
  
  void restorePurchases() async {
    try {
      isLoading.value = true;
      final customerInfo = await Purchases.restorePurchases();
      isSubscribed.value = customerInfo.entitlements.active.containsKey('gold');
      hasPremium.value = isSubscribed.value;
      
      // Save the updated state to local storage
      _saveSubscriptionState();
    } catch (e) {
      debugPrint('Error restoring purchases: $e');
    } finally {
      isLoading.value = false;
    }
  }
  
  /// Verify subscription status with the server periodically or on app resume
  Future<void> verifySubscription() async {
    try {
      final customerInfo = await Purchases.getCustomerInfo();
      final isPro = customerInfo.entitlements.active.containsKey('gold');
      
      if (isPro != hasPremium.value) {
        // Server status is different from local status
        isSubscribed.value = isPro;
        hasPremium.value = isPro;
        _saveSubscriptionState();
      }
    } catch (e) {
      debugPrint('Error verifying subscription: $e');
    }
  }
}