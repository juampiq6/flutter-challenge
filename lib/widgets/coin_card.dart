import 'package:challenge/models/coin.dart';
import 'package:challenge/providers/coins_provider.dart';
import 'package:challenge/widgets/custom_net_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CoinCard extends StatelessWidget {
  final Coin coin;

  const CoinCard({Key key, this.coin}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50), color: Colors.green[300]),
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.all(5),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(100),
              child: CustomNetworkImage(
                url: coin.imageUrl,
                height: 50,
                width: 50,
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (coin.symbol != null)
                  Text(
                    coin.symbol,
                  ),
                if (coin.name != null)
                  Text(coin.name, style: TextStyle(fontSize: 18)),
                Text(
                  coin.id,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
          PriceContainer(coin: coin,),
          SizedBox(width: 10),
        ],
      ),
    );
  }
}

class PriceContainer extends StatelessWidget {
  final Coin coin;

  const PriceContainer({Key key, this.coin}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return !coin.fetchingUpdate
        ? Container(
            child: Text(
              "\$ ${coin.currentPriceInUsd?.toStringAsFixed(0)}",
              style: TextStyle(fontSize: 20),
            ),
          )
        : Container(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
  }
}
