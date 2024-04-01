import 'package:flutter/material.dart';

class AccountList extends StatelessWidget {
  const AccountList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("계좌1"),
              Text("50% / 주식"),
            ],
          ),
          subtitle: Text(
            "1,000,000원",
            textAlign: TextAlign.end,
          ),
        ),
        Divider(
          height: 10,
          indent: 10,
          endIndent: 10,
        ),
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("계좌1"),
              Text("50% / 주식"),
            ],
          ),
          subtitle: Text(
            "1,000,000원",
            textAlign: TextAlign.end,
          ),
        )
      ],
    );
  }
}
