import 'package:flutter/material.dart';

typedef S Constructor<S>(
    Map<String, dynamic> d); //custom fromJson "constructor"

extension SnackBarExt on BuildContext {
  void showSnackbar(SnackBar sb) => ScaffoldMessenger.of(this).showSnackBar(sb);
}

abstract class Utils {
  static List<T> jsonToModelList<T>(
          Constructor<T> fromJsonCreator, dynamic json) =>
      List<T>.from(json.map((x) => fromJsonCreator(x)));

  static String coinImageUrl(String coinId, {size = 3}) {
    assert(size >= 1 && size <= 3);
    String sizeInString;
    switch (size) {
      case 1:
        sizeInString = "thumb";
        break;
      case 2:
        sizeInString = "small";
        break;
      case 3:
        sizeInString = "large";
        break;
    }
    return "https://assets.coingecko.com/coins/images/1/$sizeInString/$coinId.png";
  }
}
