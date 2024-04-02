import 'package:ape_portfolio/homePage/addAccount/customFieldWrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AllocationField extends StatefulWidget {
  const AllocationField({super.key});

  @override
  State<AllocationField> createState() => _AllocationFieldState();
}

class _AllocationFieldState extends State<AllocationField> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_limitValue);
  }

  @override
  void dispose() {
    _controller.removeListener(_limitValue);
    _controller.dispose();
    super.dispose();
  }

  void _limitValue() {
    String text = _controller.text;
    if (text.isEmpty) return;
    int? value = int.tryParse(text);
    if (value != null && (value < 0 || value > 100)) {
      value = (value < 0) ? 0 : 100;
      _controller.text = value.toString();
      _controller.selection = TextSelection.fromPosition(
          TextPosition(offset: _controller.text.length));
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomFieldWrapper(
      title: "전체 비중",
      child: TextField(
        controller: _controller,
        keyboardType: TextInputType.number,
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.digitsOnly,
        ],
        decoration: const InputDecoration(
            filled: true, hintText: "전체 자산 중 보유할 비중을 입력하세요 (정수만)"),
      ),
    );
  }
}
