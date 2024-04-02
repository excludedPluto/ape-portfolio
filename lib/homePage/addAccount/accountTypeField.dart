import 'package:ape_portfolio/homePage/addAccount/addAccount.dart';
import 'package:ape_portfolio/homePage/addAccount/customFieldWrapper.dart';
import 'package:flutter/material.dart';

class AccountTypeField extends StatelessWidget {
  final Function(AccountType) onAccountTypeChange;
  final AccountType accountType;

  const AccountTypeField(
      {super.key,
      required this.accountType,
      required this.onAccountTypeChange});

  @override
  Widget build(BuildContext context) {
    return CustomFieldWrapper(
        title: "계좌 종류",
        child: Row(
          children: [
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      onAccountTypeChange(AccountType.stock);
                    },
                    child: Text("주식"))),
            const SizedBox(width: 10),
            Expanded(
                child: ElevatedButton(
                    onPressed: () {
                      onAccountTypeChange(AccountType.saving);
                    },
                    child: Text("예금")))
          ],
        ));
  }
}
