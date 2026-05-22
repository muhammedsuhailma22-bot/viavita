import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:pawfect_match/models/loginmodel.dart';
import 'package:pawfect_match/providers/loginprovider.dart';
import 'package:pawfect_match/screens/customerscreens/customer_home.dart';
import 'package:pawfect_match/screens/forgot_password_screen.dart';
import 'package:pawfect_match/screens/signupselecter4.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscurePassword = true;
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  Future<void> loginUser() async {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      setState(() {
        isLoading = true;
      });

      final user = Loginmodel(
        email: emailController.text.trim(),
        password: passwordController.text.trim(),
      );

      final provider = Provider.of<LoginProvider>(context, listen: false);

      final success = await provider.loginuser(user);

      setState(() {
        isLoading = false;
      });

      if (success) {
        Navigator.pushReplacement(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 300),

            pageBuilder: (_, animation, __) {
              return FadeTransition(
                opacity: animation,
                child: const CustomerHome(),
              );
            },
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Login Failed"),
            behavior: SnackBarBehavior.floating,
          ),
        );
      }
    }
  }

  InputDecoration inputDecoration({required String hint, Widget? suffixIcon}) {
    return InputDecoration(
      hintText: hint,

      suffixIcon: suffixIcon,

      filled: true,
      fillColor: const Color(0xFFF2F2F2),

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
        backgroundColor: const Color(0xFFF9F9F9),

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
                        "Sign in your account",

                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.w600,
                        ),
                      ),

                      const SizedBox(height: 25),

                      const Align(
                        alignment: Alignment.centerLeft,
                        child: Text("Email ID"),
                      ),

                      const SizedBox(height: 5),

                      TextFormField(
                        controller: emailController,

                        keyboardType: TextInputType.emailAddress,

                        decoration: inputDecoration(hint: "Email ID"),

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

                      const SizedBox(height: 15),

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

                      const SizedBox(height: 10),

                      Align(
                        alignment: Alignment.centerRight,

                        child: InkWell(
                          onTap: () {
                            Navigator.push(
                              context,

                              PageRouteBuilder(
                                transitionDuration: const Duration(
                                  milliseconds: 300,
                                ),

                                pageBuilder: (_, animation, __) {
                                  return FadeTransition(
                                    opacity: animation,

                                    child: const ForgotPasswordScreen(),
                                  );
                                },
                              ),
                            );
                          },

                          child: const Text(
                            "Forgot password?",

                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ),

                      const SizedBox(height: 20),

                      SizedBox(
                        width: double.infinity,

                        child: InkWell(
                          borderRadius: BorderRadius.circular(12),

                          onTap: isLoading ? null : loginUser,

                          child: Container(
                            padding: const EdgeInsets.symmetric(vertical: 15),

                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(12),

                              gradient: const LinearGradient(
                                colors: [Color(0xFF992015), Color(0xFFEA5A1D)],
                              ),
                            ),

                            child: Center(
                              child: isLoading
                                  ? const SizedBox(
                                      height: 22,
                                      width: 22,

                                      child: CircularProgressIndicator(
                                        color: Colors.white,

                                        strokeWidth: 2,
                                      ),
                                    )
                                  : const Text(
                                      "Sign in",

                                      style: TextStyle(
                                        color: Colors.white,

                                        fontSize: 16,
                                      ),
                                    ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 25),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: const [
                          SizedBox(
                            height: 1,
                            width: 92,

                            child: Divider(thickness: 1, color: Colors.black),
                          ),

                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),

                            child: Text("Or"),
                          ),

                          SizedBox(
                            height: 1,
                            width: 92,

                            child: Divider(thickness: 1, color: Colors.black),
                          ),
                        ],
                      ),

                      const SizedBox(height: 20),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          Column(
                            children: [
                              Image.asset("assets/images/gg.png", height: 24),

                              const SizedBox(height: 5),

                              const Text(
                                "Google",

                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),

                          const SizedBox(width: 30),

                          Column(
                            children: [
                              Image.asset("assets/images/fb.png", height: 24),

                              const SizedBox(height: 5),

                              const Text(
                                "Facebook",

                                style: TextStyle(fontSize: 12),
                              ),
                            ],
                          ),
                        ],
                      ),

                      const SizedBox(height: 25),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children: [
                          const Text("Don’t have an account ? "),

                          InkWell(
                            onTap: () {
                              Navigator.push(
                                context,

                                PageRouteBuilder(
                                  transitionDuration: const Duration(
                                    milliseconds: 300,
                                  ),

                                  pageBuilder: (_, animation, __) {
                                    return FadeTransition(
                                      opacity: animation,

                                      child: const Signupselecter(),
                                    );
                                  },
                                ),
                              );
                            },

                            child: const Text(
                              "Sign Up",

                              style: TextStyle(
                                fontWeight: FontWeight.w400,

                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
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
