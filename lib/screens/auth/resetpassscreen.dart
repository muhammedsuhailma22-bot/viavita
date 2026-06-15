import 'package:flutter/material.dart';
import 'package:pawfect_match/screens/customerscreens/customer_home.dart';
import 'package:pawfect_match/screens/customerscreens/main_navigation.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  final _formKey = GlobalKey<FormState>();

  final passwordController = TextEditingController();

  final confirmController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirm = true;

  @override
  void dispose() {
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  InputDecoration inputDecoration({
    required String hint,
    required Widget suffixIcon,
  }) {
    return InputDecoration(
      hintText: hint,

      suffixIcon: suffixIcon,

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

  void resetPassword() {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Password Reset Successful"),

          behavior: SnackBarBehavior.floating,
        ),
      );

      Future.delayed(const Duration(milliseconds: 800), () {
        Navigator.pushReplacement(
          context,

          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),

            pageBuilder: (_, animation, __) {
              return FadeTransition(
                opacity: animation,
                child: const MainNavigationScreen(),
              );
            },
          ),
        );
      });
    }
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
                      const SizedBox(height: 80),

                      const Text(
                        "Reset Password",

                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.w500,
                        ),
                      ),

                      const SizedBox(height: 40),

                      const Text(
                        "Enter your new password",

                        style: TextStyle(fontSize: 16, color: Colors.black),
                      ),

                      const SizedBox(height: 30),

                      const Align(
                        alignment: Alignment.centerLeft,

                        child: Text("Password"),
                      ),

                      const SizedBox(height: 5),

                      TextFormField(
                        controller: passwordController,

                        obscureText: obscurePassword,

                        decoration: inputDecoration(
                          hint: "Password",

                          suffixIcon: IconButton(
                            icon: Icon(
                              obscurePassword
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),

                            onPressed: () {
                              setState(() {
                                obscurePassword = !obscurePassword;
                              });
                            },
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Enter password";
                          }

                          if (value.length < 6) {
                            return "Minimum 6 characters";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 20),

                      const Align(
                        alignment: Alignment.centerLeft,

                        child: Text("Confirm Password"),
                      ),

                      const SizedBox(height: 5),

                      TextFormField(
                        controller: confirmController,

                        obscureText: obscureConfirm,

                        decoration: inputDecoration(
                          hint: "Confirm Password",

                          suffixIcon: IconButton(
                            icon: Icon(
                              obscureConfirm
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                            ),

                            onPressed: () {
                              setState(() {
                                obscureConfirm = !obscureConfirm;
                              });
                            },
                          ),
                        ),

                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Confirm your password";
                          }

                          if (value != passwordController.text) {
                            return "Passwords do not match";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 30),

                      SizedBox(
                        width: double.infinity,

                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),

                          onTap: resetPassword,

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
                                "Confirm",

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
