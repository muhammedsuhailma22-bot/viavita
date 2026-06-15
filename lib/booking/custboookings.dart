import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:pawfect_match/providers/bookingsprovider.dart';
import 'package:provider/provider.dart';

import 'package:pawfect_match/models/bookingsmodel.dart';

class Bookings extends StatefulWidget {
  const Bookings({super.key});

  @override
  State<Bookings> createState() => _BookingsState();
}

class _BookingsState extends State<Bookings> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<EstimateProvider>().fetchEstimates(116);
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },

      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,

          title: const Text(
            "Booking",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w500,
              color: Colors.black,
            ),
          ),
        ),

        body: Padding(
          padding: const EdgeInsets.all(20),

          child: ListView(
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 12),

                height: 60,

                decoration: BoxDecoration(
                  color: const Color.fromARGB(133, 245, 242, 242),
                  borderRadius: BorderRadius.circular(16),
                ),

                child: Row(
                  children: [
                    SvgPicture.asset("assets/images/s.svg", width: 24),

                    const SizedBox(width: 11),

                    const Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Search here...",
                          border: InputBorder.none,
                        ),
                      ),
                    ),

                    const Icon(Icons.tune),
                  ],
                ),
              ),

              const SizedBox(height: 24),

              Consumer<EstimateProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  if (provider.estimates.isEmpty) {
                    return const Center(child: Text("No Bookings Found"));
                  }

                  return Column(
                    children: provider.estimates.map((estimate) {
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 16),

                        child: bookingItem(context, estimate),
                      );
                    }).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget bookingItem(BuildContext context, EstimateModel estimate) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      constraints: const BoxConstraints(minHeight: 260),

      width: double.infinity,

      padding: const EdgeInsets.all(12),

      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 248, 246, 1),

        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        children: [
          Container(
            height: 90,

            width: screenWidth,

            padding: const EdgeInsets.all(10),

            decoration: BoxDecoration(
              color: const Color(0xFFFFE3DB),

              borderRadius: BorderRadius.circular(10),
            ),

            child: Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),

                  child: Image.asset(
                    "assets/images/p.jpg",

                    scale: 2,

                    fit: BoxFit.cover,
                  ),
                ),

                const SizedBox(width: 10),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [
                    Text(
                      estimate.shopName,

                      style: const TextStyle(
                        fontWeight: FontWeight.w600,

                        fontSize: 16,
                      ),
                    ),

                    const SizedBox(height: 4),

                    Text(
                      estimate.email,

                      style: const TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),

          const SizedBox(height: 18),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Expanded(
                child: Text(
                  estimate.description,

                  maxLines: 1,

                  overflow: TextOverflow.ellipsis,

                  style: const TextStyle(
                    fontWeight: FontWeight.w600,

                    fontSize: 18,
                  ),
                ),
              ),

              Text(
                "₹${estimate.amount}/-",

                style: const TextStyle(
                  fontWeight: FontWeight.w700,

                  fontSize: 20,

                  color: Color.fromRGBO(105, 113, 129, 1),
                ),
              ),
            ],
          ),

          const SizedBox(height: 16),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Text("Phone"),

                  const SizedBox(height: 18),

                  Text(
                    estimate.phone,
                    style: const TextStyle(
                      color: Color.fromRGBO(105, 113, 129, 1),
                    ),
                  ),
                ],
              ),

              Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const Text("Status"),

                  const SizedBox(height: 18),

                  Text(
                    estimate.status,

                    style: const TextStyle(
                      color: Color.fromRGBO(105, 113, 129, 1),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
