import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawfect_match/booking/custboookings.dart';
import 'package:pawfect_match/customertask/addtasks.dart';
import 'package:pawfect_match/customertask/customertasks.dart';
import 'package:pawfect_match/screens/customerscreens/customer_home.dart';
import 'package:pawfect_match/screens/customerscreens/custprofile.dart';

class CustomerMainScreen extends StatefulWidget {
  const CustomerMainScreen({super.key});

  @override
  State<CustomerMainScreen> createState() => _CustomerMainScreenState();
}

class _CustomerMainScreenState extends State<CustomerMainScreen> {
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
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: IndexedStack(index: selectedIndex, children: pages),
      floatingActionButton: searchFocus.hasFocus
          ? null
          : Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                height: 56,
                width: 56,
                decoration: BoxDecoration(
                  color: const Color(0xFFEA5A1D),
                  shape: BoxShape.circle,
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(66, 25, 11, 11),
                      blurRadius: 12,
                      offset: Offset(0, 4),
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
