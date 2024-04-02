import 'package:ape_portfolio/homePage/addAccount/accountTypeField.dart';
import 'package:ape_portfolio/homePage/addAccount/allocationField.dart';
import 'package:ape_portfolio/homePage/addAccount/stockItems.dart';
import 'package:ape_portfolio/homePage/addAccount/titleField.dart';
import 'package:flutter/material.dart';

class AddAccount extends StatefulWidget {
  const AddAccount({super.key});

  @override
  State<AddAccount> createState() => _AddAccountState();
}

enum AccountType { stock, saving }

class _AddAccountState extends State<AddAccount> {
  var _accountType = AccountType.stock;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("계좌 추가")),
        body: SingleChildScrollView(
            child: Column(
          children: [
            TitleField(),
            AllocationField(),
            AccountTypeField(
                accountType: _accountType,
                onAccountTypeChange: (AccountType accountType) {
                  setState(() {
                    _accountType = accountType;
                  });
                }),
            if (_accountType == AccountType.stock) StockItems()
          ],
        )));
  }
}
