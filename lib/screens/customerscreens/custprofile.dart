import 'package:flutter/material.dart';
import 'package:pawfect_match/customertask/addtasks.dart';
import 'package:pawfect_match/screens/auth/login_screen3.dart';
import 'package:pawfect_match/booking/custboookings.dart';
import 'package:pawfect_match/screens/customerscreens/customer_home.dart';
import 'package:pawfect_match/screens/customerscreens/custprofileedit.dart';
import 'package:pawfect_match/customertask/customertasks.dart';
import 'package:pawfect_match/utils/app_colors.dart';
import 'package:flutter_svg/flutter_svg.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  int selectedIndex = 3;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,

      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                height: 216,
                width: double.infinity,
                decoration: BoxDecoration(
                  gradient: AppColors.buttonGradient,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 80, left: 20),
                  child: SizedBox(
                    height: 24,
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Image.asset(
                            'assets/images/arr.png',
                            height: 24,
                            width: 24,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 20),
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                            fontSize: 20,
                            color: Colors.white,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        Spacer(),
                        InkWell(
                          onTap: () {
                            showDialog(
                              context: context,
                              builder: (context) {
                                return AlertDialog(
                                  backgroundColor: Colors.white,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(20),
                                  ),

                                  content: SizedBox(
                                    height: 200,
                                    width: screenWidth * 0.95,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Logout",
                                          style: TextStyle(
                                            fontSize: 24,
                                            fontWeight: FontWeight.w500,
                                          ),
                                        ),

                                        SizedBox(height: 32),

                                        Text(
                                          "Are you sure you want to Logout?",
                                          style: TextStyle(
                                            fontSize: 16,
                                            color: Colors.black87,
                                          ),
                                        ),

                                        Spacer(),

                                        Row(
                                          children: [
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.pop(context);
                                                },

                                                child: Container(
                                                  height: 45,

                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    border: Border.all(
                                                      color: Color(0xFFEA5A1D),
                                                    ),
                                                  ),

                                                  child: Center(
                                                    child: Text(
                                                      "No",
                                                      style: TextStyle(
                                                        color: Color(
                                                          0xFFEA5A1D,
                                                        ),
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),

                                            SizedBox(width: 10),

                                            // YES BUTTON
                                            Expanded(
                                              child: InkWell(
                                                onTap: () {
                                                  Navigator.pushReplacement(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginScreen(),
                                                    ),
                                                  );
                                                },

                                                child: Container(
                                                  height: 45,

                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                          10,
                                                        ),
                                                    gradient: AppColors
                                                        .buttonGradient,
                                                  ),

                                                  child: Center(
                                                    child: Text(
                                                      "Yes",
                                                      style: TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 16,
                                                        fontWeight:
                                                            FontWeight.w500,
                                                      ),
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
                          child: SvgPicture.asset(
                            'assets/images/logout.svg',
                            width: 24,
                            height: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),

              Positioned(
                top: 139,
                left: 0,
                right: 0,
                child: Center(
                  child: Column(
                    children: [
                      CircleAvatar(
                        radius: 75,
                        backgroundColor: Colors.white,
                        child: CircleAvatar(
                          radius: 70,
                          backgroundImage: AssetImage('assets/images/p.jpg'),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 154),
                            child: Text(
                              "Ashmi A B",
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight(500),
                              ),
                            ),
                          ),
                          SizedBox(width: 14),
                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => Custprofileedit(),
                                ),
                              );
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: 60, top: 16),
                              child: SvgPicture.asset(
                                'assets/images/edit.svg',
                                height: 24,
                                width: 24,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 14),

                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Container(
                          height: 78,
                          width: screenWidth * 0.95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(255, 248, 246, 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 10),

                              CircleAvatar(
                                radius: 32,
                                backgroundColor: Color.fromRGBO(
                                  255,
                                  227,
                                  219,
                                  1,
                                ),
                                child: SvgPicture.asset(
                                  'assets/images/blood.svg',
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  SizedBox(height: 13),
                                  Text(
                                    'Gender',
                                    style: TextStyle(
                                      color: Color.fromRGBO(105, 113, 129, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight(500),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'Female',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight(500),
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 14),

                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Container(
                          height: 78,
                          width: screenWidth * 0.95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(255, 248, 246, 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 10),

                              CircleAvatar(
                                radius: 32,
                                backgroundColor: Color.fromRGBO(
                                  255,
                                  227,
                                  219,
                                  1,
                                ),
                                child: SvgPicture.asset(
                                  'assets/images/ph.svg',
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(height: 13),
                                  Text(
                                    'Phone Number',
                                    style: TextStyle(
                                      color: Color.fromRGBO(105, 113, 129, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight(500),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '+91 1234567890',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight(500),
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 14),

                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Container(
                          height: 78,
                          width: screenWidth * 0.95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(255, 248, 246, 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 10),

                              CircleAvatar(
                                radius: 32,
                                backgroundColor: Color.fromRGBO(
                                  255,
                                  227,
                                  219,
                                  1,
                                ),
                                child: SvgPicture.asset(
                                  'assets/images/gm.svg',
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  SizedBox(height: 13),
                                  Text(
                                    'Email ID',
                                    style: TextStyle(
                                      color: Color.fromRGBO(105, 113, 129, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight(500),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    'abisha12@gmail.com',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight(500),
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: 14),

                      Padding(
                        padding: const EdgeInsets.only(left: 0),
                        child: Container(
                          height: 78,
                          width: screenWidth * 0.95,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color.fromRGBO(255, 248, 246, 1),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SizedBox(width: 10),

                              CircleAvatar(
                                radius: 32,
                                backgroundColor: Color.fromRGBO(
                                  255,
                                  227,
                                  219,
                                  1,
                                ),
                                child: SvgPicture.asset(
                                  'assets/images/loc.svg',
                                  height: 24,
                                  width: 24,
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,

                                children: [
                                  SizedBox(height: 13),
                                  Text(
                                    'Address',
                                    style: TextStyle(
                                      color: Color.fromRGBO(105, 113, 129, 1),
                                      fontSize: 14,
                                      fontWeight: FontWeight(500),
                                    ),
                                  ),
                                  SizedBox(height: 5),
                                  Text(
                                    '123-city, Trivandrum',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight(500),
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
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
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: InkWell(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Addtasks()),
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
          Container(
            height: 74,
            color: const Color.fromARGB(255, 255, 255, 255),
          ),

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
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 0;
                      });

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => CustomerHome()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/Home.svg",
                          width: 24,
                          colorFilter: ColorFilter.mode(
                            selectedIndex == 0
                                ? Color(0xFFEA5A1D)
                                : Color(0xFF697181),
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          "Home",
                          style: TextStyle(
                            fontSize: 12,
                            color: selectedIndex == 0
                                ? Color(0xFFEA5A1D)
                                : Color(0xFF697181),
                          ),
                        ),
                        selectedIndex == 0
                            ? Container(
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEA5A1D),
                                  shape: BoxShape.circle,
                                ),
                              )
                            : SizedBox(height: 4),
                      ],
                    ),
                  ),

                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 1;
                      });

                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Tasks()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/tsk.svg",
                          width: 24,
                          colorFilter: ColorFilter.mode(
                            selectedIndex == 1
                                ? Color(0xFFEA5A1D)
                                : Color(0xFF697181),
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          "Tasks",
                          style: TextStyle(
                            fontSize: 12,
                            color: selectedIndex == 1
                                ? Color(0xFFEA5A1D)
                                : Color(0xFF697181),
                          ),
                        ),
                        selectedIndex == 1
                            ? Container(
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEA5A1D),
                                  shape: BoxShape.circle,
                                ),
                              )
                            : SizedBox(height: 4),
                      ],
                    ),
                  ),

                  SizedBox(width: screenWidth * 0.12),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 2;
                      });

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => Bookings()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/bk.svg",
                          width: 24,
                          colorFilter: ColorFilter.mode(
                            selectedIndex == 2
                                ? Color(0xFFEA5A1D)
                                : Color(0xFF697181),
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          "Bookings",
                          style: TextStyle(
                            fontSize: 12,
                            color: selectedIndex == 2
                                ? Color(0xFFEA5A1D)
                                : Color(0xFF697181),
                          ),
                        ),
                        selectedIndex == 2
                            ? Container(
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEA5A1D),
                                  shape: BoxShape.circle,
                                ),
                              )
                            : SizedBox(height: 4),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        selectedIndex = 3;
                      });

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => EditProfile()),
                      );
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset(
                          "assets/images/pr.svg",
                          width: 24,
                          colorFilter: ColorFilter.mode(
                            selectedIndex == 3
                                ? Color(0xFFEA5A1D)
                                : Color(0xFF697181),
                            BlendMode.srcIn,
                          ),
                        ),
                        Text(
                          "Profile",
                          style: TextStyle(
                            fontSize: 12,
                            color: selectedIndex == 3
                                ? Color(0xFFEA5A1D)
                                : Color(0xFF697181),
                          ),
                        ),
                        selectedIndex == 3
                            ? Container(
                                width: 4,
                                height: 4,
                                decoration: BoxDecoration(
                                  color: Color(0xFFEA5A1D),
                                  shape: BoxShape.circle,
                                ),
                              )
                            : SizedBox(height: 4),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
