import 'package:flutter/material.dart';

class TotalAssetBox extends StatelessWidget {
  const TotalAssetBox({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
        ),
        child: Column(
          children: [
            const Padding(
                padding:
                    EdgeInsets.only(top: 28, left: 15, right: 15, bottom: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("총 자산",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w700,
                              fontSize: 16.0)),
                      Text(
                        "2,000,000원",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w700,
                            fontSize: 28.0),
                        textAlign: TextAlign.right,
                      )
                    ])),
            Padding(
                padding: const EdgeInsets.only(
                    top: 0, left: 15, right: 16, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {}, child: const Text("자산 통계"))),
                    const SizedBox(width: 10),
                    Expanded(
                        child: ElevatedButton(
                            onPressed: () {}, child: const Text("추가 납입")))
                  ],
                ))
          ],
        ));
  }
}
