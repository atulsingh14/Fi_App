import 'package:fi/common/color_sheme.dart';
import 'package:fi/components/custom_arc_painter.dart';
import 'package:fi/components/status_btn.dart';
import 'package:flutter/material.dart';

class HomeExpense extends StatefulWidget {
  const HomeExpense({super.key});

  @override
  State<HomeExpense> createState() => _HomeExpenseState();
}

class _HomeExpenseState extends State<HomeExpense> {
  @override
  Widget build(BuildContext context) {
    var media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: media.width * 1.1,
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
                            // IconButton(
                            //   onPressed: () {
                            //     Navigator.push(
                            //       context,
                            //       MaterialPageRoute(
                            //         builder: (context) => const SettingsView(),
                            //       ),
                            //     );
                            //   },
                            //   icon: Image.asset(
                            //     "assets/img/settings.png",
                            //     width: 25,
                            //     height: 25,
                            //     color: TColor.gray30,
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: media.width * 0.1,
                      ),
                      Image.asset(
                        "assets/img/app_logo.png",
                        width: media.width * 0.25,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Text(
                        "₹1,500",
                        style: TextStyle(
                          color: TColor.white,
                          fontSize: 40,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      SizedBox(
                        height: media.width * 0.05,
                      ),
                      Text(
                        "Total Budget",
                        style: TextStyle(
                          color: TColor.gray40,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(
                        height: media.width * 0.03,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(10),
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
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
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
          ],
        ),
      ),
    );
  }
}
