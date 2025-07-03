class CardModel {
  String cardNumber;
  String cardHolder;
  String expiry;
  bool isVisible;
  bool isLocked;

  CardModel({
    required this.cardNumber,
    required this.cardHolder,
    required this.expiry,
    this.isVisible = false,
    this.isLocked = false,
  });

  Map<String, dynamic> toJson() => {
    "cardNumber": cardNumber,
    "cardHolder": cardHolder,
    "expiry": expiry,
    "isVisible": isVisible,
    "isLocked": isLocked,
  };

  factory CardModel.fromJson(Map<String, dynamic> json) {
    return CardModel(
      cardNumber: json["cardNumber"],
      cardHolder: json["cardHolder"],
      expiry: json["expiry"],
      isVisible: json["isVisible"] ?? false,
      isLocked: json["isLocked"] ?? false,
    );
  }
}
