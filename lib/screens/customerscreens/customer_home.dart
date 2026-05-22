import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawfect_match/booking/custboookings.dart';
import 'package:pawfect_match/customertask/addtasks.dart';
import 'package:pawfect_match/customertask/tasksetailed.dart';
import 'package:pawfect_match/screens/customerscreens/custprofile.dart';
import 'package:pawfect_match/customertask/customertasks.dart';
import 'package:pawfect_match/screens/customerscreens/pending_task_widget.dart';
import 'package:pawfect_match/utils/app_colors.dart';

class CustomerHome extends StatefulWidget {
  const CustomerHome({super.key});

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  int selectedIndex = 0;

  void navigateToScreen(Widget screen) {
    Navigator.push(
      context,
      PageRouteBuilder(
        transitionDuration: const Duration(milliseconds: 300),
        pageBuilder: (_, animation, __) {
          return FadeTransition(opacity: animation, child: screen);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),

      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 24,
              left: 20,
              right: 20,
              bottom: 80,
            ),

            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    Row(
                      children: [
                        const CircleAvatar(
                          radius: 28,
                          backgroundImage: AssetImage("assets/images/p.jpg"),
                        ),

                        const SizedBox(width: 12),

                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: const [
                            Text(
                              "Hello,",

                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),

                            Text(
                              "Ashmi A B",

                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),

                    SvgPicture.asset("assets/images/bell.svg", width: 24),
                  ],
                ),

                const SizedBox(height: 30),

                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12),

                  height: 55,

                  decoration: BoxDecoration(
                    color: const Color.fromARGB(133, 245, 242, 242),

                    borderRadius: BorderRadius.circular(16),
                  ),

                  child: Row(
                    children: [
                      SvgPicture.asset("assets/images/s.svg", width: 24),

                      const SizedBox(width: 11),

                      const Expanded(
                        child: TextField(
                          decoration: InputDecoration(
                            hintText: "Search here...",
                            border: InputBorder.none,
                          ),
                        ),
                      ),

                      const Icon(Icons.tune),
                    ],
                  ),
                ),

                const SizedBox(height: 30),

                const Text(
                  "Your Pending Tasks",

                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                ),

                const SizedBox(height: 30),

                Row(
                  children: [
                    Expanded(
                      child: PendingTaskWidget(
                        title: "Electrical Work",

                        description:
                            "Rewire living room, install ceiling fans and light fixtures....",

                        price: "₹25,000",

                        onTap: () {
                          navigateToScreen(
                            const Tasksetailed(
                              title: "Electrical Work",

                              description:
                                  "Rewire living room, install ceiling fans and light fixtures....",

                              price: "₹25,000",

                              location: "Kochi",

                              deadline: "12 June 2026",

                              statusImage: "assets/images/pending.png",

                              status: "Pending",

                              requirements: "",

                              estimate: "",

                              profileImage: "",

                              customerName: "",
                            ),
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: PendingTaskWidget(
                        title: "Gardening",

                        description:
                            "Plant new shrubs, trim hedges and prepare garden soil...",

                        price: "₹5,000",

                        onTap: () {
                          navigateToScreen(
                            const Tasksetailed(
                              title: "Gardening",

                              description:
                                  "Plant new shrubs, trim hedges and prepare garden soil...",

                              price: "₹5,000",

                              location: "Los Angeles, CA",

                              deadline: "30 November, 2023",

                              statusImage: "assets/images/pending.png",

                              status: "Pending",

                              requirements: "",

                              estimate: "",

                              profileImage: "",

                              customerName: "",
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                const Text(
                  "You have new Offers!",

                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),

                const SizedBox(height: 14),

                Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 186,

                        padding: const EdgeInsets.all(14),

                        decoration: BoxDecoration(
                          color: const Color(0xFFFDECEA),

                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 16,

                                  backgroundImage: AssetImage(
                                    "assets/images/p1.jpg",
                                  ),
                                ),

                                const SizedBox(width: 8),

                                const Text(
                                  "Deep Clean",

                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,

                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 6),

                            const Text(
                              "Anil Thomas",

                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),

                            const SizedBox(height: 14),

                            const Text(
                              "₹800 per day",

                              style: TextStyle(
                                color: Color.fromARGB(255, 150, 38, 30),
                              ),
                            ),

                            const SizedBox(height: 14),

                            InkWell(
                              borderRadius: BorderRadius.circular(10),

                              onTap: () {},

                              child: Container(
                                height: 42,

                                decoration: BoxDecoration(
                                  gradient: AppColors.buttonGradient,

                                  borderRadius: BorderRadius.circular(10),
                                ),

                                child: const Center(
                                  child: Text(
                                    "View Details",

                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    const SizedBox(width: 12),

                    Expanded(
                      child: Container(
                        height: 186,

                        padding: const EdgeInsets.all(14),

                        decoration: BoxDecoration(
                          color: const Color(0xFFFDECEA),

                          borderRadius: BorderRadius.circular(20),
                        ),

                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,

                          children: [
                            Row(
                              children: [
                                const CircleAvatar(
                                  radius: 16,

                                  backgroundImage: AssetImage(
                                    "assets/images/p2.jpg",
                                  ),
                                ),

                                const SizedBox(width: 8),

                                const Text(
                                  "Garden Keeper",

                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,

                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),

                            const SizedBox(height: 6),

                            const Text(
                              "Sarah Smith",

                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.black54,
                              ),
                            ),

                            const SizedBox(height: 14),

                            const Text(
                              "₹5,000",

                              style: TextStyle(
                                color: Color.fromARGB(255, 150, 38, 30),
                              ),
                            ),

                            const SizedBox(height: 14),

                            InkWell(
                              borderRadius: BorderRadius.circular(10),

                              onTap: () {},

                              child: Container(
                                height: 42,

                                decoration: BoxDecoration(
                                  gradient: AppColors.buttonGradient,

                                  borderRadius: BorderRadius.circular(10),
                                ),

                                child: const Center(
                                  child: Text(
                                    "View Details",

                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),

      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 10),

        child: Container(
          height: 56,
          width: 56,

          decoration: BoxDecoration(
            color: const Color(0xFFEA5A1D),
            shape: BoxShape.circle,

            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(66, 25, 11, 11),

                blurRadius: 12,

                offset: const Offset(0, 4),
              ),
            ],
          ),

          child: InkWell(
            borderRadius: BorderRadius.circular(50),

            onTap: () {
              navigateToScreen(const Addtasks());
            },

            child: const Icon(Icons.add, color: Colors.white),
          ),
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: Stack(
        alignment: Alignment.bottomCenter,

        children: [
          Container(height: 74, color: Colors.white),

          Positioned(
            top: 0,

            child: Container(
              height: 60,

              width: MediaQuery.of(context).size.width,

              decoration: const BoxDecoration(
                color: Colors.white,

                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
            ),
          ),

          Positioned(
            bottom: 0,

            child: SizedBox(
              width: MediaQuery.of(context).size.width,

              height: 80,

              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                children: [
                  navItem(
                    icon: "assets/images/Home.svg",
                    label: "Home",
                    index: 0,
                  ),

                  navItem(
                    icon: "assets/images/tsk.svg",
                    label: "Tasks",
                    index: 1,
                  ),

                  SizedBox(width: screenWidth * 0.12),

                  navItem(
                    icon: "assets/images/bk.svg",
                    label: "Bookings",
                    index: 2,
                  ),

                  navItem(
                    icon: "assets/images/pr.svg",
                    label: "Profile",
                    index: 3,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget navItem({
    required String icon,
    required String label,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedIndex = index;
        });

        if (index == 1) {
          navigateToScreen(const Tasks());
        }

        if (index == 2) {
          navigateToScreen(const Bookings());
        }

        if (index == 3) {
          navigateToScreen(const EditProfile());
        }
      },

      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          SvgPicture.asset(
            icon,
            width: 24,

            colorFilter: ColorFilter.mode(
              selectedIndex == index
                  ? const Color(0xFFEA5A1D)
                  : const Color(0xFF697181),

              BlendMode.srcIn,
            ),
          ),

          Text(
            label,

            style: TextStyle(
              fontSize: 12,

              color: selectedIndex == index
                  ? const Color(0xFFEA5A1D)
                  : const Color(0xFF697181),
            ),
          ),

          selectedIndex == index
              ? Container(
                  width: 4,
                  height: 4,

                  decoration: const BoxDecoration(
                    color: Color(0xFFEA5A1D),
                    shape: BoxShape.circle,
                  ),
                )
              : const SizedBox(height: 4),
        ],
      ),
    );
  }
}
