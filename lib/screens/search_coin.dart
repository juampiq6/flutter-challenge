import 'package:challenge/providers/coins_provider.dart';
import 'package:challenge/utils/validator.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:challenge/utils/utils.dart';

class SearchCoinTab extends StatelessWidget {
  final coinNameController = GlobalKey<FormFieldState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          Text("Please specify a coin name to add to your watchlist"),
          SizedBox(height: 10,),
          TextFormField(
            key: coinNameController,
            autofocus: true,
            validator: Validators.min1char,
          ),
          SizedBox(height: 10,),
          ElevatedButton.icon(
              onPressed: () {
                submit(context);
              },
              icon: Icon(Icons.search),
              label: Text("Search coin"))
        ],
      ),
    );
  }

  submit(BuildContext context) async {
    // we validate the text form field, displaying error if not
    final valid = coinNameController.currentState.validate();
    final name = coinNameController.currentState.value;
    if (valid) {
      // we loookup the coin in our list, through a coin provider method
      final message = await context.read<CoinProvider>().lookupCoin(name);
      // extension method to facilitate the snackbar showing
        context.showSnackbar(SnackBar(
          content: Text(message),
        ));
    }
  }
}
