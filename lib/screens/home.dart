import 'package:challenge/providers/coins_provider.dart';
import 'package:challenge/screens/my_coins.dart';
import 'package:challenge/screens/search_coin.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coin Challenge"),
        automaticallyImplyLeading: false,
        actions: [
          IconButton(icon: Icon(Icons.find_replace_outlined), onPressed: () {
            context.read<CoinProvider>().fetchAllCoinsData();
          })
        ],
      ),
      body: DefaultTabController(
        length: 2,
        child: Column(
          children: [
            TabBar(tabs: [
              Tab(
                icon: Icon(Icons.search),
                text: "Search coin",
              ),
              Tab(
                icon: Icon(Icons.copyright_outlined),
                text: "My coins",
              )
            ]),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: TabBarView(children: [
                  SearchCoinTab(),
                  MyCoinsTab()
                ]
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
