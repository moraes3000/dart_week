import 'package:dart_week/app/core/ui/widgets/vakinha_rounded_button.dart';
import 'package:flutter/material.dart';

import '../formatter_helper.dart';

class PlusMinusBox extends StatelessWidget {
  final bool elevated;
  final Color? backgroundColor;
  final String? label;
  final int quantity;
  final double price;
  final VoidCallback minusCallback;
  final VoidCallback plusCallback;
  final bool calculateTotal;

  const PlusMinusBox({
    Key? key,
    required this.quantity,
    required this.price,
    required this.minusCallback,
    required this.plusCallback,
    this.elevated = false,
    this.backgroundColor,
    this.label,
    this.calculateTotal = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: elevated ? 5 : 0,
      borderRadius: BorderRadius.circular(20),
      shadowColor: Colors.black26,
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(10),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Visibility(
              visible: label != null,
              child: Text(
                label ?? '',
                style: const TextStyle(
                  fontSize: 15,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            VakinhaRoundedButton(onPressed: minusCallback, label: '-'),
            Text('$quantity'),
            VakinhaRoundedButton(onPressed: plusCallback, label: '+'),
            const Spacer(),
            Container(
              margin: const EdgeInsets.only(left: 20, right: 20),
              constraints: const BoxConstraints(
                minHeight: 70,
              ),
              child: Text(
                FormatterHelper.formatcurrency(
                    calculateTotal ? price * quantity : price),
              ),
            )
          ],
        ),
      ),
    );
  }
}
