import 'package:flutter/material.dart';
import 'package:pawfect_match/models/task.dart';
import 'package:pawfect_match/widgets/shimmer_helpers.dart';

class BookingDetails extends StatefulWidget {
  final TaskModel task;

  const BookingDetails({super.key, required this.task});

  @override
  State<BookingDetails> createState() => _BookingDetailsState();
}

class _BookingDetailsState extends State<BookingDetails> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 1200), () {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    });
  }

  Widget _buildShimmerBody(double screenWidth) {
    return ListView(
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const ShimmerTextLine(width: 150, height: 28),
        const SizedBox(height: 24),
        const ShimmerTextLine(width: 100, height: 16),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ShimmerTextLine(width: double.infinity),
            ShimmerTextLine(width: double.infinity),
            ShimmerTextLine(width: double.infinity),
            ShimmerTextLine(width: 180),
          ],
        ),
        const SizedBox(height: 24),
        const ShimmerTextLine(width: 110, height: 16),
        const SizedBox(height: 10),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            ShimmerTextLine(width: double.infinity),
            ShimmerTextLine(width: double.infinity),
            ShimmerTextLine(width: 220),
          ],
        ),
        const SizedBox(height: 28),
        _buildShimmerWorkerCard(screenWidth),
      ],
    );
  }

  Widget _buildShimmerWorkerCard(double screenWidth) {
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
            children: const [
              ShimmerTextLine(width: 130, height: 18),
              ShimmerTextLine(width: 80, height: 20),
            ],
          ),
          const SizedBox(height: 18),
          Row(
            children: const [
              ShimmerCircle(radius: 8),
              SizedBox(width: 6),
              ShimmerTextLine(width: 220, height: 12),
            ],
          ),
          const SizedBox(height: 18),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              ShimmerTextLine(width: double.infinity),
              ShimmerTextLine(width: 150),
            ],
          ),
          const SizedBox(height: 22),
          const ShimmerBlock(
            width: double.infinity,
            height: 50,
            borderRadius: 10,
          ),
        ],
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
          child: _isLoading
              ? _buildShimmerBody(screenWidth)
              : ListView(
                  physics:
                      const ClampingScrollPhysics(), // Disables stretch distortion on overscroll
                  children: [
                    Text(
                      widget.task.categoryName,
                      style: TextStyle(
                        fontSize: screenWidth * 0.07,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 24),

                    Text(
                      widget.task.description,

                      style: const TextStyle(color: Colors.grey, height: 1.5),
                    ),

                    const SizedBox(height: 10),

                    const SizedBox(height: 24),

                    const Text(
                      "Requirements",

                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                      ),
                    ),

                    const SizedBox(height: 10),

                    Text(
                      widget.task.description,

                      style: const TextStyle(color: Colors.grey, height: 1.5),
                    ),

                    const SizedBox(height: 28),

                    workerCard(screenWidth, widget.task),
                  ],
                ),
        ),
      ),
    );
  }

  Widget workerCard(double screenWidth, TaskModel task) {
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
                  task.categoryName,

                  overflow: TextOverflow.ellipsis,

                  style: TextStyle(
                    fontSize: screenWidth * 0.045,

                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              Text(
                "₹${task.budget}",

                style: TextStyle(
                  fontSize: screenWidth * 0.05,

                  fontWeight: FontWeight.w700,

                  color: const Color(0xFF697181),
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Row(
            children: [
              Icon(Icons.location_on_outlined, size: 16, color: Colors.grey),

              SizedBox(width: 6),

              Expanded(
                child: Text(
                  task.location,

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

          Text(
            task.description,

            style: const TextStyle(color: Colors.grey, height: 1.5),
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
