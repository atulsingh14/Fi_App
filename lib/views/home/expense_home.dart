import 'package:fi/common/color_sheme.dart';
import 'package:fi/components/custom_arc_painter.dart';
import 'package:fi/components/home_list.dart';
import 'package:fi/components/status_btn.dart';
import 'package:fi/database/database_helper.dart';
import 'package:flutter/material.dart';

class HomeExpense extends StatefulWidget {
  final String budget;
  const HomeExpense({Key? key, required this.budget}) : super(key: key);

  @override
  State<HomeExpense> createState() => _HomeExpenseState();
}

class _HomeExpenseState extends State<HomeExpense> {
  String budget = '';
  List<Map<String, dynamic>> entries = [];
  bool isLoading = true;

  void getEntries() async {
    final data = await SQLHelper.getEntries();
    setState(() {
      entries = data;
      isLoading = false;
      print("number of entries: ${entries.length}");
      print("Entries: ${entries}");
    });
  }

  @override
  void initState() {
    super.initState();

    getEntries();
    budget = widget.budget;
  }

  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: media.width,
              decoration: BoxDecoration(
                color: TColor.gray70.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/img/home_bg.png'),
                  Stack(
                    alignment: Alignment.topCenter,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: media.width * 0.05),
                        width: media.width * 0.72,
                        height: media.width * 0.72,
                        child: CustomPaint(
                          painter: CustomArcPainter(
                            end: 220,
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            Spacer(),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "Total Budget",
                        style: TextStyle(
                          color: TColor.gray40,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: media.width * 0.01,
                      ),
                      Text(
                        widget.budget,
                        style: TextStyle(
                          color: TColor.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: media.width * 0.08,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            border: Border.all(
                              color: TColor.border.withOpacity(0.15),
                            ),
                            color: TColor.gray60.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            "See your Report",
                            style: TextStyle(
                              color: TColor.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: StatusButton(
                                title: "Expense",
                                value: "₹1,500",
                                statusColor: TColor.secondary,
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(
                              width: 16,
                            ),
                            Expanded(
                              child: StatusButton(
                                title: "Income",
                                value: "₹1,500",
                                statusColor: TColor.secondaryG,
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            ListView.builder(
              padding: const EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: entries.length,
              itemBuilder: (context, index) {
                return ExpenseRow(
                  title: entries[index]['title'],
                  budget: entries[index]['cost'].toString(),
                );
              },
            ),
            const SizedBox(
              height: 100,
            ),
          ],
        ),
      ),
    );
  }
}
