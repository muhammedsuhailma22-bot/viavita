import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:pawfect_match/customertask/addtasks.dart';
import 'package:pawfect_match/customertask/edittaskscust.dart';
import 'package:pawfect_match/booking/custboookings.dart';
import 'package:pawfect_match/screens/customerscreens/customer_home.dart';
import 'package:pawfect_match/screens/customerscreens/custprofile.dart';

class Tasksetailed extends StatefulWidget {
  final String title;
  final String description;
  final String price;
  final String location;
  final String deadline;
  final String statusImage;
  final String status;
  final String requirements;
  final String estimate;
  final String profileImage;
  final String customerName;

  const Tasksetailed({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.location,
    required this.deadline,
    required this.statusImage,
    required this.status,
    required this.requirements,
    required this.estimate,
    required this.profileImage,
    required this.customerName,
  });

  @override
  State<Tasksetailed> createState() => _TasksetailedState();
}

class _TasksetailedState extends State<Tasksetailed> {
  int selectedIndex = 1;

  double rating = 0;

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

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },

      child: Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: Colors.white,

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,

          title: const Text(
            "View Details",

            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),

          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new_outlined),

            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),

        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                const SizedBox(height: 24),

                Padding(
                  padding: const EdgeInsets.all(10),

                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Text(
                        widget.title,

                        style: const TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,

                          color: Color.fromRGBO(69, 83, 96, 1),
                        ),
                      ),

                      Image.asset(widget.statusImage, height: 24, width: 89),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                Padding(
                  padding: const EdgeInsets.only(left: 14),

                  child: Row(
                    children: [
                      Image.asset('assets/images/wallet.png', scale: .8),

                      const SizedBox(width: 9),

                      const Text(
                        "Budget - ",

                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w500,

                          color: Color.fromRGBO(123, 131, 137, 1),
                        ),
                      ),

                      Text(
                        widget.price,

                        style: const TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w600,

                          color: Color.fromRGBO(123, 131, 137, 1),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                Padding(
                  padding: const EdgeInsets.only(left: 14),

                  child: Row(
                    children: [
                      Image.asset('assets/images/loc.png', scale: .8),

                      const SizedBox(width: 9),

                      const Text(
                        "Location - ",

                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,

                          color: Color.fromRGBO(123, 131, 137, 1),
                        ),
                      ),

                      Text(
                        widget.location,

                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,

                          color: Color.fromRGBO(123, 131, 137, 1),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                Padding(
                  padding: const EdgeInsets.only(left: 14),

                  child: Row(
                    children: [
                      Image.asset('assets/images/calender.png', scale: .8),

                      const SizedBox(width: 9),

                      const Text(
                        "Expected Dead line - ",

                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,

                          color: Color.fromRGBO(123, 131, 137, 1),
                        ),
                      ),

                      Text(
                        widget.deadline,

                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,

                          color: Color.fromRGBO(123, 131, 137, 1),
                        ),
                      ),
                    ],
                  ),
                ),

                const SizedBox(height: 32),

                const Padding(
                  padding: EdgeInsets.all(14),

                  child: Text(
                    "Description",

                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                  ),
                ),

                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 14),

                  child: Text(
                    widget.description,

                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      wordSpacing: 3,

                      color: Color.fromRGBO(105, 113, 129, 1),
                    ),
                  ),
                ),
                if (widget.status == "In Progress") ...[
                  const SizedBox(height: 18),

                  const Padding(
                    padding: EdgeInsets.all(14),

                    child: Text(
                      "Requirements",

                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),

                    child: Text(
                      widget.requirements,

                      style: const TextStyle(fontSize: 14, height: 1.4),
                    ),
                  ),
                ],

                if (widget.status == "Completed") ...[
                  const SizedBox(height: 18),

                  const Padding(
                    padding: EdgeInsets.all(14),

                    child: Text(
                      "Estimate",

                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 14),

                    child: Text(
                      widget.estimate,

                      style: const TextStyle(fontSize: 14, height: 1.4),
                    ),
                  ),

                  const SizedBox(height: 37),

                  Center(
                    child: SizedBox(
                      width: double.infinity,
                      height: 55,

                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 14),

                        child: OutlinedButton(
                          onPressed: () {
                            showDialog(
                              context: context,

                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,

                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(12),
                                  ),

                                  content: SingleChildScrollView(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,

                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,

                                      children: [
                                        Container(
                                          width: 372,
                                          padding: const EdgeInsets.all(10),

                                          decoration: BoxDecoration(
                                            color: const Color.fromRGBO(
                                              250,
                                              246,
                                              245,
                                              1,
                                            ),

                                            borderRadius: BorderRadius.circular(
                                              10,
                                            ),
                                          ),

                                          child: Row(
                                            children: [
                                              ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(8),

                                                child: Image.asset(
                                                  widget.profileImage,

                                                  height: 52,

                                                  width: 52,

                                                  fit: BoxFit.cover,

                                                  errorBuilder:
                                                      (
                                                        context,
                                                        error,
                                                        stackTrace,
                                                      ) {
                                                        return Container(
                                                          height: 52,

                                                          width: 52,

                                                          color: Colors
                                                              .grey
                                                              .shade300,

                                                          child: const Icon(
                                                            Icons.person,
                                                          ),
                                                        );
                                                      },
                                                ),
                                              ),

                                              const SizedBox(width: 10),

                                              Expanded(
                                                child: Column(
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,

                                                  mainAxisSize:
                                                      MainAxisSize.min,

                                                  children: [
                                                    Text(
                                                      widget.customerName,

                                                      overflow:
                                                          TextOverflow.ellipsis,

                                                      style: const TextStyle(
                                                        fontSize: 15,

                                                        fontWeight:
                                                            FontWeight.w600,
                                                      ),
                                                    ),

                                                    const SizedBox(height: 2),

                                                    Text(
                                                      widget.title,

                                                      overflow:
                                                          TextOverflow.ellipsis,

                                                      style: const TextStyle(
                                                        fontSize: 13,

                                                        color: Colors.grey,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),

                                        const SizedBox(height: 18),

                                        StatefulBuilder(
                                          builder: (context, setDialogState) {
                                            return Row(
                                              children: List.generate(5, (
                                                index,
                                              ) {
                                                IconData icon;

                                                if (index + 1 <= rating) {
                                                  icon = Icons.star;
                                                } else if (index + 0.5 <=
                                                    rating) {
                                                  icon = Icons.star_half;
                                                } else {
                                                  icon = Icons.star_border;
                                                }

                                                return InkWell(
                                                  borderRadius:
                                                      BorderRadius.circular(20),

                                                  onTap: () {
                                                    setDialogState(() {
                                                      rating = index + 1.0;
                                                    });
                                                  },

                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                          right: 4,
                                                        ),

                                                    child: Icon(
                                                      icon,

                                                      color: Colors.orange,

                                                      size: 30,
                                                    ),
                                                  ),
                                                );
                                              }),
                                            );
                                          },
                                        ),

                                        const SizedBox(height: 14),

                                        const Text(
                                          "Review",

                                          style: TextStyle(
                                            fontSize: 14,

                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),

                                        const SizedBox(height: 10),

                                        TextField(
                                          maxLines: 4,

                                          decoration: InputDecoration(
                                            hintText: "Write your review",

                                            filled: true,

                                            fillColor: const Color.fromRGBO(
                                              248,
                                              248,
                                              248,
                                              1,
                                            ),

                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),

                                              borderSide: BorderSide.none,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 14),

                                        Row(
                                          children: [
                                            Expanded(
                                              child: OutlinedButton(
                                                onPressed: () {
                                                  Navigator.pop(context);
                                                },

                                                style: OutlinedButton.styleFrom(
                                                  side: const BorderSide(
                                                    color: Color(0xFFEA5A1D),
                                                  ),

                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          8,
                                                        ),
                                                  ),
                                                ),

                                                child: const Text(
                                                  "Cancel",

                                                  style: TextStyle(
                                                    color: Color(0xFF992015),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            const SizedBox(width: 12),

                                            Expanded(
                                              child: Container(
                                                height: 40,

                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(8),

                                                  gradient:
                                                      const LinearGradient(
                                                        colors: [
                                                          Color(0xFF992015),
                                                          Color(0xFFEA5A1D),
                                                        ],
                                                      ),
                                                ),

                                                child: ElevatedButton(
                                                  onPressed: () {
                                                    Navigator.pop(context);

                                                    ScaffoldMessenger.of(
                                                      context,
                                                    ).showSnackBar(
                                                      const SnackBar(
                                                        content: Text(
                                                          "Review Added Successfully",
                                                        ),

                                                        behavior:
                                                            SnackBarBehavior
                                                                .floating,
                                                      ),
                                                    );
                                                  },

                                                  style: ElevatedButton.styleFrom(
                                                    backgroundColor:
                                                        Colors.transparent,

                                                    shadowColor:
                                                        Colors.transparent,

                                                    shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                            8,
                                                          ),
                                                    ),
                                                  ),

                                                  child: const Text(
                                                    "Send",

                                                    style: TextStyle(
                                                      color: Colors.white,
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          },

                          style: OutlinedButton.styleFrom(
                            side: const BorderSide(
                              color: Color.fromRGBO(153, 32, 21, 1),
                            ),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),

                          child: const Text(
                            "Add Review",

                            style: TextStyle(
                              color: Color.fromRGBO(153, 32, 21, 1),

                              fontSize: 18,

                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],

                const SizedBox(height: 40),

                if (widget.status == "Pending")
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 14),

                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),

                        onTap: () {
                          navigateToScreen(const Addtaskcus());
                        },

                        child: Container(
                          width: double.infinity,

                          padding: const EdgeInsets.symmetric(vertical: 15),

                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),

                            gradient: const LinearGradient(
                              colors: [Color(0xFF992015), Color(0xFFEA5A1D)],
                            ),
                          ),

                          child: const Center(
                            child: Text(
                              "Edit",

                              style: TextStyle(
                                color: Colors.white,

                                fontSize: 18,

                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),

                const SizedBox(height: 100),
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

                    const SizedBox(width: 60),

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
