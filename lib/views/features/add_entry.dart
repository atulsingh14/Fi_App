import 'package:fi/common/color_sheme.dart';
import 'package:fi/components/primary_btn.dart';
import 'package:fi/components/round_text_field.dart';
import 'package:fi/database/database_helper.dart';
import 'package:flutter/material.dart';

class AddEntry extends StatefulWidget {
  const AddEntry({super.key});

  @override
  State<AddEntry> createState() => _AddEntryState();
}

class _AddEntryState extends State<AddEntry> {
  TextEditingController expenseController = TextEditingController();
  TextEditingController costController = TextEditingController();

  void submitData() async {
    String title = expenseController.text;
    double cost = double.parse(costController.text);

    int rowInserted = await SQLHelper.createEntry(title, cost);

    if (rowInserted != -1) {
      print('Value added, row ID: $rowInserted');
    } else {
      print('Something went wrong');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Text(
                'Enter your Expense:',
                style: TextStyle(
                  color: TColor.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 50,
              ),
              RoundTextField(
                title: 'Expense',
                controller: expenseController,
                keyboardType: TextInputType.text,
                titleAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 5,
              ),
              RoundTextField(
                title: 'Cost',
                controller: costController,
                keyboardType: TextInputType.number,
                titleAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 20,
              ),
              PrimaryButton(
                  title: 'Submit',
                  onPressed: () {
                    submitData();
                    Navigator.pop(context);
                  })
            ],
          ),
        ),
      )),
    );
  }
}
