// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'coin.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Coin _$CoinFromJson(Map<String, dynamic> json) {
  return Coin(
    currentPriceInUsd:
        Coin.currentPriceFromJson(json['market_data'] as Map<String, dynamic>),
    id: json['id'] as String,
    symbol: json['symbol'] as String,
    name: json['name'] as String,
    image: Image.fromJson(json['image'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$CoinToJson(Coin instance) => <String, dynamic>{
      'id': instance.id,
      'symbol': instance.symbol,
      'name': instance.name,
      'image': instance.image,
      'market_data': instance.currentPriceInUsd,
    };
