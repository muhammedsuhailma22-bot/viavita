import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawfect_match/booking/custboookings.dart';
import 'package:pawfect_match/customertask/addtasks.dart';
import 'package:pawfect_match/customertask/customertasks.dart';
import 'package:pawfect_match/screens/customerscreens/customer_home.dart';
import 'package:pawfect_match/screens/customerscreens/custprofile.dart';

class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int selectedIndex = 0;

  final FocusNode searchFocus = FocusNode();

  late final List<Widget> pages = [
    CustomerHome(),
    const Tasks(),
    const Bookings(),
    const EditProfile(),
  ];

  @override
  void initState() {
    super.initState();

    searchFocus.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    searchFocus.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: IndexedStack(index: selectedIndex, children: pages),

      floatingActionButton: searchFocus.hasFocus
          ? null
          : FloatingActionButton(
              backgroundColor: const Color(0xFFEA5A1D),

              onPressed: () {
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
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

      bottomNavigationBar: Container(
        height: 75,
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(25),
            topRight: Radius.circular(25),
          ),
          boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
        ),

        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            navItem(icon: "assets/images/Home.svg", label: "Home", index: 0),

            navItem(icon: "assets/images/tsk.svg", label: "Tasks", index: 1),

            SizedBox(width: screenWidth * 0.12),

            navItem(icon: "assets/images/bk.svg", label: "Bookings", index: 2),

            navItem(icon: "assets/images/pr.svg", label: "Profile", index: 3),
          ],
        ),
      ),
    );
  }

  Widget navItem({
    required String icon,
    required String label,
    required int index,
  }) {
    final bool isSelected = selectedIndex == index;

    return InkWell(
      borderRadius: BorderRadius.circular(20),

      onTap: () {
        setState(() {
          selectedIndex = index;
        });
      },

      child: SizedBox(
        width: 70,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              icon,
              width: 24,

              colorFilter: ColorFilter.mode(
                isSelected ? const Color(0xFFEA5A1D) : const Color(0xFF697181),
                BlendMode.srcIn,
              ),
            ),

            const SizedBox(height: 4),

            Text(
              label,

              style: TextStyle(
                fontSize: 12,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w400,
                color: isSelected
                    ? const Color(0xFFEA5A1D)
                    : const Color(0xFF697181),
              ),
            ),

            const SizedBox(height: 4),

            AnimatedContainer(
              duration: const Duration(milliseconds: 250),

              width: isSelected ? 5 : 0,
              height: 5,

              decoration: const BoxDecoration(
                color: Color(0xFFEA5A1D),
                shape: BoxShape.circle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
