import 'package:flutter/material.dart';
import 'package:pawfect_match/screens/auth/customer/customer_signup5.dart';

class Signupselecter extends StatelessWidget {
  const Signupselecter({super.key});

  void navigateToScreen(
    BuildContext context,
    Widget screen,
  ) {
    Navigator.push(
      context,

      PageRouteBuilder(
        transitionDuration:
            const Duration(milliseconds: 300),

        pageBuilder: (_, animation, __) {
          return FadeTransition(
            opacity: animation,
            child: screen,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },

      child: Scaffold(
        backgroundColor: const Color(0xFFF9F9F9),

        body: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding:
                  const EdgeInsets.symmetric(
                    horizontal: 20,
                  ),

              child: Container(
                padding:
                    const EdgeInsets.symmetric(
                      vertical: 25,
                      horizontal: 20,
                    ),

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius:
                      BorderRadius.circular(16),

                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(
                        30,
                        0,
                        0,
                        0,
                      ),

                      blurRadius: 12,

                      offset: Offset(0, 6),
                    ),
                  ],
                ),

                child: Column(
                  mainAxisSize: MainAxisSize.min,

                  children: [
                    const Text(
                      "Sign up your account",

                      textAlign: TextAlign.center,

                      style: TextStyle(
                        fontSize: 24,
                        fontWeight:
                            FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 25),

                    buildTile(
                      icon:
                          Icons.person_outline,

                      text: "Customer",

                      onTap: () {
                        navigateToScreen(
                          context,
                          const CustomerSignup(),
                        );
                      },
                    ),

                    const SizedBox(height: 15),

                    buildTile(
                      icon: Icons.work_outline,
                      text: "Worker",

                      onTap: () {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Worker signup coming soon",
                            ),

                            behavior:
                                SnackBarBehavior
                                    .floating,
                          ),
                        );
                      },
                    ),

                    const SizedBox(height: 15),

                    buildTile(
                      icon:
                          Icons
                              .storefront_outlined,

                      text: "Shop Owner",

                      onTap: () {
                        ScaffoldMessenger.of(
                          context,
                        ).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Shop Owner signup coming soon",
                            ),

                            behavior:
                                SnackBarBehavior
                                    .floating,
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget buildTile({
    required IconData icon,
    required String text,
    required VoidCallback onTap,
  }) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),

      onTap: onTap,

      child: Container(
        height: 60,
        width: double.infinity,

        padding: const EdgeInsets.symmetric(
          horizontal: 20,
        ),

        decoration: BoxDecoration(
          color: const Color(0xFFFAFAFA),

          borderRadius:
              BorderRadius.circular(10),

          border: Border.all(
            color: const Color(0xFFCCCCCC),
            width: 1,
          ),
        ),

        child: Row(
          children: [
            Icon(
              icon,
              color: const Color(0xFFEA5A1D),
              size: 22,
            ),

            const SizedBox(width: 15),

            Expanded(
              child: Text(
                text,

                style: const TextStyle(
                  fontSize: 14,
                  fontWeight:
                      FontWeight.w500,
                ),
              ),
            ),

            const Icon(
              Icons.arrow_forward_ios,
              size: 16,
              color: Colors.black45,
            ),
          ],
        ),
      ),
    );
  }
}