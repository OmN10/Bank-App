import 'package:bank_appp/controller/card.controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateCardDialog extends StatelessWidget {
  final controller = Get.find<CardController>();
  final cardNumber = TextEditingController();
  final cardHolder = TextEditingController();
  final expiry = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final card = controller.card.value;
    cardNumber.text = card.cardNumber;
    cardHolder.text = card.cardHolder;
    expiry.text = card.expiry;

    return AlertDialog(
      title: Text("Update Card Details"),
      content: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: cardNumber,
              decoration: InputDecoration(labelText: "Card Number"),
            ),
            TextField(
              controller: cardHolder,
              decoration: InputDecoration(labelText: "Card Holder"),
            ),
            TextField(
              controller: expiry,
              decoration: InputDecoration(labelText: "Expiry"),
            ),
          ],
        ),
      ),
      actions: [
        TextButton(
          onPressed: () {
            controller.updateCard(
              cardNumber.text,
              cardHolder.text,
              expiry.text,
            );
            Get.back();
          },
          child: Text("Save"),
        ),
      ],
    );
  }
}
