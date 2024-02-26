import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';

import '../../../payment_configurations.dart';

class PayWithGoogle extends StatelessWidget {
  final List<PaymentItem> items;
  const PayWithGoogle({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return GooglePayButton(
      paymentConfiguration:
          PaymentConfiguration.fromJsonString(defaultGooglePay),
      paymentItems: items,
      type: GooglePayButtonType.pay,
      margin: const EdgeInsets.only(top: 15.0),
      onPaymentResult: (result) =>
          debugPrint("GooglePay button Apply: pay Result $result"),
      loadingIndicator: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
