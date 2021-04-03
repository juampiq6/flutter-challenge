import 'package:challenge/providers/coins_provider.dart';
import 'package:challenge/widgets/coin_card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MyCoinsTab extends StatefulWidget {
  @override
  _MyCoinsTabState createState() => _MyCoinsTabState();
}

class _MyCoinsTabState extends State<MyCoinsTab> {
  @override
  void initState() {
    super.initState();
    context.read<CoinProvider>().fetchAllCoinsData();
  }

  @override
  Widget build(BuildContext context) {
    final coins = context.watch<CoinProvider>().savedCoinsInAlpOrder;

    return ListView.separated(
        separatorBuilder: (_, i) => SizedBox(
              height: 10,
            ),
        itemCount: coins.length,
        itemBuilder: (_, i) => CoinCard(
              coin: coins[i],
            ));
  }
}
