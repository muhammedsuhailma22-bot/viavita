import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawfect_match/booking/booking_details.dart';
import 'package:pawfect_match/customertask/addtasks.dart';
import 'package:pawfect_match/customertask/customertasks.dart';
import 'package:pawfect_match/screens/customerscreens/customer_home.dart';
import 'package:pawfect_match/screens/customerscreens/custprofile.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  int selectedIndex = 2;

  void navigateToScreen(Widget screen) {
    Navigator.pushReplacement(
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

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },

      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,

          title: const Text(
            "Booking",

            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(20),

          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),

                height: 60,

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

              const SizedBox(height: 24),

              bookingItem(context),

              const SizedBox(height: 16),

              bookingItem(context),
            ],
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
                Navigator.push(
                  context,

                  PageRouteBuilder(
                    transitionDuration: const Duration(milliseconds: 300),

                    pageBuilder: (_, animation, __) {
                      return FadeTransition(
                        opacity: animation,
                        child: const Addtasks(),
                      );
                    },
                  ),
                );
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
                width: screenWidth,

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
              top: -15,

              child: Container(
                height: 75,
                width: 75,

                decoration: const BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                ),
              ),
            ),

            Positioned(
              bottom: 0,

              child: SizedBox(
                width: screenWidth,
                height: 80,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    navItem(
                      icon: "assets/images/Home.svg",

                      label: "Home",
                      index: 0,

                      onTap: () {
                        navigateToScreen(const CustomerHome());
                      },
                    ),

                    navItem(
                      icon: "assets/images/tsk.svg",

                      label: "Tasks",
                      index: 1,

                      onTap: () {
                        navigateToScreen(const Tasks());
                      },
                    ),

                    SizedBox(width: screenWidth * 0.12),

                    navItem(
                      icon: "assets/images/bk.svg",

                      label: "Bookings",
                      index: 2,

                      onTap: () {
                        setState(() {
                          selectedIndex = 2;
                        });
                      },
                    ),

                    navItem(
                      icon: "assets/images/pr.svg",

                      label: "Profile",
                      index: 3,

                      onTap: () {
                        navigateToScreen(const EditProfile());
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget navItem({
    required String icon,
    required String label,
    required int index,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(20),

      onTap: () {
        setState(() {
          selectedIndex = index;
        });

        onTap();
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

  Widget bookingItem(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return InkWell(
      borderRadius: BorderRadius.circular(16),

      onTap: () {
        Navigator.push(
          context,

          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),

            pageBuilder: (_, animation, __) {
              return FadeTransition(
                opacity: animation,
                child: const BookingDetails(),
              );
            },
          ),
        );
      },

      child: Container(
        constraints: const BoxConstraints(minHeight: 260),

        width: double.infinity,

        padding: const EdgeInsets.all(12),

        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 248, 246, 1),

          borderRadius: BorderRadius.circular(16),
        ),

        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(5),

              child: Container(
                height: 90,
                width: screenWidth,

                padding: const EdgeInsets.all(10),

                decoration: BoxDecoration(
                  color: const Color(0xFFFFE3DB),

                  borderRadius: BorderRadius.circular(10),
                ),

                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),

                      child: Image.asset(
                        "assets/images/p.jpg",

                        scale: 2,
                        fit: BoxFit.cover,
                      ),
                    ),

                    const SizedBox(width: 10),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: const [
                        Text(
                          "Suresh Kumar",

                          style: TextStyle(
                            fontWeight: FontWeight.w600,

                            fontSize: 16,
                          ),
                        ),

                        SizedBox(height: 4),

                        Text(
                          "Painter",

                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 18),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  "Painting",

                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
                ),

                Text(
                  "₹12,000/-",

                  style: TextStyle(
                    fontWeight: FontWeight.w700,

                    fontSize: 20,

                    color: Color.fromRGBO(105, 113, 129, 1),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "Start Date",

                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),

                    SizedBox(height: 18),

                    Text(
                      "Oct 15 2025",

                      style: TextStyle(
                        fontSize: 16,

                        color: Color.fromRGBO(105, 113, 129, 1),
                      ),
                    ),
                  ],
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      "Expected Deadline",

                      style: TextStyle(fontSize: 14, color: Colors.black),
                    ),

                    SizedBox(height: 18),

                    Text(
                      "Oct 30 2025",

                      style: TextStyle(
                        fontSize: 16,

                        color: Color.fromRGBO(105, 113, 129, 1),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
