import 'package:flutter/material.dart';
import 'package:youtube_studio_clone/app_bar.dart';
import 'package:youtube_studio_clone/models/studio.dart';

class StudioContent extends StatefulWidget {
  const StudioContent({super.key});

  @override
  State<StudioContent> createState() => _StudioContentState();
}

class _StudioContentState extends State<StudioContent>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 4, vsync: this);
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
              child: Column(
                children: [
                  Expanded(
                    flex: 1,
                    child: TabBar(
                      controller: _tabController,
                      labelColor: Colors.indigo,
                      unselectedLabelColor: Colors.grey,
                      indicatorColor: Colors.indigo,
                      overlayColor:
                          MaterialStateProperty.all(Colors.transparent),
                      tabs: const [
                        Text("Videos"),
                        Text("Shorts"),
                        Text("Live"),
                        Text("Playlists"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 12,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        videoContent(),
                        const Center(
                          child: Text("Shorts"),
                        ),
                        const Center(
                          child: Text("Live"),
                        ),
                        const Center(
                          child: Text("Playlists"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget videoContent() => Column(
        children: [
          Expanded(
            flex: 2,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  contentChips("", Icons.tune),
                  const SizedBox(
                    width: 6,
                  ),
                  contentChips("Sort by", Icons.keyboard_arrow_down),
                  const SizedBox(
                    width: 6,
                  ),
                  contentChips("Visibility", Icons.keyboard_arrow_down),
                  const SizedBox(
                    width: 6,
                  ),
                  contentChips("Views", Icons.keyboard_arrow_down),
                  const SizedBox(
                    width: 6,
                  ),
                  contentChips("Restrictions", Icons.keyboard_arrow_down),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 18),
              child: ListView.builder(
                itemCount: videos.length,
                itemBuilder: (context, index) {
                  final video = videos[index];
                  return Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: 90,
                        width: 140,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/${video.image}"),
                              fit: BoxFit.cover),
                        ),
                        margin: const EdgeInsets.only(bottom: 12),
                      ),
                      const SizedBox(
                        width: 8,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              "Flutter UI Practicing | Flutter SQFlite datab..",
                              style: TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Text(
                              "${video.views} views . ${video.days}",
                              style: TextStyle(
                                fontSize: 13,
                                color: Colors.grey.shade700,
                              ),
                            ),
                            const SizedBox(
                              height: 6,
                            ),
                            Row(
                              children: [
                                const Icon(
                                  Icons.public,
                                  size: 18,
                                  color: Colors.grey,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.thumb_up_outlined,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(video.likes.toString(),
                                        style: const TextStyle(
                                            color: Colors.grey)),
                                  ],
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.message,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(video.comments.toString(),
                                        style: const TextStyle(
                                            color: Colors.grey)),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      const Icon(Icons.more_vert, size: 18),
                    ],
                  );
                },
              ),
            ),
          ),
        ],
      );

  Widget contentChips(String title, IconData icon) => Chip(
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
