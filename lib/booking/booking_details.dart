import 'package:flutter/material.dart';

class BookingDetails extends StatefulWidget {
  const BookingDetails({super.key});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
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
            "Bookings",

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

        body: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: screenWidth * 0.05,
            vertical: 20,
          ),

          child: ListView(
            children: [
              Text(
                "Plumbing",

                style: TextStyle(
                  fontSize: screenWidth * 0.07,

                  fontWeight: FontWeight.w600,
                ),
              ),

              const SizedBox(height: 24),

              const Text(
                "Description",

                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 10),

              const Text(
                "The Plumber fixed a leaking bathroom tap and installed a new sink. All work was completed efficiently, ensuring no leaks and proper water flow. The task was finished on time with excellent workmanship.",

                style: TextStyle(color: Colors.grey, height: 1.5),
              ),

              const SizedBox(height: 24),

              const Text(
                "Requirements",

                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),

              const SizedBox(height: 10),

              const Text(
                "The Plumber fixed a leaking bathroom tap and installed a new sink. All work was completed efficiently, ensuring no leaks and proper water flow. The task was finished on time with excellent workmanship.",

                style: TextStyle(color: Colors.grey, height: 1.5),
              ),

              const SizedBox(height: 28),

              workerCard(screenWidth),

              const SizedBox(height: 20),

              workerCard(screenWidth),
            ],
          ),
        ),
      ),
    );
  }

  Widget workerCard(double screenWidth) {
    return Container(
      padding: EdgeInsets.all(screenWidth * 0.04),

      decoration: BoxDecoration(
        color: const Color(0xFFFFF7F5),

        borderRadius: BorderRadius.circular(16),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,

            children: [
              Expanded(
                child: Text(
                  "Varnam Paints",

                  overflow: TextOverflow.ellipsis,

                  style: TextStyle(
                    fontSize: screenWidth * 0.045,

                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Text(
                "₹12,000/-",

                style: TextStyle(
                  fontSize: screenWidth * 0.05,

                  fontWeight: FontWeight.w700,

                  color: const Color(0xFF697181),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          const Row(
            children: [
              Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),

              SizedBox(width: 6),

              Expanded(
                child: Text(
                  "Ground Floor,Uthradam Towers, near AJ Hospital, Kazhakkoottam, Kerala 695582.",

                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                    height: 1.4,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          const Text(
            "Living room painting and installation of ceiling fans and lights needed. All electrical materials will be provided. Job will start once assigned to an electrician.",

            style: TextStyle(color: Colors.grey, height: 1.5),
          ),

          const SizedBox(height: 22),

          SizedBox(
            width: double.infinity,
            height: 50,

            child: InkWell(
              borderRadius: BorderRadius.circular(12),

              onTap: () {
                showDialog(
                  context: context,

                  builder: (context) {
                    return AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(18),
                      ),

                      title: const Text("Confirm Selection"),

                      content: const Text("Do you want to select this worker?"),

                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },

                          child: const Text("Cancel"),
                        ),

                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFEA5A1D),
                          ),

                          onPressed: () {
                            Navigator.pop(context);

                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                content: Text("Worker Selected Successfully"),

                                behavior: SnackBarBehavior.floating,
                              ),
                            );
                          },

                          child: const Text("Select"),
                        ),
                      ],
                    );
                  },
                );
              },

              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),

                  border: Border.all(color: const Color(0xFFEA5A1D)),
                ),

                child: Center(
                  child: Text(
                    "Select",

                    style: TextStyle(
                      color: const Color(0xFFEA5A1D),

                      fontWeight: FontWeight.w600,

                      fontSize: screenWidth * 0.04,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
