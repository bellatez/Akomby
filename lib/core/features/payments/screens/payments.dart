import 'package:Akombi/core/Utils/text_strings.dart';
import 'package:Akombi/core/features/service_providers/views/screens/provider_listings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common_widgets/fitness_button.dart';

class PaymentPage extends StatefulWidget {
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  final TextEditingController phoneNumberController = TextEditingController();

  int selectedPayment = 0;

  Widget CustomPaymentCardButton(String assetName, int index) {
    return OutlinedButton(
      onPressed: () {
        setState(() {
          selectedPayment = index;
        });
      },
      style: OutlinedButton.styleFrom(
        padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
        side: BorderSide(
            width: (selectedPayment == index) ? 2.0 : 0.5,
            color: (selectedPayment == index)
                ? Colors.green
                : Colors.blue.shade600),
      ),
      child: Stack(
        children: [
          Center(
            child: Image.asset(
              assetName,
              fit: BoxFit.contain,
              width: 120,
              height: 120,
            ),
          ),
          if (selectedPayment == index)
            Positioned(
              top: 5,
              right: 5,
              child: Image.asset(
                "assets/images/logos/tick-circle.png",
                width: 25,
                fit: BoxFit.cover,
              ),
            ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalKeys.payment.tr, style: const TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Payment Info
            Text(
              LocalKeys.unlockPayment.tr,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            const SizedBox(height: 20),

            // Amount to be paid
            const Center(
              child: Text(
                '1,000 XAF',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            const SizedBox(height: 40),

            const Text(
              'Select your payment method',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: CustomPaymentCardButton("assets/images/logos/OM.jpg", 0),
                ),
                const SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: CustomPaymentCardButton(
                      "assets/images/logos/momo.png", 1),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),

            // Phone Number Input
            Text(
              LocalKeys.enterPhoneNumber.tr,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 10),

            // Phone Number Text Field
            TextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'e.g. 677123456',
                labelText: 'Phone Number',
              ),
            ),
            const SizedBox(height: 80),

            FitnessButton(
              title: LocalKeys.confirmPayment.tr,
              onTap: () {
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (_) {
                      return ProviderListings();
                    },
                  ),
                );
              },),
          ],
        ),
      ),
    );
  }
}
