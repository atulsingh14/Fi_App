import 'package:fi/common/color_sheme.dart';
import 'package:fi/components/custom_arc_painter.dart';
import 'package:fi/components/segment_btn.dart';
import 'package:fi/components/status_btn.dart';
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
              height: media.width,
              decoration: BoxDecoration(
                color: FColor.gray.withOpacity(0.9),
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(25),
                  bottomRight: Radius.circular(25),
                ),
              ),
              child: Stack(
                alignment: Alignment.center,
                children: [
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
                        'Total Balance',
                        style: TextStyle(
                          color: FColor.gray20,
                          fontSize: 12,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        // ignore: unnecessary_string_interpolations
                        formattedBudget,
                        style: TextStyle(
                          color: FColor.gray20,
                          fontSize: 50,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {},
                        child: Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                              border: Border.all(
                                color: FColor.gray60.withOpacity(0.15),
                              ),
                              color: FColor.gray60.withOpacity(0.3),
                              borderRadius: BorderRadius.circular(16)),
                          child: Text(
                            'See your Report',
                            style: TextStyle(
                              color: FColor.white,
                              fontSize: 12,
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
                                title: "Expenses",
                                value: "10,000",
                                //TODO: add the implementation to calculate the expenses
                                statusColor: FColor.secondary,
                                onPressed: () {},
                              ),
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            const SizedBox(
                              width: 8,
                            ),
                            Expanded(
                              child: StatusButton(
                                title: "Income",
                                value: "12,000",
                                statusColor: FColor.secondaryG,
                                onPressed: () {},
                              ),
                            )
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            // Container(
            //   margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            //   padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            //   height: 50,
            //   decoration: BoxDecoration(
            //       color: Colors.black, borderRadius: BorderRadius.circular(15)),
            //   child: Row(
            //     children: [
            //       Expanded(
            //         child: SegmentButton(
            //           title: "Your subscription",
            //           isActive: isSubscription,
            //           onPressed: () {
            //             setState(() {
            //               isSubscription = !isSubscription;
            //             });
            //           },
            //         ),
            //       ),
            //       Expanded(
            //         child: SegmentButton(
            //           title: "Upcoming bills",
            //           isActive: !isSubscription,
            //           onPressed: () {
            //             setState(() {
            //               isSubscription = !isSubscription;
            //             });
            //           },
            //         ),
            //       )
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
