import 'dart:convert';

import 'package:challenge/models/coin.dart';
import 'package:http/http.dart' as http;

class CoinHelper {
  static String apiUrl = "https://api.coingecko.com/api/v3";

  static Future<List<Coin>> fetchAllCoins() async {
    final res = await http.get(Uri.parse("$apiUrl/coins/list"));
    final j = json.decode(res.body);
    return List<Coin>.from((j as List).map((e) => Coin.fromJson(e)));
  }

  static Future<Coin> fetchCoinData(String id) async {
    final res = await http.get(Uri.parse(
        "$apiUrl/coins/$id?localization=false&tickers=false&market_data=true&community_data=false&developer_data=false&sparkline=false"));
    final j = json.decode(res.body);
    return Coin.fromJson(j as Map<String, dynamic>);
  }
}
