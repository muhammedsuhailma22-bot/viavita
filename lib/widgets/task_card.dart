import 'package:flutter/material.dart';
import 'package:pawfect_match/customertask/tasksetailed.dart';

class TaskCard extends StatelessWidget {
  final String title;
  final String description;
  final String price;
  final String location;
  final String deadline;
  final String statusImage;
  final String status;
  final String requirements;
  final String estimate;
  final String profileImage;
  final String customerName;

  const TaskCard({
    super.key,
    required this.title,
    required this.description,
    required this.price,
    required this.location,
    required this.deadline,
    required this.statusImage,
    required this.status,
    required this.requirements,
    required this.estimate,
    required this.profileImage,
    required this.customerName,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(10),

      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Tasksetailed(
              title: title,
              description: description,
              price: price,
              location: location,
              deadline: deadline,
              statusImage: statusImage,
              status: status,
              requirements: requirements,
              estimate: estimate,
              profileImage: profileImage,
              customerName: customerName,
            ),
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 14),
        height: 129,
        width: 390,
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),

        decoration: BoxDecoration(
          color: const Color.fromRGBO(255, 248, 246, 1),
          borderRadius: BorderRadius.circular(10),
        ),

        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,

              children: [
                Text(
                  title,

                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: Color.fromRGBO(89, 96, 117, 1),
                  ),
                ),

                Text(
                  price,

                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(105, 113, 129, 1),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 14),
            Divider(color: const Color.fromARGB(255, 241, 237, 237)),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,

              children: [
                Expanded(
                  child: Text(
                    description,

                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,

                    style: const TextStyle(
                      fontSize: 14,
                      height: 1.4,
                      color: Color.fromRGBO(105, 113, 129, 1),
                    ),
                  ),
                ),

                const SizedBox(width: 10),

                Padding(
                  padding: const EdgeInsets.only(top: 14.0),
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    size: 16,
                    color: Color.fromRGBO(105, 113, 129, 1),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
