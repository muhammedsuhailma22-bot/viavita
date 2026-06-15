import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawfect_match/providers/custprofileproviders.dart';
import 'package:provider/provider.dart';

import 'package:pawfect_match/screens/auth/login_screen3.dart';
import 'package:pawfect_match/screens/customerscreens/custprofileedit.dart';
import 'package:pawfect_match/utils/app_colors.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      final prefs = await SharedPreferences.getInstance();

      final id = prefs.getString("customer_id");

      if (id != null) {
        context.read<ProfileProvider>().fetchProfile(int.parse(id));
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Consumer<ProfileProvider>(
      builder: (context, provider, child) {
        if (provider.profile == null) {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }

        final profile = provider.profile!;

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

                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(20),

                        bottomRight: Radius.circular(20),
                      ),
                    ),

                    child: Padding(
                      padding: const EdgeInsets.only(bottom: 80, left: 20),

                      child: Row(
                        children: [
                          const SizedBox(width: 24),

                          const SizedBox(width: 20),

                          const Text(
                            "Edit Profile",

                            style: TextStyle(
                              fontSize: 20,

                              color: Colors.white,

                              fontWeight: FontWeight.w500,
                            ),
                          ),

                          const Spacer(),

                          InkWell(
                            onTap: () {
                              showDialog(
                                context: context,

                                builder: (context) {
                                  return AlertDialog(
                                    title: const Text("Logout"),

                                    content: const Text(
                                      "Are you sure you want to Logout?",
                                    ),

                                    actions: [
                                      TextButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },

                                        child: const Text("No"),
                                      ),

                                      TextButton(
                                        onPressed: () {
                                          Navigator.pushReplacement(
                                            context,

                                            MaterialPageRoute(
                                              builder: (_) => LoginScreen(),
                                            ),
                                          );
                                        },

                                        child: const Text("Yes"),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },

                            child: SvgPicture.asset(
                              "assets/images/logout.svg",

                              height: 24,
                            ),
                          ),

                          const SizedBox(width: 20),
                        ],
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

                              backgroundImage: profile.avatar.isNotEmpty
                                  ? NetworkImage(profile.avatar)
                                  : const AssetImage("assets/images/p.jpg")
                                        as ImageProvider,
                            ),
                          ),

                          const SizedBox(height: 10),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,

                            children: [
                              Text(
                                profile.name,

                                style: const TextStyle(
                                  fontSize: 18,

                                  fontWeight: FontWeight.w500,
                                ),
                              ),

                              const SizedBox(width: 20),

                              InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,

                                    MaterialPageRoute(
                                      builder: (_) => const Custprofileedit(),
                                    ),
                                  );
                                },

                                child: SvgPicture.asset(
                                  "assets/images/edit.svg",

                                  height: 24,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 14),

                          profileTile(
                            width: screenWidth,

                            icon: "assets/images/blood.svg",

                            title: "Gender",

                            value: profile.gender,
                          ),

                          const SizedBox(height: 14),

                          profileTile(
                            width: screenWidth,

                            icon: "assets/images/ph.svg",

                            title: "Phone Number",

                            value: profile.phone,
                          ),

                          const SizedBox(height: 14),

                          profileTile(
                            width: screenWidth,

                            icon: "assets/images/gm.svg",

                            title: "Email ID",

                            value: profile.email,
                          ),

                          const SizedBox(height: 14),

                          profileTile(
                            width: screenWidth,

                            icon: "assets/images/loc.svg",

                            title: "Address",

                            value: profile.address,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget profileTile({
    required double width,
    required String icon,
    required String title,
    required String value,
  }) {
    return Container(
      height: 78,
      width: width * 0.95,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: const Color.fromRGBO(255, 248, 246, 1),
      ),

      child: Row(
        children: [
          const SizedBox(width: 10),

          CircleAvatar(
            radius: 32,

            backgroundColor: const Color.fromRGBO(255, 227, 219, 1),

            child: SvgPicture.asset(icon, height: 24, width: 24),
          ),

          const SizedBox(width: 20),

          Column(
            crossAxisAlignment: CrossAxisAlignment.start,

            children: [
              const SizedBox(height: 13),

              Text(
                title,

                style: const TextStyle(
                  color: Color.fromRGBO(105, 113, 129, 1),
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                ),
              ),

              const SizedBox(height: 5),

              Text(
                value,

                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
