import 'package:flutter/material.dart';
import 'package:pawfect_match/screens/auth/resetpassscreen.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void navigateToReset() {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      Navigator.push(
        context,

        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 300),

          pageBuilder: (_, animation, __) {
            return FadeTransition(
              opacity: animation,
              child: const ResetPasswordScreen(),
            );
          },
        ),
      );
    }
  }

  InputDecoration inputDecoration() {
    return InputDecoration(
      hintText: "Email ID",

      prefixIcon: const Icon(Icons.email),

      filled: true,
      fillColor: Colors.grey.shade200,

      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),

        borderSide: const BorderSide(color: Color(0xFFEA5A1D), width: 1),
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
        backgroundColor: Colors.white,

        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),

              child: Form(
                key: _formKey,

                child: Padding(
                  padding: const EdgeInsets.only(top: 110),

                  child: Column(
                    children: [
                      const SizedBox(height: 60),

                      const Text(
                        "Forget Password?",

                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 10),

                      const Text(
                        "Enter your E-mail below to receive your\npassword reset instruction",

                        textAlign: TextAlign.center,

                        style: TextStyle(color: Colors.grey, height: 1.5),
                      ),

                      const SizedBox(height: 30),

                      const Align(
                        alignment: Alignment.centerLeft,

                        child: Text("Email ID"),
                      ),

                      const SizedBox(height: 5),

                      TextFormField(
                        controller: emailController,

                        keyboardType: TextInputType.emailAddress,

                        decoration: inputDecoration(),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter email";
                          }

                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return "Enter valid email";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,

                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),

                          onTap: navigateToReset,

                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),

                              gradient: const LinearGradient(
                                colors: [Color(0xFF992015), Color(0xFFEA5A1D)],
                              ),
                            ),

                            child: const Center(
                              child: Text(
                                "Next",

                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
