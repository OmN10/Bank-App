import 'package:bank_appp/controller/card.controller.dart';
import 'package:bank_appp/view/updatecardscreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CardScreen extends StatelessWidget {
  final CardController controller = Get.put(CardController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("My Card", style: TextStyle(fontSize: 23,fontWeight: FontWeight.bold))),
      body: SingleChildScrollView(
        child: Center(
          child: Obx(() {
            final card = controller.card.value;
            return Card(
              elevation: 8,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              color: Colors.deepPurple,
              margin: EdgeInsets.all(16),
              child: Container(
                width: double.infinity,
                height: 240,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        icon: Icon(Icons.edit, color: Colors.white),
                        onPressed:
                            () => showDialog(
                              context: context,
                              builder: (_) => UpdateCardDialog(),
                            ),
                      ),
                    ),
                    Text(
                      card.isVisible ? card.cardNumber : "**** **** **** ****",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                        letterSpacing: 2,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Card Holder",
                      style: TextStyle(color: Colors.white70, fontSize: 12),
                    ),
                    Text(
                      card.cardHolder,
                      style: TextStyle(color: Colors.white, fontSize: 18),
                    ),
                    Spacer(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Expiry",
                              style: TextStyle(
                                color: Colors.white70,
                                fontSize: 12,
                              ),
                            ),
                            Text(
                              card.expiry,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            IconButton(
                              icon: Icon(
                                card.isVisible
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.white,
                              ),
                              onPressed: controller.toggleVisibility,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
