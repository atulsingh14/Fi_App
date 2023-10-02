import 'package:fi/common/color_sheme.dart';
import 'package:fi/components/custom_arc_painter.dart';
import 'package:fi/views/settings/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class ExpenseView extends StatefulWidget {
  final String name;
  final String age;
  final String budget;

  const ExpenseView({
    Key? key,
    required this.name,
    required this.age,
    required this.budget,
  }) : super(key: key);

  @override
  State<ExpenseView> createState() => _ExpenseViewState();
}

class _ExpenseViewState extends State<ExpenseView> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.of(context).size;
    var formattedBudget = NumberFormat.currency(
      locale: 'HI', // Use the appropriate locale for Hindi, if needed
      symbol: '₹',
    ).format(double.parse(widget.budget));

    return Scaffold(
      backgroundColor: FColor.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: media.width * 1.1,
              decoration: BoxDecoration(
                color: FColor.gray.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Image.asset('assets/images/home_bg.png'),
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
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Row(
                          children: [
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => const SettingView(),
                                  ),
                                );
                              },
                              icon: Image.asset(
                                'assets/images/settings.png',
                                width: 25,
                                height: 25,
                                color: FColor.gray30,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        // ignore: unnecessary_string_interpolations
                        formattedBudget,
                        style: TextStyle(
                          color: FColor.gray20,
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
