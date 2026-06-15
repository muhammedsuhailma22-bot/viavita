import 'package:flutter/material.dart';
import 'package:pawfect_match/models/addtaskmodel.dart';
import 'package:pawfect_match/providers/addtaskproviders.dart';
import 'package:pawfect_match/providers/categoryprovider.dart';
import 'package:provider/provider.dart';

class Addtasks extends StatefulWidget {
  const Addtasks({super.key});

  @override
  State<Addtasks> createState() => _AddtasksState();
}

class _AddtasksState extends State<Addtasks> {
  final _formKey = GlobalKey<FormState>();

  final descriptionController = TextEditingController();
  final locationController = TextEditingController();
  final budgetController = TextEditingController();
  final dateController = TextEditingController();

  String? selectedCategories;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      Provider.of<CategoryProvider>(context, listen: false).getCategories();
    });
  }

  @override
  void dispose() {
    descriptionController.dispose();
    locationController.dispose();
    budgetController.dispose();
    dateController.dispose();
    super.dispose();
  }

  Future<void> selectDate() async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime.now(),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      setState(() {
        dateController.text =
            "${pickedDate.day}/${pickedDate.month}/${pickedDate.year}";
      });
    }
  }

  Future<void> submitForm() async {
    FocusScope.of(context).unfocus();

    if (_formKey.currentState!.validate()) {
      final task = AddTaskModel(
        customerId: "1",

        jobCategory: selectedCategories!,

        description: descriptionController.text.trim(),

        location: locationController.text.trim(),

        budget: budgetController.text.trim(),

        deadlineDate: dateController.text.trim(),
      );

      final success = await Provider.of<AddTaskProvider>(
        context,
        listen: false,
      ).addTask(task);

      if (!mounted) return;

      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Task Added Successfully")),
        );

        Navigator.pop(context);
      } else {
        ScaffoldMessenger.of(
          context,
        ).showSnackBar(const SnackBar(content: Text("Task Add Failed")));
      }
    }
  }

  InputDecoration inputDecoration({
    required String hint,
    Widget? suffixIcon,
    String? prefixText,
  }) {
    return InputDecoration(
      hintText: hint,

      prefixText: prefixText,

      suffixIcon: suffixIcon,

      hintStyle: const TextStyle(
        fontSize: 16,
        color: Color.fromRGBO(105, 113, 129, 1),
      ),

      filled: true,
      fillColor: Colors.grey.shade100,

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

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(left: 13),

      child: Text(
        title,

        style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w500),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },

      child: Scaffold(
        backgroundColor: Colors.white,

        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,

          title: const Text(
            "Add Tasks",

            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),

          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.black,
            ),

            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),

        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.only(bottom: 30),

            child: Form(
              key: _formKey,

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const SizedBox(height: 32),

                  sectionTitle("Job Categories"),

                  const SizedBox(height: 5),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),

                    child: Consumer<CategoryProvider>(
                      builder: (context, provider, child) {
                        if (provider.isLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }

                        return DropdownButtonFormField<String>(
                          value: selectedCategories,

                          dropdownColor: Colors.white,

                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 16,
                          ),

                          hint: const Text(
                            "Job Categories",
                            style: TextStyle(color: Colors.black),
                          ),

                          decoration: inputDecoration(hint: ""),

                          items: provider.categories.map((item) {
                            return DropdownMenuItem<String>(
                              value: item.id,

                              child: Text(
                                item.categoryName,

                                style: const TextStyle(
                                  color: Colors.black,
                                  fontSize: 16,
                                ),
                              ),
                            );
                          }).toList(),

                          onChanged: (value) {
                            setState(() {
                              selectedCategories = value;
                            });
                          },
                        );
                      },
                    ),
                  ),
                  const SizedBox(height: 18),

                  sectionTitle("Description"),

                  const SizedBox(height: 5),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),

                    child: TextFormField(
                      controller: descriptionController,

                      maxLines: 4,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter description";
                        }
                        return null;
                      },

                      decoration: inputDecoration(hint: "Description"),
                    ),
                  ),

                  const SizedBox(height: 18),

                  sectionTitle("Location"),

                  const SizedBox(height: 5),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),

                    child: TextFormField(
                      controller: locationController,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter location";
                        }
                        return null;
                      },

                      decoration: inputDecoration(hint: "Location"),
                    ),
                  ),

                  const SizedBox(height: 18),

                  sectionTitle("Estimated Budget"),

                  const SizedBox(height: 5),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),

                    child: TextFormField(
                      controller: budgetController,

                      keyboardType: TextInputType.number,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please enter budget";
                        }
                        return null;
                      },

                      decoration: inputDecoration(
                        hint: "0/-",
                        prefixText: "₹ ",
                      ),
                    ),
                  ),

                  const SizedBox(height: 18),

                  sectionTitle("Expected days for completion"),

                  const SizedBox(height: 5),

                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),

                    child: TextFormField(
                      controller: dateController,

                      readOnly: true,

                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return "Please select date";
                        }
                        return null;
                      },

                      onTap: selectDate,

                      decoration: inputDecoration(
                        hint: "DD/MM/YYYY",

                        suffixIcon: const Icon(Icons.calendar_today_outlined),
                      ),
                    ),
                  ),

                  const SizedBox(height: 50),

                  Center(
                    child: InkWell(
                      borderRadius: BorderRadius.circular(10),

                      onTap: submitForm,

                      child: Container(
                        height: 55,

                        width: screenWidth * 0.95,

                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                          gradient: const LinearGradient(
                            colors: [Color(0xFF992015), Color(0xFFEA5A1D)],
                          ),
                        ),

                        child: const Center(
                          child: Text(
                            "Confirm",

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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
