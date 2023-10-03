import 'package:fi/common/color_sheme.dart';
import 'package:fi/components/primary_btn.dart';
import 'package:fi/components/round_text_field.dart';
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

  // Formatter for currency
  final currencyFormatter = NumberFormat.currency(locale: 'HI', symbol: '₹');

  // void _saveProfileDetails() {
  //   // Retrieve user details from text controllers
  //   String name = nameController.text;
  //   String age = ageController.text;
  //   String budget = budgetController.text;

  //   // Convert budget to currency format
  //   String formattedBudget = currencyFormatter.format(double.parse(budget));
  // }

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
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Placeholder(),
                      ),
                    );
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
