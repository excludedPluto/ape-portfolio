import 'package:ape_portfolio/homePage/addAccount/customFieldWrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:uuid/uuid.dart';

class StockItems extends StatefulWidget {
  const StockItems({super.key});

  @override
  State<StockItems> createState() => _StockItemsState();
}

class _StockItemsState extends State<StockItems> {
  final List<Map<String, String>> _stockItems = [
    {'id': const Uuid().v4(), "stock": "", "alloc": ""}
  ];

  void addStockCount() {
    setState(() {
      _stockItems.add({'id': const Uuid().v4(), "stock": "", "alloc": ""});
    });
    print(_stockItems);
  }

  void deleteStockCount(String? id) {
    if (id == null || _stockItems.length == 1) {
      return;
    }
    setState(() {
      _stockItems.removeWhere((element) => element['id'] == id);
    });
    print(_stockItems);
  }

  void updateStockItem(String? id, String key, String value) {
    if (id == null) {
      return;
    }
    setState(() {
      _stockItems
          .firstWhere((element) => element['id'] == id)
          .update(key, (v) => value);
    });
  }

  @override
  Widget build(BuildContext context) {
    return CustomFieldWrapper(
        title: "종목",
        child: Column(
          children: [
            for (var item in _stockItems)
              StockItem(
                key: item['id'] != null ? Key(item['id']!) : null,
                item: item,
                isLastOne: _stockItems.length == 1,
                updateStockItem: updateStockItem,
                deleteStockCount: deleteStockCount,
              ),
            IconButton.outlined(
                onPressed: () {
                  addStockCount();
                },
                icon: const Icon(Icons.add))
          ],
        ));
  }
}

class StockItem extends StatefulWidget {
  final Map<String, String> item;
  final bool isLastOne;
  final Function(String?, String, String) updateStockItem;
  final Function(String?) deleteStockCount;

  const StockItem(
      {super.key,
      required this.item,
      required this.updateStockItem,
      required this.deleteStockCount,
      required this.isLastOne});

  @override
  State<StockItem> createState() => _StockItemState();
}

class _StockItemState extends State<StockItem> {
  late Map<String, String> item;
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller.addListener(_limitValue);
    item = widget.item;
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
    return Padding(
      padding: const EdgeInsets.only(top: 0, bottom: 8, left: 0, right: 0),
      child: Row(
        children: [
          const Expanded(
              flex: 2,
              child: TextField(
                decoration: InputDecoration(filled: true, hintText: ""),
              )),
          const SizedBox(width: 10),
          Expanded(
            child: TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.digitsOnly,
              ],
              onChanged: (value) {
                widget.updateStockItem(widget.item['id'], 'alloc', value);
              },
              decoration: const InputDecoration(filled: true, hintText: ""),
            ),
          ),
          IconButton(
              onPressed: () {
                widget.deleteStockCount(widget.item['id']);
              },
              icon: widget.isLastOne
                  ? const Icon(null)
                  : const Icon(Icons.remove))
        ],
      ),
    );
  }
}
