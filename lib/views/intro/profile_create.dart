import 'package:fi/common/color_sheme.dart';
import 'package:fi/components/primary_btn.dart';
import 'package:fi/components/round_text_field.dart';
import 'package:fi/main_tab/main_tab_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; // Import the intl package

class ProfileCreate extends StatefulWidget {
  const ProfileCreate({super.key});

  @override
  State<ProfileCreate> createState() => _ProfileCreateState();
}

class _ProfileCreateState extends State<ProfileCreate> {
  TextEditingController nameController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController budgetController = TextEditingController();

  void _navigateToMainTabView(BuildContext context) {
    String budget = budgetController.text;
    budget = formatCurrency(budget);

    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MainTabView(
          budget: budget, // Format the budget
        ),
      ),
    );
  }

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
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 100,
                ),
                Text(
                  'Welcome',
                  style: TextStyle(
                    color: TColor.white,
                    fontWeight: FontWeight.w600,
                    fontSize: 32,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Please enter your details',
                  style: TextStyle(
                    color: TColor.gray10,
                    fontWeight: FontWeight.w400,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(
                  height: 50,
                ),
                RoundTextField(
                  title: 'Enter your name',
                  controller: nameController,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 5,
                ),
                RoundTextField(
                  title: 'Enter your age',
                  controller: ageController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 5,
                ),
                RoundTextField(
                  title: 'Enter your budget',
                  controller: budgetController,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(height: 20),
                PrimaryButton(
                  title: 'Submit',
                  onPressed: () {
                    _navigateToMainTabView(context); // Navigate to HomeExpense
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
