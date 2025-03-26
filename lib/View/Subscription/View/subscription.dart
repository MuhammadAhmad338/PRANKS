// import 'package:get/get.dart';
// import '../../../Utils/ccolors.dart';
// import 'package:flutter/material.dart';
// import 'package:pranks/Controller/subscriptionController.dart';

// class SubscriptionPage extends StatefulWidget {
//   const SubscriptionPage({super.key});

//   @override
//   State<SubscriptionPage> createState() => _SubscriptionPageState();
// }

// class _SubscriptionPageState extends State<SubscriptionPage> {
//   final SubscriptionController controller = Get.find<SubscriptionController>();

//   @override
//   void initState() {
//     super.initState();
//     controller.initPurchases();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Premium Features',
//             style: TextStyle(
//                 fontWeight: FontWeight.bold, fontSize: 24, letterSpacing: 1)),
//         backgroundColor: CColors.yellowColor,
//       ),
//       body: Obx(() {
//         if (controller.isLoading.value) {
//           return const Center(child: CircularProgressIndicator());
//         }

//         if (controller.isSubscribed.value) {
//           return const Center(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.center,
//               children: [
//                 Icon(Icons.check_circle, color: Colors.green, size: 64),
//                 SizedBox(height: 16),
//                 Text(
//                   'Premium Member',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                 ),
//                 SizedBox(height: 8),
//                 Text('You have access to all premium features!'),
//               ],
//             ),
//           );
//         }

//         final currentOffering = controller.offerings.value?.current;
//         if (currentOffering == null ||
//             currentOffering.availablePackages.isEmpty) {
//           return const Center(
//               child: Text('No subscription packages available right now.'));
//         }

//         return SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.stretch,
//               children: [
//                 const Text(
//                   'Unlock Premium Features',
//                   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   textAlign: TextAlign.center,
//                 ),
//                 const SizedBox(height: 20),
//                 ...currentOffering.availablePackages.map((package) {
//                   return Card(
//                     elevation: 4,
//                     margin: const EdgeInsets.symmetric(vertical: 8),
//                     child: InkWell(
//                       onTap: () => controller.purchasePackage(package),
//                       child: Padding(
//                         padding: const EdgeInsets.all(16),
//                         child: Column(
//                           children: [
//                             Text(
//                               package.storeProduct.title,
//                               style: const TextStyle(
//                                 fontSize: 18,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             const SizedBox(height: 8),
//                             Text(
//                               package.storeProduct.description,
//                               textAlign: TextAlign.center,
//                             ),
//                             const SizedBox(height: 12),
//                             Text(
//                               package.storeProduct.priceString,
//                               style: const TextStyle(
//                                 fontSize: 20,
//                                 color: Colors.purple,
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   );
//                 }),
//               ],
//             ),
//           ),
//         );
//       }),
//     );
//   }
// }
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:in_app_purchase/in_app_purchase.dart';
import 'package:pranks/Utils/ccolors.dart';
import 'package:pranks/Utils/const.dart';
import '../../../Controller/subscriptionController.dart';

class SubscriptionPage extends StatefulWidget {
  const SubscriptionPage({super.key});

  @override
  State<SubscriptionPage> createState() => _SubscriptionPageState();
}

class _SubscriptionPageState extends State<SubscriptionPage> {
  int selectedIndex = -1;

  @override
  void initState() {
    super.initState();
    final controller = Get.find<SubscriptionController>();
    controller.initStore();
  }

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
                  height: 15,
                  width: 15,
                ),
              )),
          title: const Text("Subscription",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
                color: CColors.blackColor,
                wordSpacing: 1,
              ))),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Image.asset(
              "",
              scale: 4,
            ),
            const Text("Get Premium",
                style: TextStyle(
                  fontSize: 30,
                  color: CColors.blackColor,
                  fontWeight: FontWeight.bold,
                )),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const Text(
                    "Choose Your Prankster Plan!",
                    style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 5),
                  const Text(
                    "Unlock all premium pranks and sound effects",
                    style: TextStyle(
                      fontSize: 16,
                      color: CColors.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  SubscriptionWidget(
                    title: "1 Month Prankster",
                    subtitle: "Access to all premium pranks and sound effects",
                    price: "\$ 12.44",
                    isSelected: selectedIndex == 0,
                    onTap: () => setState(() => selectedIndex = 0),
                  ),
                  const SizedBox(height: 20),
                  SubscriptionWidget(
                    title: "6 Months Master Prankster",
                    subtitle: "Save 30% + Exclusive monthly prank ideas",
                    price: "\$ 10.44",
                    isSelected: selectedIndex == 1,
                    onTap: () => setState(() => selectedIndex = 1),
                  ),
                  const SizedBox(height: 20),
                  SubscriptionWidget(
                    title: "12 Months Prank Legend",
                    subtitle: "Best value! Save 50% + VIP prank content",
                    price: "\$ 8.44",
                    isSelected: selectedIndex == 2,
                    onTap: () => setState(() => selectedIndex = 2),
                  ),
                  const SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      if (selectedIndex >= 0) {
                        final controller = Get.find<SubscriptionController>();
                        final product = ProductDetails(
                          id: controller.products[selectedIndex].id,
                          title: controller.products[selectedIndex].title,
                          description:
                              controller.products[selectedIndex].description,
                          price: "55",
                          rawPrice: 123,
                          currencyCode:
                              controller.products[selectedIndex].currencyCode,
                        );
                        controller.buySubscription(
                            controller.products[selectedIndex]);
                      }
                    },
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: CColors.blackColor,
                        borderRadius: BorderRadius.circular(32),
                        border:
                            Border.all(color: CColors.blackColor, width: 2.0),
                      ),
                      child: const Center(
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            fontSize: 22,
                            letterSpacing: 2,
                            color: CColors.whiteColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
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
                      color:
                          isSelected ? CColors.whiteColor : CColors.blackColor,
                    ),
                  ),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 14,
                      color:
                          isSelected ? CColors.whiteColor : CColors.blackColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            //Show the text of the price of the dollar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(12)),
                  color: isSelected ? CColors.whiteColor : CColors.blackColor),
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
