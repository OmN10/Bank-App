import 'package:bank_appp/modal/card.model.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class CardController extends GetxController {
  var card =
      CardModel(
        cardNumber: "0000 0000 0000 0000",
        cardHolder: "Your Name",
        expiry: "MM/YY",
      ).obs;

  @override
  void onInit() {
    super.onInit();
    loadCard();
  }

  void toggleVisibility() {
    card.update((c) => c!.isVisible = !c.isVisible);
    saveCard();
  }

  Future<void> loadCard() async {
    final prefs = await SharedPreferences.getInstance();
    String? data = prefs.getString('card');
    if (data != null) {
      card.value = CardModel.fromJson(jsonDecode(data));
    }
  }

  Future<void> saveCard() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('card', jsonEncode(card.value.toJson()));
  }

  void updateCard(String number, String holder, String expiry) {
    card.update((c) {
      c!.cardNumber = number;
      c.cardHolder = holder;
      c.expiry = expiry;
    });
    saveCard();
  }
}
