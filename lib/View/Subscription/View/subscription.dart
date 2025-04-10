import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:pranks/Utils/const.dart';
import 'package:pranks/Utils/ccolors.dart';
import 'package:pranks/Controller/subscriptionController.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  final SubscriptionController controller = Get.put(SubscriptionController());
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: CColors.yellowGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
        ),
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Get.back(),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              backUrl,
              scale: 1.5,
            ),
          ),
        ),
        title: const Text(
          "Premium Access",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
            color: CColors.blackColor,
            wordSpacing: 1,
          ),
        ),
        actions: [
          // Add restore purchases button
          TextButton(
            onPressed: () {
              controller.restorePurchases();
              Get.snackbar(
                'Restoring Purchases',
                'Checking for previous purchases...',
                duration: const Duration(seconds: 2),
              );
            },
            child: const Text(
              'Restore',
              style: TextStyle(
                color: CColors.blackColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading.value) {
          return const Center(child: SizedBox(
            width: 30,
            height: 30,
            child: CircularProgressIndicator(
              strokeWidth: 7,
              color: CColors.yellowColor,
            )));
        }

        if (controller.isSubscribed.value) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green.shade100,
                  ),
                  child: const Icon(
                    Icons.check_circle,
                    color: Colors.green,
                    size: 64,
                  ),
                ),
                const SizedBox(height: 24),
                const Text(
                  'You\'re a Premium Prankster!',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 16),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 32),
                  child: Text(
                    'You have full access to all premium pranks and sound effects!',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),
                  ),
                ),
                const SizedBox(height: 32),
                ElevatedButton(
                  onPressed: () => Get.back(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: CColors.blackColor,
                    padding: const EdgeInsets.symmetric(
                      horizontal: 32,
                      vertical: 12,
                    ),
                  ),
                  child: const Text(
                    'Continue Pranking',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          );
        }

        final currentOffering = controller.offerings.value?.current;
        if (currentOffering == null || currentOffering.availablePackages.isEmpty) {
          return const Center(
            child: Text('No subscription packages available right now.'),
          );
        }

        return SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                "assets/images/premium_banner.png", // Make sure to add this asset
                height: 200,
                fit: BoxFit.cover,
              ),
              const SizedBox(height: 16),
              const Text(
                "Unlock All Premium Pranks",
                style: TextStyle(
                  fontSize: 28,
                  color: CColors.blackColor,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [

                    // Benefits section
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Column(
                        children: [
                          const Text(
                            "Premium Benefits:",
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          _buildBenefitRow(
                            Icons.lock_open,
                            "Unlock all premium prank sounds",
                          ),
                          _buildBenefitRow(
                            Icons.block,
                            "No advertisements",
                          ),
                          _buildBenefitRow(
                            Icons.new_releases,
                            "Early access to new pranks",
                          ),
                          _buildBenefitRow(
                            Icons.refresh,
                            "Regular content updates",
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 24),
                    
                    // Subscription options
                    ...currentOffering.availablePackages.asMap().entries.map((entry) {
                      final index = entry.key;
                      final package = entry.value;
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 12),
                        child: SubscriptionWidget(
                          title: package.storeProduct.title,
                          subtitle: package.storeProduct.description,
                          price: package.storeProduct.priceString,
                          isSelected: selectedIndex == index,
                          onTap: () => setState(() => selectedIndex = index),
                        ),
                      );
                    }),
                    
                    const SizedBox(height: 20),
                    
                    // Subscribe button
                    GestureDetector(
                      onTap: () {
                        if (selectedIndex >= 0 && selectedIndex < currentOffering.availablePackages.length) {
                          final package = currentOffering.availablePackages[selectedIndex];
                          controller.purchasePackage(package);
                        } else {
                          Get.snackbar(
                            'Selection Required',
                            'Please select a subscription plan',
                            backgroundColor: Colors.red.shade100,
                          );
                        }
                      },
                      child: Container(
                        height: 50,
                        width: double.infinity,
                        decoration: BoxDecoration(
                          color: CColors.blackColor,
                          borderRadius: BorderRadius.circular(32),
                          border: Border.all(color: CColors.blackColor, width: 2.0),
                        ),
                        child: const Center(
                          child: Text(
                            "Subscribe Now",
                            style: TextStyle(
                              fontSize: 22,
                              letterSpacing: 2,
                              color: CColors.whiteColor,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Terms text
                    const Text(
                      "Subscription will automatically renew. Cancel anytime through your app store settings.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
  
  Widget _buildBenefitRow(IconData icon, String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        children: [
          Icon(icon, color: Colors.green),
          const SizedBox(width: 12),
          Expanded(
            child: Text(
              text,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        ],
      ),
    );
  }
}

class SubscriptionWidget extends StatelessWidget {
  final String title;
  final String subtitle;
  final String price;
  final bool isSelected;
  final VoidCallback onTap;

  const SubscriptionWidget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.price,
    this.isSelected = false,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 100,
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isSelected ? CColors.blackColor : CColors.yellowColor,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: CColors.blackColor, width: 2.0),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? CColors.whiteColor : CColors.blackColor,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color: isSelected ? CColors.whiteColor : CColors.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(12)),
                color: isSelected ? CColors.whiteColor : CColors.blackColor,
              ),
              child: Text(
                price,
                style: TextStyle(
                  fontSize: 18,
                  color: isSelected ? CColors.blackColor : CColors.whiteColor,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
