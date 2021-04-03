import 'package:challenge/models/image.dart';
import 'package:challenge/utils/utils.dart';
import 'package:flutter/foundation.dart';
import 'package:json_annotation/json_annotation.dart';

part 'coin.g.dart';

@JsonSerializable()
class Coin {
  final String id;
  final String symbol;
  final String name;
  @JsonKey(required: false, fromJson: Image.fromJson, nullable: true)
  final Image image;
  @JsonKey(required: false, fromJson: Coin.currentPriceFromJson, name: "market_data", nullable: true)
  final double currentPriceInUsd;
  @JsonKey(ignore: true)
  bool fetchingUpdate = true;

  Coin(
      {this.currentPriceInUsd,
      @required this.id,
      @required this.symbol,
      @required this.name,
      this.image});

  String get imageUrl => image == null ? Utils.coinImageUrl(id) : image.small;

  bool matches(String query) {
    final q = query.toLowerCase();
    // this method can be improved to search for name or symbol, or to return number of coincidence in a regexp
    return id == q;
  }

  factory Coin.fromJson(Map<String, dynamic> json) => _$CoinFromJson(json);
  Map<String, dynamic> toJson() => _$CoinToJson(this);

  static double currentPriceFromJson(Map<String, dynamic> json) =>
      json != null ? (json['current_price']['usd'] as num).toDouble() : null;
}
