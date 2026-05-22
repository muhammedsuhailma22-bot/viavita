import 'package:flutter/material.dart';
import 'package:pawfect_match/screens/auth/login_screen3.dart';

class GetStartedScreen extends StatelessWidget {
  const GetStartedScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              "assets/images/getstarted.jpg",
              fit: BoxFit.cover,
            ),
          ),

          Positioned.fill(
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,

                  colors: [Colors.transparent, Colors.black87],
                ),
              ),
            ),
          ),

          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Spacer(),

                  Text(
                    "Your Home, Our Care",

                    style: TextStyle(
                      color: Colors.white,
                      fontSize: screenWidth * 0.08,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Poppins",
                    ),
                  ),

                  const SizedBox(height: 10),

                  const Text(
                    "From plumbing to painting, we bring trusted professionals right to your doorstep. Book, track, and manage all your home needs in just a few taps",

                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      height: 1.5,
                    ),
                  ),

                  const SizedBox(height: 40),

                  SizedBox(
                    width: double.infinity,
                    height: 55,

                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),

                      onTap: () {
                        Navigator.pushReplacement(
                          context,

                          PageRouteBuilder(
                            transitionDuration: const Duration(
                              milliseconds: 300,
                            ),

                            pageBuilder: (_, animation, __) {
                              return FadeTransition(
                                opacity: animation,
                                child: const LoginScreen(),
                              );
                            },
                          ),
                        );
                      },

                      child: Container(
                        decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10)),

                          gradient: LinearGradient(
                            begin: Alignment.centerLeft,

                            end: Alignment.centerRight,

                            colors: [Color(0xFF992015), Color(0xFFEA5A1D)],
                          ),
                        ),

                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.center,

                          children: [
                            Text(
                              "Get Started",

                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w600,
                              ),
                            ),

                            SizedBox(width: 220),

                            Image(image: AssetImage('assets/images/arow.png')),
                          ],
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
