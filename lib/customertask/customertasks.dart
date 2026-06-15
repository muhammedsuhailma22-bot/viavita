import 'package:flutter/material.dart';
import 'package:pawfect_match/widgets/task_card.dart';
import 'package:provider/provider.dart';
import 'package:pawfect_match/providers/taskproviders.dart';

class Tasks extends StatefulWidget {
  const Tasks({super.key});

  @override
  State<Tasks> createState() => _TasksState();
}

class _TasksState extends State<Tasks> {
  int selectedTab = 0;

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<TaskProvider>().getPendingTasks();
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

        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: false,
          automaticallyImplyLeading: false,

          title: const Text(
            "Tasks",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
          ),
        ),

        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(18),

            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,

                  children: [
                    tabButton(title: "Pending Task", index: 0),

                    tabButton(title: "In Progress", index: 1),

                    tabButton(title: "Completed", index: 2),
                  ],
                ),

                const SizedBox(height: 18),

                Expanded(
                  child: Consumer<TaskProvider>(
                    builder: (context, provider, child) {
                      if (provider.isLoading) {
                        return const Center(child: CircularProgressIndicator());
                      }

                      if (provider.tasks.isEmpty) {
                        return const Center(child: Text("No Tasks Found"));
                      }

                      return ListView.builder(
                        itemCount: provider.tasks.length,

                        itemBuilder: (context, index) {
                          final task = provider.tasks[index];

                          return TaskCard(
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

                            customerName: "",
                          );
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget tabButton({required String title, required int index}) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),

      onTap: () {
        setState(() {
          selectedTab = index;
        });

        final provider = context.read<TaskProvider>();

        if (index == 0) {
          provider.getPendingTasks();
        } else if (index == 1) {
          provider.getInProgressTasks();
        } else {
          provider.getCompletedTasks();
        }
      },

      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),

        decoration: BoxDecoration(
          color: selectedTab == index
              ? const Color(0xFFFFE9E4)
              : Colors.transparent,

          borderRadius: BorderRadius.circular(8),
        ),

        child: Text(
          title,

          style: TextStyle(
            color: selectedTab == index
                ? const Color(0xFFEA5A1D)
                : const Color(0xFF697181),

            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
