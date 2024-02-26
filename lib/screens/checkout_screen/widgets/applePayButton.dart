
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pay/pay.dart';
import '../../../payment_configurations.dart';

class PayWithApple extends StatelessWidget {
  final List<PaymentItem> items;
  const PayWithApple({super.key, required this.items});

  @override
  Widget build(BuildContext context) {
    return ApplePayButton(
      paymentConfiguration: PaymentConfiguration.fromJsonString(defaultApplePay),
      paymentItems: items,
      style: ApplePayButtonStyle.black,
      type: ApplePayButtonType.buy,
      margin: const EdgeInsets.only(top: 15.0),
      onPaymentResult: (result) => debugPrint("Apple pay button Apply pay Result"),
      loadingIndicator: const Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
