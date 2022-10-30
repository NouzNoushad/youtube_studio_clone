import 'package:flutter/material.dart';
import 'package:youtube_studio_clone/app_bar.dart';

class StudioMonetize extends StatefulWidget {
  const StudioMonetize({super.key});

  @override
  State<StudioMonetize> createState() => _StudioMonetizeState();
}

class _StudioMonetizeState extends State<StudioMonetize> {
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
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 4,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text(
                            'Hello, NOBOMAN',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 16,
                            ),
                          ),
                          Text(
                            'Grow with YouTube',
                            style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 30,
                            ),
                          ),
                          Text(
                            'Join the YouTube Partner program to earn money, get creator support and more.',
                            style: TextStyle(
                              fontSize: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Text(
                            "Program Benefits",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          programBenefits(Icons.work_outline, "Monetization",
                              "Earn money from ads and more"),
                          programBenefits(
                              Icons.message_outlined,
                              "Creator Support",
                              "Get support via chat or email"),
                          programBenefits(Icons.copyright, "Tools",
                              "Access to the Copyright Match Tool"),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "How to join",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          requirementIndicator(
                              0.5, "480 subscribers", "1000 required"),
                          requirementIndicator(
                              0.1, "380 public watch hours", "4000 required"),
                          Row(
                            children: const [
                              Icon(
                                Icons.check_circle_outline,
                                color: Colors.green,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "No Community Guideliness strikes",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: const [
                              Icon(
                                Icons.lock_outline,
                              ),
                              SizedBox(
                                width: 8,
                              ),
                              Text(
                                "2 - Step Verification",
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget requirementIndicator(double value, String current, String required) =>
      Column(
        children: [
          LinearProgressIndicator(
            value: value,
            backgroundColor: Colors.white,
            color: Colors.indigo,
            minHeight: 5,
          ),
          const SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                current,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                ),
              ),
              Text(
                required,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ],
          ),
        ],
      );

  Widget programBenefits(IconData icon, String title, String subtitle) => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon),
          const SizedBox(
            width: 10,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Text(
                subtitle,
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ],
      );
}
