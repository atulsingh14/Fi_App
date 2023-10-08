import 'package:fi/common/color_sheme.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseRow extends StatelessWidget {
  final String title;
  final String budget;

  const ExpenseRow({Key? key, required this.title, required this.budget})
      : super(key: key);

  String formatCurrency(String amount) {
    final currencyFormatter = NumberFormat.currency(
      locale: 'hi_IN', // Use 'hi_IN' for Hindi formatting
      symbol: '₹ ',
      decimalDigits: 0, // Set decimalDigits to 0 for no decimal points
    );

    return currencyFormatter.format(double.tryParse(amount) ?? 0.0);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {},
        child: Container(
          height: 64,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            border: Border.all(
              color: TColor.border.withOpacity(0.15),
            ),
            borderRadius: BorderRadius.circular(16),
          ),
          alignment: Alignment.center,
          child: Row(
            children: [
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.white, // Set the text color
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              const SizedBox(
                width: 8,
              ),
              Text(
                formatCurrency(budget),
                style: const TextStyle(
                  color: Colors.white, // Set the text color
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
