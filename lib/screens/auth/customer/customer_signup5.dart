import 'dart:io';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pawfect_match/screens/auth/login_screen3.dart';

class CustomerSignup extends StatefulWidget {
  const CustomerSignup({super.key});

  @override
  State<CustomerSignup> createState() => _CustomerSignupState();
}

class _CustomerSignupState extends State<CustomerSignup> {
  final _formKey = GlobalKey<FormState>();

  File? selectedImage;

  final picker = ImagePicker();

  final nameController = TextEditingController();

  final phoneController = TextEditingController();

  final emailController = TextEditingController();

  final addressController = TextEditingController();

  final passwordController = TextEditingController();

  final confirmController = TextEditingController();

  bool obscurePassword = true;
  bool obscureConfirm = true;

  String gender = "";

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();
    passwordController.dispose();
    confirmController.dispose();
    super.dispose();
  }

  Future<void> pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      setState(() {
        selectedImage = File(pickedFile.path);
      });
    }
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

  void signupUser() {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      if (gender.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text("Please select gender"),
            behavior: SnackBarBehavior.floating,
          ),
        );

        return;
      }

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Signup Successful"),
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
                child: const LoginScreen(),
              );
            },
          ),
        );
      });
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
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    const SizedBox(height: 20),

                    const Text(
                      "Create a new account",
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 25),

                    InkWell(
                      borderRadius: BorderRadius.circular(100),
                      onTap: pickImage,
                      child: Column(
                        children: [
                          CircleAvatar(
                            radius: 60,
                            backgroundColor: Colors.grey[300],
                            backgroundImage: selectedImage != null
                                ? FileImage(selectedImage!)
                                : null,
                            child: selectedImage == null
                                ? const Icon(
                                    Icons.person,
                                    size: 40,
                                    color: Colors.white,
                                  )
                                : null,
                          ),

                          const SizedBox(height: 8),

                          const Text(
                            "+ Add Image",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 25),

                    label("Name"),

                    inputField(controller: nameController, hint: "Name"),

                    const SizedBox(height: 15),

                    label("Gender"),

                    Row(
                      children: [
                        genderRadio("Male"),
                        genderRadio("Female"),
                        genderRadio("Other"),
                      ],
                    ),

                    const SizedBox(height: 15),

                    label("Phone Number"),

                    inputField(
                      controller: phoneController,
                      hint: "Phone Number",
                      keyboardType: TextInputType.phone,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        LengthLimitingTextInputFormatter(10),
                      ],
                    ),

                    const SizedBox(height: 15),

                    label("Email ID"),

                    inputField(
                      controller: emailController,
                      hint: "Email ID",
                      keyboardType: TextInputType.emailAddress,
                    ),

                    const SizedBox(height: 15),

                    label("Address"),

                    inputField(controller: addressController, hint: "Address"),

                    const SizedBox(height: 15),

                    label("Password"),

                    inputField(
                      controller: passwordController,
                      hint: "Password",
                      isPassword: true,
                    ),

                    const SizedBox(height: 15),

                    label("Confirm Password"),

                    inputField(
                      controller: confirmController,
                      hint: "Confirm Password",
                      isConfirm: true,
                    ),

                    const SizedBox(height: 25),

                    SizedBox(
                      width: double.infinity,
                      child: InkWell(
                        borderRadius: BorderRadius.circular(12),
                        onTap: signupUser,
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
                              "Sign up",
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

                    const SizedBox(height: 20),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text("Already have an account ? "),

                        InkWell(
                          onTap: () {
                            navigateToScreen(const LoginScreen());
                          },
                          child: const Text(
                            "Login",
                            style: TextStyle(fontWeight: FontWeight.bold),
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
    );
  }

  Widget label(String text) {
    return Align(
      alignment: Alignment.centerLeft,
      child: Padding(
        padding: const EdgeInsets.only(bottom: 5),
        child: Text(text),
      ),
    );
  }

  Widget inputField({
    required TextEditingController controller,
    required String hint,
    bool isPassword = false,
    bool isConfirm = false,
    TextInputType keyboardType = TextInputType.text,
    List<TextInputFormatter>? inputFormatters,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,

      obscureText: isPassword
          ? obscurePassword
          : isConfirm
          ? obscureConfirm
          : false,

      validator: (value) {
        if (value == null || value.trim().isEmpty) {
          return "$hint is required";
        }

        if (hint == "Name") {
          if (value.trim().length < 3) {
            return "Enter valid name";
          }
        }

        if (hint == "Phone Number") {
          if (!RegExp(r'^[0-9]{10}$').hasMatch(value)) {
            return "Enter valid phone number";
          }
        }

        if (hint == "Email ID") {
          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
            return "Enter valid email";
          }
        }

        if (hint == "Password") {
          if (value.length < 6) {
            return "Minimum 6 characters";
          }
        }

        if (isConfirm) {
          if (value != passwordController.text) {
            return "Passwords do not match";
          }
        }

        return null;
      },

      decoration: inputDecoration(
        hint: hint,

        suffixIcon: isPassword || isConfirm
            ? IconButton(
                icon: Icon(
                  (isPassword ? obscurePassword : obscureConfirm)
                      ? Icons.visibility
                      : Icons.visibility_off,
                ),
                onPressed: () {
                  setState(() {
                    if (isPassword) {
                      obscurePassword = !obscurePassword;
                    } else {
                      obscureConfirm = !obscureConfirm;
                    }
                  });
                },
              )
            : null,
      ),
    );
  }

  Widget genderRadio(String value) {
    return Row(
      children: [
        Radio(
          value: value,
          groupValue: gender,
          activeColor: const Color(0xFFEA5A1D),
          onChanged: (val) {
            setState(() {
              gender = val.toString();
            });
          },
        ),

        Text(value),

        const SizedBox(width: 10),
      ],
    );
  }
}
