import 'package:flutter/material.dart';
import 'package:youtube_studio_clone/app_bar.dart';

class StudioComment extends StatefulWidget {
  const StudioComment({super.key});

  @override
  State<StudioComment> createState() => _StudioCommentState();
}

class _StudioCommentState extends State<StudioComment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).backgroundColor,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: const [
                  StudioAppBar(),
                  Divider(
                    thickness: 0.3,
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 10,
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          commentChips("", Icons.tune),
                          const SizedBox(
                            width: 6,
                          ),
                          commentChips("Published", Icons.keyboard_arrow_down),
                          const SizedBox(
                            width: 6,
                          ),
                          commentChips(
                              "I haven't responded", Icons.keyboard_arrow_down),
                          const SizedBox(
                            width: 6,
                          ),
                          commentChips("Search", Icons.keyboard_arrow_down),
                          const SizedBox(
                            width: 6,
                          ),
                          commentChips(
                              "Contains questions", Icons.keyboard_arrow_down),
                          const SizedBox(
                            width: 6,
                          ),
                          commentChips(
                              "Public subscribers", Icons.keyboard_arrow_down),
                          const SizedBox(
                            width: 6,
                          ),
                          commentChips(
                              "Subscribers count", Icons.keyboard_arrow_down),
                        ],
                      ),
                    ),
                  ),
                  const Expanded(
                    flex: 12,
                    child: Text("No comments"),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget commentChips(String title, IconData icon) => Chip(
        label: Row(
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
              ),
            ),
            Icon(
              icon,
              size: 18,
            ),
          ],
        ),
        backgroundColor: Colors.grey.shade200,
      );
}
