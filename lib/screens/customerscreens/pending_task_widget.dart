import 'package:flutter/material.dart';
import 'package:pawfect_match/utils/app_colors.dart';

class PendingTaskWidget extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final VoidCallback onTap;

  const PendingTaskWidget({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 198,
      padding: const EdgeInsets.all(14),

      decoration: BoxDecoration(
        color: const Color(0xFFFDECEA),
        borderRadius: BorderRadius.circular(20),
      ),

      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [
          Text(
            title,

            style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
          ),

          const SizedBox(height: 6),

          Text(
            description,

            maxLines: 3,
            overflow: TextOverflow.ellipsis,

            style: const TextStyle(
              fontSize: 13,
              color: Color.fromARGB(255, 103, 103, 103),
            ),
          ),

          const Spacer(),

          Text(
            price,

            style: const TextStyle(
              color: Color.fromARGB(255, 150, 38, 30),
              fontWeight: FontWeight.w600,
            ),
          ),

          const SizedBox(height: 14),

          GestureDetector(
            onTap: onTap,

            child: Container(
              height: 42,

              decoration: BoxDecoration(
                gradient: AppColors.buttonGradient,
                borderRadius: BorderRadius.circular(12),
              ),

              child: const Center(
                child: Text(
                  "View Details",

                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
