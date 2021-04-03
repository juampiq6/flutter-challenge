import 'package:challenge/models/coin.dart';
import 'package:challenge/services/coin_repository_helper.dart';
import 'package:challenge/services/my_preferences.dart';
import 'package:flutter/cupertino.dart';

class CoinProvider extends ChangeNotifier {
  List<Coin> _allCoins = [];
  List<Coin> _savedCoins = [];
  List<Coin> get savedCoins => _savedCoins;
  List<Coin> get savedCoinsInAlpOrder =>
      _savedCoins..sort((first, sec) => first.id.compareTo(sec.id));

  CoinProvider() {
    CoinRepositoryHelper.fetchAllCoins().then((coins) {
      _allCoins = coins;
      restoreSavedCoins();
      notifyListeners();
    });
  }

  restoreSavedCoins() {
    // get my already saved coins ids
    final list = MyPreferences.getCoinsList();
    if (list.isNotEmpty) {
      // map the ids with the coin models and set the list
      _savedCoins = _allCoins.where((coin) => list.contains(coin.id)).toList();
    }
  }

  void fetchAllCoinsData() async {
    for (var i = 0; i < _savedCoins.length; i++) {
      // mark coin as fetching price
      _savedCoins[i].fetchingUpdate = true;
      notifyListeners();
    }
    for (var i = 0; i < _savedCoins.length; i++) {
      fetchCoinData(_savedCoins[i].id).then((c) {
        // update coin data
        _savedCoins[i] = c;
        // mark coin as already fetched
        _savedCoins[i].fetchingUpdate = false;
        notifyListeners();
      });
    }
  }

  // this method can be improved to choose the coin that got the most matches with regexp
  Future<String> lookupCoin(String name) async {
    // search coin that matches in the complete list
    final coin =
        _allCoins.firstWhere((c) => c.matches(name), orElse: () => null);
    // if a coin is found
    if (coin != null) {
      // and isnt already saved
      if (!_savedCoins.any((sc) => sc.id == coin.id)) {
        await _saveCoin(coin);
        notifyListeners();
        return "$name succesfully added to my coins!";
      } else
        return "$name is already added to your coin list";
    }
    return "Sorry, we could not find a coin with name \'$name\'";
  }

  Future<bool> _saveCoin(Coin c) async {
    // adds coin to provider list
    _savedCoins.add(c);
    // adds coin to shared preferences
    return await MyPreferences.addToCoinList(c.id);
  }

  Future<Coin> fetchCoinData(String coinId) {
    return CoinRepositoryHelper.fetchCoinData(coinId);
  }
}
