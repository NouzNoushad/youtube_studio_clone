import 'package:flutter/material.dart';
import 'package:youtube_studio_clone/app_bar.dart';
import 'package:youtube_studio_clone/models/studio.dart';

class StudioDashboard extends StatefulWidget {
  const StudioDashboard({super.key});

  @override
  State<StudioDashboard> createState() => _StudioDashboardState();
}

class _StudioDashboardState extends State<StudioDashboard> {
  List<YoutubeStudio> videos = StudioList;
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
              child: dashboardHeader(),
            ),
          ],
        ),
      ),
    );
  }

  Widget dashboardHeader() => Padding(
        padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 10),
        child: Column(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Colors.yellow,
                        backgroundImage: AssetImage(
                          "assets/noboman.jpg",
                        ),
                        radius: 35,
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Noboman".toUpperCase(),
                            style: const TextStyle(
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          const Text(
                            "480",
                            style: TextStyle(
                                fontWeight: FontWeight.w600, fontSize: 22),
                          ),
                          const Text(
                            "Total subscribers",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 13,
                                color: Colors.grey),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const [
                          Text(
                            "Channel analytics",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Last 28 days",
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 6,
                      ),
                      Row(
                        children: [
                          analyticsCards("Views", "1.6k"),
                          analyticsCards("Watch time (hours)", "46.2"),
                        ],
                      ),
                    ],
                  ),
                  const Text(
                    "Latest published content",
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: ListView.builder(
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  final video = videos[index];
                  return Card(
                    elevation: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 70,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(5),
                                  image: DecorationImage(
                                      image:
                                          AssetImage("assets/${video.image}"),
                                      fit: BoxFit.cover),
                                ),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const Text(
                                    "Flutter UI Practicing | Flutter S...",
                                  ),
                                  Text(
                                    "First ${video.days}",
                                    style: const TextStyle(
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Divider(
                            thickness: 0.4,
                            height: 30,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Row(
                                    children: [
                                      const Icon(Icons.bar_chart, size: 18),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(video.views.toString()),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.thumb_up_outlined,
                                          size: 18),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(video.likes.toString()),
                                    ],
                                  ),
                                  const SizedBox(
                                    width: 15,
                                  ),
                                  Row(
                                    children: [
                                      const Icon(Icons.message, size: 18),
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      Text(video.comments.toString()),
                                    ],
                                  ),
                                ],
                              ),
                              const Icon(Icons.keyboard_arrow_down, size: 18),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      );

  Widget analyticsCards(String title, String value) => Container(
        width: MediaQuery.of(context).size.width / 2 - 18,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey,
                  ),
                ),
                Text(
                  value,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
        ),
      );
}
