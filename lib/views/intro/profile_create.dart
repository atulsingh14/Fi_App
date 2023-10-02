import 'package:fi/common/color_sheme.dart';
import 'package:fi/components/primary_btn.dart';
import 'package:fi/components/round_text_field.dart';
import 'package:fi/views/home/expense_view.dart';
import 'package:flutter/material.dart';

class ProfileCreate extends StatefulWidget {
  const ProfileCreate({super.key});

  @override
  State<ProfileCreate> createState() => _ProfileCreateState();
}

class _ProfileCreateState extends State<ProfileCreate> {
  TextEditingController txtName = TextEditingController();
  TextEditingController txtAge = TextEditingController();
  TextEditingController txtBudget = TextEditingController();
  bool isRemember = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FColor.gray,
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
                    color: FColor.gray10,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Text(
                  'Enter Your Details',
                  style: TextStyle(color: FColor.gray10),
                ),
                const SizedBox(
                  height: 50,
                ),
                RoundTextField(
                  title: 'What should we call you?:',
                  controller: txtName,
                  keyboardType: TextInputType.name,
                ),
                const SizedBox(
                  height: 5,
                ),
                RoundTextField(
                  title: 'How old are you?',
                  controller: txtAge,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 5,
                ),
                RoundTextField(
                  title: 'What is your Monthly Budget',
                  controller: txtBudget,
                  keyboardType: TextInputType.number,
                ),
                const SizedBox(
                  height: 40,
                ),
                PrimaryButton(
                  title: 'Submit',
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ExpenseView(
                          name: txtName.text,
                          age: txtAge.text,
                          budget: txtBudget.text,
                        ),
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
