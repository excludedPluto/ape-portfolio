import 'package:ape_portfolio/homePage/accountList.dart';
import 'package:ape_portfolio/homePage/addAccount/addAccount.dart';
import 'package:ape_portfolio/homePage/totalAssetBox.dart';
import 'package:flutter/material.dart';

class Portfolio extends StatelessWidget {
  const Portfolio({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Column(children: [TotalAsset()]),
      floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute<Widget>(builder: (BuildContext context) {
              return const AddAccount();
            }));
          },
          child: const Icon(Icons.add)),
    );
  }
}

class TotalAsset extends StatelessWidget {
  const TotalAsset({super.key});

  @override
  Widget build(BuildContext context) {
    return const SafeArea(
        child: Column(children: [TotalAssetBox(), AccountList()]));
  }
}
