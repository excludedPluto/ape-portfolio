import 'package:ape_portfolio/homePage/addAccount/customFieldWrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class StockItems extends StatelessWidget {
  const StockItems({super.key});

  @override
  Widget build(BuildContext context) {
    return CustomFieldWrapper(
        title: "종목",
        child: Column(
          children: [StockItem()],
        ));
  }
}

class StockItem extends StatefulWidget {
  @override
  State<StockItem> createState() => _StockItemState();
}

class _StockItemState extends State<StockItem> {
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
    return Row(
      children: [
        Expanded(
            flex: 2,
            child: TextField(
              decoration: const InputDecoration(filled: true, hintText: ""),
            )),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            controller: _controller,
            keyboardType: TextInputType.number,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
            decoration: const InputDecoration(filled: true, hintText: ""),
          ),
        ),
      ],
    );
  }
}
