import 'package:dashboard_ui/add_banner/banner.dart';
import 'package:dashboard_ui/last_digit_contest/page/last_digit_contest_list.dart';
import 'package:dashboard_ui/player_selected_contest.dart';
import 'package:dashboard_ui/tab/dashboard.dart';
import 'package:dashboard_ui/toss_winner_contest/toss_winner_contest.dart';
import 'package:dashboard_ui/user.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../less_run_per_over/less_run_per_over_contest.dart';
import '../match/add_match.dart';
import '../match_winner_contest/match_winner_contest.dart';

class Home extends StatefulWidget {
  int pos = 0;

  Home({int position = 0}) {
    this.pos = position;
  }

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  TextStyle menuTextStyle = const TextStyle(
      color: Colors.black,
      fontSize: 12,
      fontWeight: FontWeight.w500,
      letterSpacing: 2.0);

  int selectedMenuPosition = 0;

  late TabController tabController;

  @override
  void initState() {
    super.initState();
    selectedMenuPosition = widget.pos;
    tabController = TabController(
        length: 9, vsync: this, initialIndex: selectedMenuPosition);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          Container(
            width: 250,
            height: double.maxFinite,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  width: 250,
                  height: 100,
                  color: Colors.white,
                  padding: EdgeInsets.only(left: 16),
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("BATTING RAJA".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.black,
                                  letterSpacing: 2.0,
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            "Let's Play The Game".toUpperCase(),
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          )
                        ],
                      )),
                ),
                const Divider(
                  height: 1,
                ),
                Container(
                  width: 250,
                  height: 50,
                  color:
                      selectedMenuPosition == 0 ? Colors.yellow : Colors.white,
                  padding: const EdgeInsets.only(left: 16),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedMenuPosition = 0;
                        tabController.index = 0;
                      });
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Dashboard".toUpperCase(),
                            style: menuTextStyle,
                          ),
                        ),
                        const Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                Container(
                  width: 250,
                  height: 50,
                  color:
                      selectedMenuPosition == 6 ? Colors.yellow : Colors.white,
                  padding: const EdgeInsets.only(left: 16),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedMenuPosition = 6;
                        tabController.index = 6;
                      });
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Add Match".toUpperCase(),
                            style: menuTextStyle,
                          ),
                        ),
                        const Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                Container(
                  width: 250,
                  height: 50,
                  color:
                      selectedMenuPosition == 1 ? Colors.yellow : Colors.white,
                  padding: const EdgeInsets.only(left: 16),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedMenuPosition = 1;
                        tabController.index = 1;
                      });
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Last Digit Contest".toUpperCase(),
                            style: menuTextStyle,
                          ),
                        ),
                        const Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                Container(
                  width: 250,
                  height: 50,
                  color:
                      selectedMenuPosition == 2 ? Colors.yellow : Colors.white,
                  padding: const EdgeInsets.only(left: 16),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedMenuPosition = 2;
                        tabController.index = 2;
                      });
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Toss Winner Contest".toUpperCase(),
                            style: menuTextStyle,
                          ),
                        ),
                        const Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                // Container(
                //   width: 250,
                //   height: 50,
                //   color:
                //       selectedMenuPosition == 3 ? Colors.yellow : Colors.white,
                //   padding: const EdgeInsets.only(left: 16),
                //   child: InkWell(
                //     onTap: () {
                //       setState(() {
                //         selectedMenuPosition = 3;
                //         tabController.index = 3;
                //       });
                //     },
                //     child: Row(
                //       children: [
                //         Expanded(
                //           child: Text(
                //             "Player Select Contest".toUpperCase(),
                //             style: menuTextStyle,
                //           ),
                //         ),
                //         const Icon(
                //           Icons.navigate_next,
                //           color: Colors.black,
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // const Divider(
                //   height: 1,
                // ),
                Container(
                  width: 250,
                  height: 50,
                  color:
                      selectedMenuPosition == 4 ? Colors.yellow : Colors.white,
                  padding: const EdgeInsets.only(left: 16),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedMenuPosition = 4;
                        tabController.index = 4;
                      });
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Less Run Per Over Contest".toUpperCase(),
                            style: menuTextStyle,
                          ),
                        ),
                        const Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                Container(
                  width: 250,
                  height: 50,
                  color:
                      selectedMenuPosition == 5 ? Colors.yellow : Colors.white,
                  padding: const EdgeInsets.only(left: 16),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedMenuPosition = 5;
                        tabController.index = 5;
                      });
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Match Winner Contest".toUpperCase(),
                            style: menuTextStyle,
                          ),
                        ),
                        const Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
                // Container(
                //   width: 250,
                //   height: 50,
                //   color:
                //       selectedMenuPosition == 8 ? Colors.yellow : Colors.white,
                //   padding: const EdgeInsets.only(left: 16),
                //   child: InkWell(
                //     onTap: () {
                //       setState(() {
                //         selectedMenuPosition = 8;
                //         tabController.index = 8;
                //       });
                //     },
                //     child: Row(
                //       children: [
                //         Expanded(
                //           child: Text(
                //             "banner".toUpperCase(),
                //             style: menuTextStyle,
                //           ),
                //         ),
                //         const Icon(
                //           Icons.navigate_next,
                //           color: Colors.black,
                //         )
                //       ],
                //     ),
                //   ),
                // ),
                // const Divider(
                //   height: 1,
                // ),
                Container(
                  width: 250,
                  height: 50,
                  color:
                      selectedMenuPosition == 7 ? Colors.yellow : Colors.white,
                  padding: const EdgeInsets.only(left: 16),
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        selectedMenuPosition = 7;
                        tabController.index = 7;
                      });
                    },
                    child: Row(
                      children: [
                        Expanded(
                          child: Text(
                            "Users".toUpperCase(),
                            style: menuTextStyle,
                          ),
                        ),
                        const Icon(
                          Icons.navigate_next,
                          color: Colors.black,
                        )
                      ],
                    ),
                  ),
                ),
                const Divider(
                  height: 1,
                ),
              ],
            ),
          ),
          Container(
            height: Get.height,
            width: 1,
            color: Colors.grey.withOpacity(0.50),
          ),
          Expanded(
              child: TabBarView(
            controller: tabController,
            children: const [
              Dashboard(),
              LastDigitWinningContest(),
              TossWinnerContest(),
              PlayerSelectedContest(),
              LessRunPerOver(),
              MatchWinnerContest(),
              AddMatch(),
              User(),
               Banner1(),

            ],
          ))
        ],
      ),
    );
  }
}
