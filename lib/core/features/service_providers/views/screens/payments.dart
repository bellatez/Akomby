import 'package:Akombi/core/Utils/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../common_widgets/fitness_button.dart';

class PaymentPage extends StatelessWidget {
  final TextEditingController phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LocalKeys.payment.tr, style: TextStyle(color: Colors.white),),
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
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
            ),
            SizedBox(height: 20),

            // Amount to be paid
            Center(
              child: Text(
                '1,000 XAF',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
            ),
            SizedBox(height: 40),

            // Phone Number Input
            Text(
              LocalKeys.enterPhoneNumber.tr,
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            SizedBox(height: 10),

            // Phone Number Text Field
            TextField(
              controller: phoneNumberController,
              keyboardType: TextInputType.phone,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'e.g. 677123456',
                labelText: 'Phone Number',
              ),
            ),
            SizedBox(height: 80),

            FitnessButton(
              title: LocalKeys.confirmPayment.tr,
              onTap: () {

              },),
          ],
        ),
      ),
    );
  }

  // Function to build payment method buttons

}
