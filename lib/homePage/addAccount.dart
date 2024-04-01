import 'package:flutter/material.dart';

class AddAccount extends StatelessWidget {
  const AddAccount({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("계좌 추가")),
        body: const Column(
          children: [CustomField()],
        ));
  }
}

// 주석
class CustomField extends StatelessWidget {
  const CustomField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("계좌명"),
          Padding(
            padding:
                const EdgeInsets.only(top: 8.0, left: 0, right: 0, bottom: 0),
            child: TextField(
              decoration:
                  InputDecoration(filled: true, hintText: "사용하실 계좌명을 입력해주세요."),
            ),
          )
        ],
      ),
    );
  }
}
