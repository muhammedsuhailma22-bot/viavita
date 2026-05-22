import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pawfect_match/customertask/addtasks.dart';
import 'package:pawfect_match/booking/custboookings.dart';
import 'package:pawfect_match/screens/customerscreens/customer_home.dart';
import 'package:pawfect_match/screens/customerscreens/custprofile.dart';
import 'package:pawfect_match/widgets/task_card.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  final List<Map<String, dynamic>> pendingTasks = [
    {
      "title": "Electrical Work",
      "description":
          "We need professional painters to paint 2 bedrooms and a living room. The work includes surface preparation, applying primer, and finishing coats. All materials, including paint and brushes, will be provided.",
      "price": "₹25,000",
      "location": "New York, NY",
      "deadline": "30 November, 2025",
      "statusImage": "assets/images/pending.png",
      "status": "Pending",
      "requirements": "",
      "estimate": "",
      "profileImage": "",
      "customerName": "",
    },

    {
      "title": "Gardening",
      "description": "Plant new shrubs, trim hedges and prepare garden soil.",
      "price": "₹5,000",
      "location": "Los Angeles, CA",
      "deadline": "15 December, 2025",
      "statusImage": "assets/images/pending.png",
      "status": "Pending",
      "requirements": "",
      "estimate": "",
      "profileImage": "",
      "customerName": "",
    },
  ];

  final List<Map<String, dynamic>> inProgressTasks = [
    {
      "title": "Painting Work",
      "description": "Painting work in progress for bedroom and hall.",
      "price": "₹8,000",
      "location": "Chicago, IL",
      "deadline": "15 December, 2025",
      "statusImage": "assets/images/inprog.png",
      "status": "In Progress",
      "requirements":
          "Surface preparation, primer application, and finishing coats.",
      "estimate": "",
      "profileImage": "",
      "customerName": "",
    },

    {
      "title": "Plumbing",
      "description": "Bathroom pipe repair work ongoing.",
      "price": "₹3,500",
      "location": "Houston, TX",
      "deadline": "20 December, 2025",
      "statusImage": "assets/images/inprog.png",
      "status": "In Progress",
      "requirements":
          "The Plumber fixed a leaking bathroom tap and installed a new sink.",
      "estimate": "",
      "profileImage": "",
      "customerName": "",
    },
  ];

  final List<Map<String, dynamic>> completedTasks = [
    {
      "title": "House Cleaning",
      "description": "Deep clean 3BHK home completed successfully.",
      "price": "₹2,500",
      "location": "Phoenix, AZ",
      "deadline": "15 November, 2025",
      "statusImage": "assets/images/complete.png",
      "status": "Completed",
      "requirements":
          "Surface preparation, primer application, and finishing coats.",
      "estimate": "The task was finished on time with excellent workmanship.",
      "profileImage": "assets/images/p.jpg",
      "customerName": "Suresh Kumar",
    },
  ];

  int selectedIndex = 1;
  int selectedTab = 0;

  void replaceScreen(Widget screen) {
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
    List currentTasks = [];

    if (selectedTab == 0) {
      currentTasks = pendingTasks;
    } else if (selectedTab == 1) {
      currentTasks = inProgressTasks;
    } else {
      currentTasks = completedTasks;
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },

      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,

          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },

            icon: const Icon(Icons.arrow_back_ios),
          ),

          title: const Text(
            'Tasks',

            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18),

            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    tabButton(title: "Pending Task", index: 0),

                    tabButton(title: "In Progress", index: 1),

                    tabButton(title: "Completed", index: 2),
                  ],
                ),

                const SizedBox(height: 18),

                Expanded(
                  child: ListView.builder(
                    itemCount: currentTasks.length,

                    itemBuilder: (context, index) {
                      return TaskCard(
                        title: currentTasks[index]["title"],

                        description: currentTasks[index]["description"],

                        price: currentTasks[index]["price"],

                        location: currentTasks[index]["location"],

                        deadline: currentTasks[index]["deadline"],

                        statusImage: currentTasks[index]["statusImage"],

                        status: currentTasks[index]["status"],

                        requirements: currentTasks[index]["requirements"],

                        estimate: currentTasks[index]["estimate"],

                        profileImage: currentTasks[index]["profileImage"],

                        customerName: currentTasks[index]["customerName"],
                      );
                    },
                  ),
                ),
              ],
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
                width: MediaQuery.of(context).size.width,

                height: 80,

                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,

                  children: [
                    navItem(
                      icon: "assets/images/Home.svg",

                      label: "Home",
                      index: 0,

                      onTap: () {
                        replaceScreen(const CustomerHome());
                      },
                    ),

                    navItem(
                      icon: "assets/images/tsk.svg",

                      label: "Tasks",
                      index: 1,

                      onTap: () {},
                    ),

                    SizedBox(width: MediaQuery.of(context).size.width * 0.12),

                    navItem(
                      icon: "assets/images/bk.svg",

                      label: "Bookings",
                      index: 2,

                      onTap: () {
                        replaceScreen(const Bookings());
                      },
                    ),

                    navItem(
                      icon: "assets/images/pr.svg",

                      label: "Profile",
                      index: 3,

                      onTap: () {
                        replaceScreen(const EditProfile());
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

  Widget tabButton({required String title, required int index}) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),

      onTap: () {
        setState(() {
          selectedTab = index;
        });
      },

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),

        decoration: BoxDecoration(
          color: selectedTab == index
              ? const Color(0xFFFFE9E4)
              : Colors.transparent,

          borderRadius: BorderRadius.circular(8),
        ),

        child: Text(
          title,

          style: TextStyle(
            color: selectedTab == index
                ? const Color(0xFFEA5A1D)
                : const Color(0xFF697181),

            fontWeight: FontWeight.w500,
          ),
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
}
