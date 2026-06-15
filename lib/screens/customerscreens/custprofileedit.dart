import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pawfect_match/providers/custprofileproviders.dart';
import 'package:provider/provider.dart';

class Custprofileedit extends StatefulWidget {
  const Custprofileedit({super.key});

  @override
  State<Custprofileedit> createState() => _CustprofileeditState();
}

class _CustprofileeditState extends State<Custprofileedit> {
  String gender = "Male";

  final formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final phoneController = TextEditingController();
  final emailController = TextEditingController();
  final addressController = TextEditingController();

  File? selectedImage;

  final ImagePicker picker = ImagePicker();

  @override
  void initState() {
    super.initState();

    final profile = Provider.of<ProfileProvider>(
      context,
      listen: false,
    ).profile;

    if (profile != null) {
      nameController.text = profile.name;
      phoneController.text = profile.phone;
      emailController.text = profile.email;
      addressController.text = profile.address;

      gender = profile.gender;
    }
  }

  @override
  void dispose() {
    nameController.dispose();
    phoneController.dispose();
    emailController.dispose();
    addressController.dispose();

    super.dispose();
  }

  Future<void> pickImage() async {
    final XFile? image = await picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        selectedImage = File(image.path);
      });
    }
  }

  InputDecoration inputDecoration(String hint) {
    return InputDecoration(
      hintText: hint,

      filled: true,

      fillColor: const Color.fromRGBO(252, 247, 247, 1),

      contentPadding: const EdgeInsets.symmetric(horizontal: 20),

      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),

        borderSide: BorderSide.none,
      ),

      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),

        borderSide: BorderSide.none,
      ),

      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),

        borderSide: const BorderSide(color: Color(0xFFEA5A1D)),
      ),
    );
  }

  Future<void> updateProfile() async {
    FocusScope.of(context).unfocus();

    if (formKey.currentState!.validate()) {
      final provider = Provider.of<ProfileProvider>(context, listen: false);

      final result = await provider.updateProfile(
        id: provider.profile!.id,

        name: nameController.text,

        gender: gender,

        phone: phoneController.text,

        email: emailController.text,

        address: addressController.text,
      );

      if (result) {
        await provider.fetchProfile(provider.profile!.id);

        if (!mounted) return;

        showDialog(
          context: context,

          barrierDismissible: false,

          builder: (context) {
            return Dialog(
              backgroundColor: Colors.transparent,

              child: Container(
                height: 220,

                decoration: BoxDecoration(
                  color: Colors.white,

                  borderRadius: BorderRadius.circular(20),
                ),

                child: Column(
                  children: [
                    const Spacer(),

                    Image.asset("assets/images/green.png", height: 60),

                    const SizedBox(height: 25),

                    const Text(
                      "Update successfully",

                      style: TextStyle(
                        fontSize: 18,

                        fontWeight: FontWeight.w500,
                      ),
                    ),

                    const Spacer(),
                  ],
                ),
              ),
            );
          },
        );

        await Future.delayed(const Duration(seconds: 2));

        if (mounted) {
          Navigator.pop(context);

          Navigator.pop(context);
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    final profile = context.watch<ProfileProvider>().profile;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },

      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          elevation: 0,

          backgroundColor: Colors.white,

          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },

            icon: const Icon(Icons.arrow_back_ios, color: Colors.black),
          ),

          title: const Text(
            "Edit Profile",

            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),

            child: Form(
              key: formKey,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  SizedBox(height: size.height * 0.04),

                  Center(
                    child: Stack(
                      clipBehavior: Clip.none,

                      children: [
                        CircleAvatar(
                          radius: 90,

                          backgroundImage: selectedImage != null
                              ? FileImage(selectedImage!)
                              : profile != null && profile.avatar.isNotEmpty
                              ? NetworkImage(profile.avatar)
                              : const AssetImage('assets/images/p.jpg')
                                    as ImageProvider,
                        ),

                        Positioned(
                          bottom: 6,

                          left: 8,

                          child: InkWell(
                            borderRadius: BorderRadius.circular(50),

                            onTap: pickImage,

                            child: Image.asset('assets/images/stck.png'),
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: size.height * 0.05),

                  const Text("Name"),

                  const SizedBox(height: 5),

                  TextFormField(
                    controller: nameController,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter name";
                      }

                      return null;
                    },

                    decoration: inputDecoration("Full Name"),
                  ),

                  SizedBox(height: size.height * 0.03),

                  const Text("Gender"),

                  Row(
                    children: [
                      genderTile("Male"),

                      genderTile("Female"),

                      genderTile("Other"),
                    ],
                  ),

                  SizedBox(height: size.height * 0.03),

                  const Text("Phone Number"),

                  TextFormField(
                    controller: phoneController,

                    keyboardType: TextInputType.phone,

                    validator: (value) {
                      if (value == null || value.length != 10) {
                        return "Enter valid phone";
                      }

                      return null;
                    },

                    decoration: inputDecoration("Phone Number"),
                  ),

                  SizedBox(height: size.height * 0.03),

                  const Text("Email ID"),

                  TextFormField(
                    controller: emailController,

                    keyboardType: TextInputType.emailAddress,

                    validator: (value) {
                      if (value == null || !value.contains("@")) {
                        return "Enter valid email";
                      }

                      return null;
                    },

                    decoration: inputDecoration("Email ID"),
                  ),

                  SizedBox(height: size.height * 0.03),

                  const Text("Address"),

                  TextFormField(
                    controller: addressController,

                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Enter address";
                      }

                      return null;
                    },

                    decoration: inputDecoration("Address"),
                  ),

                  SizedBox(height: size.height * 0.05),

                  InkWell(
                    onTap: updateProfile,

                    child: Container(
                      height: size.height * 0.07,

                      width: double.infinity,

                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),

                        gradient: const LinearGradient(
                          colors: [Color(0xFF992015), Color(0xFFEA5A1D)],
                        ),
                      ),

                      child: const Center(
                        child: Text(
                          "Update",

                          style: TextStyle(
                            color: Colors.white,

                            fontSize: 16,

                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget genderTile(String value) {
    return Row(
      children: [
        Radio<String>(
          value: value,

          groupValue: gender,

          activeColor: const Color(0xFFEA5A1D),

          onChanged: (newValue) {
            setState(() {
              gender = newValue!;
            });
          },
        ),

        Text(
          value,

          style: const TextStyle(
            fontSize: 16,

            color: Color.fromRGBO(105, 113, 129, 1),
          ),
        ),
      ],
    );
  }
}
