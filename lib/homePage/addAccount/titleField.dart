import 'package:ape_portfolio/homePage/addAccount/customFieldWrapper.dart';
import 'package:flutter/material.dart';

class TitleField extends StatelessWidget {
  const TitleField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const CustomFieldWrapper(
      title: "계좌명",
      child: TextField(
        decoration: InputDecoration(filled: true, hintText: "사용하실 계좌명을 입력해주세요"),
      ),
    );
  }
}
