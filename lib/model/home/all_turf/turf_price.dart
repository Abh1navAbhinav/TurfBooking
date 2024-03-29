class TurfPrice {
  TurfPrice({
    this.morningPrice,
    this.afternoonPrice,
    this.eveningPrice,
  });

  int? morningPrice;
  int? afternoonPrice;
  int? eveningPrice;

  factory TurfPrice.fromJson(Map<String, dynamic> json) => TurfPrice(
        morningPrice: json["morning_price"],
        afternoonPrice: json["afternoon_price"],
        eveningPrice: json["evening_price"],
      );

  Map<String, dynamic> toJson() => {
        "morning_price": morningPrice,
        "afternoon_price": afternoonPrice,
        "evening_price": eveningPrice,
      };
}
