import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawfect_match/providers/bookingsprovider.dart';
import 'package:provider/provider.dart';

import 'package:pawfect_match/customertask/tasksetailed.dart';
import 'package:pawfect_match/screens/customerscreens/pending_task_widget.dart';
import 'package:pawfect_match/utils/app_colors.dart';

import 'package:pawfect_match/providers/taskproviders.dart';
import 'package:pawfect_match/providers/custprofileproviders.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomerHome extends StatefulWidget {
  const CustomerHome({super.key});

  @override
  State<CustomerHome> createState() => _CustomerHomeState();
}

class _CustomerHomeState extends State<CustomerHome> {
  final FocusNode searchFocus = FocusNode();
  @override
  void dispose() {
    searchFocus.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();

    Future.microtask(() async {
      final prefs = await SharedPreferences.getInstance();

      final id = prefs.getString("customer_id");

      context.read<TaskProvider>().getPendingTasks();
      context.read<EstimateProvider>().fetchEstimates(116);

      if (id != null) {
        context.read<ProfileProvider>().fetchProfile(int.parse(id));
      }
    });
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

  @override
  Widget build(BuildContext context) {
    final profile = context.watch<ProfileProvider>().profile;

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                top: 24,
                left: 20,
                right: 20,
                bottom: 80,
              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,

                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 28,

                            backgroundImage:
                                profile != null && profile.avatar.isNotEmpty
                                ? NetworkImage(profile.avatar)
                                : const AssetImage("assets/images/p.jpg")
                                      as ImageProvider,
                          ),

                          const SizedBox(width: 12),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,

                            children: [
                              const Text(
                                "Hello,",
                                style: TextStyle(
                                  fontSize: 14,
                                  color: Colors.grey,
                                ),
                              ),

                              Text(
                                profile?.name ?? "",

                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      SvgPicture.asset("assets/images/bell.svg", width: 24),
                    ],
                  ),

                  const SizedBox(height: 30),

                  Container(
                    height: 55,

                    padding: const EdgeInsets.symmetric(horizontal: 12),

                    decoration: BoxDecoration(
                      color: const Color.fromARGB(133, 245, 242, 242),

                      borderRadius: BorderRadius.circular(16),
                    ),

                    child: Row(
                      children: [
                        SvgPicture.asset("assets/images/s.svg", width: 24),

                        const SizedBox(width: 11),

                        Expanded(
                          child: TextField(
                            focusNode: searchFocus,
                            onTap: () {
                              ScaffoldMessenger.of(
                                context,
                              ).hideCurrentSnackBar();
                            },

                            onChanged: (value) {
                              context.read<TaskProvider>().searchTasks(value);
                            },

                            decoration: const InputDecoration(
                              hintText: "Search here...",
                              border: InputBorder.none,
                            ),
                          ),
                        ),

                        const Icon(Icons.tune),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "Your Pending Tasks",

                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),

                  const SizedBox(height: 30),

                  Consumer<TaskProvider>(
                    builder: (context, provider, child) {
                      if (provider.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (provider.filteredTasks.isEmpty) {
                        return const Text("No pending tasks");
                      }

                      return Row(
                        children: provider.filteredTasks.take(2).map((task) {
                          return Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12),

                              child: PendingTaskWidget(
                                title: task.categoryName,

                                description: task.description,

                                price: "₹${task.budget}",

                                onTap: () {
                                  navigateToScreen(
                                    Tasksetailed(
                                      id: task.id,

                                      title: task.categoryName,

                                      description: task.description,

                                      price: task.budget,

                                      location: task.location,

                                      deadline: task.deadline,

                                      statusImage: "assets/images/pending.png",

                                      status: task.status,

                                      requirements: "",

                                      estimate: "",

                                      profileImage: "",

                                      customerName: profile?.name ?? "",
                                    ),
                                  );
                                },
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    },
                  ),

                  const SizedBox(height: 30),

                  const Text(
                    "You have new Offers!",

                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),

                  const SizedBox(height: 14),

                  Consumer<EstimateProvider>(
                    builder: (context, provider, child) {
                      if (provider.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (provider.estimates.isEmpty) {
                        return Row(
                          children: [
                            emptyOfferCard(),

                            const SizedBox(width: 12),

                            emptyOfferCard(),
                          ],
                        );
                      }

                      return Row(
                        children: provider.estimates.take(2).map((offer) {
                          return offerCard(
                            image: "assets/images/p1.jpg",
                            job: offer.description,
                            name: offer.shopName,
                            price: "₹${offer.amount}",
                          );
                        }).toList(),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget emptyOfferCard() {
    return Expanded(
      child: Container(
        height: 186,

        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: const Color(0xFFFDECEA),

          borderRadius: BorderRadius.circular(20),
        ),
      ),
    );
  }

  Widget offerCard({
    required String image,

    required String job,

    required String name,

    required String price,
  }) {
    return Expanded(
      child: Container(
        height: 186,

        padding: const EdgeInsets.all(14),

        decoration: BoxDecoration(
          color: const Color(0xFFFDECEA),

          borderRadius: BorderRadius.circular(20),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              children: [
                CircleAvatar(radius: 16, backgroundImage: AssetImage(image)),

                const SizedBox(width: 8),

                Text(
                  job,

                  style: const TextStyle(
                    fontWeight: FontWeight.w600,

                    fontSize: 13,
                  ),
                ),
              ],
            ),

            const SizedBox(height: 6),

            Text(
              name,

              style: const TextStyle(fontSize: 14, color: Colors.black54),
            ),

            const SizedBox(height: 14),

            Text(
              price,

              style: const TextStyle(color: Color.fromARGB(255, 150, 38, 30)),
            ),

            const SizedBox(height: 14),

            Container(
              height: 42,

              decoration: BoxDecoration(
                gradient: AppColors.buttonGradient,

                borderRadius: BorderRadius.circular(10),
              ),

              child: const Center(
                child: Text(
                  "View Details",

                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
