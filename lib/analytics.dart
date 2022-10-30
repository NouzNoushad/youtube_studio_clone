import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:youtube_studio_clone/app_bar.dart';
import 'package:youtube_studio_clone/models/studio.dart';

class StudioAnalytics extends StatefulWidget {
  const StudioAnalytics({super.key});

  @override
  State<StudioAnalytics> createState() => _StudioAnalyticsState();
}

class _StudioAnalyticsState extends State<StudioAnalytics>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController =
      TabController(length: 3, vsync: this);

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
                        Text("Overview"),
                        Text("Content"),
                        Text("Audience"),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 15,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        overView(),
                        const Center(
                          child: Text("Content"),
                        ),
                        const Center(
                          child: Text("Audience"),
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

  Widget overView() => SingleChildScrollView(
        child: ConstrainedBox(
          constraints: const BoxConstraints(minHeight: 800),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Your Channel got 15,000 views in last 28 days",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text("Views"),
                        const Text(
                          "1.6k",
                          style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const Text(
                          "31% more than previous 28 days",
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.green,
                          ),
                        ),
                        Container(
                          height: 120,
                          margin: const EdgeInsets.symmetric(vertical: 10),
                          child: viewsLineChart(),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Top content",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          "Last 28 days . Views",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 200,
                          child: ListView.builder(
                            itemCount: videos.length,
                            itemBuilder: (context, index) {
                              final video = videos[index];
                              return Container(
                                height: 40,
                                // color: Colors.yellow,
                                margin: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 80,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                "assets/${video.image}",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        const Text("Flutter UI D..."),
                                      ],
                                    ),
                                    Text(video.views.toString()),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Card(
                  elevation: 2,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 18, vertical: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "Real Time",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          "76",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const Text(
                          "Views . 48 hours",
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          height: 200,
                          child: ListView.builder(
                            itemCount: videos.length,
                            itemBuilder: (context, index) {
                              final video = videos[index];
                              return Container(
                                height: 40,
                                // color: Colors.yellow,
                                margin: const EdgeInsets.only(bottom: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 80,
                                          decoration: BoxDecoration(
                                            image: DecorationImage(
                                              image: AssetImage(
                                                "assets/${video.image}",
                                              ),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          width: 6,
                                        ),
                                        const Text("Flutter UI D..."),
                                      ],
                                    ),
                                    Text(video.realTime.toString()),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget viewsLineChart() => LineChart(
        LineChartData(
          minX: 0,
          minY: 0,
          maxX: 10,
          maxY: 15,
          lineBarsData: [
            LineChartBarData(
              spots: [
                const FlSpot(0, 2),
                const FlSpot(1, 4),
                const FlSpot(2, 3),
                const FlSpot(3, 6),
                const FlSpot(4, 8),
                const FlSpot(5, 5),
                const FlSpot(6, 4),
                const FlSpot(7, 6),
                const FlSpot(8, 3),
                const FlSpot(9, 7),
                const FlSpot(10, 8),
              ],
              dotData: FlDotData(show: false),
            ),
          ],
          gridData: FlGridData(
              show: true, drawHorizontalLine: true, drawVerticalLine: false),
          titlesData: FlTitlesData(
            topTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            rightTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: false,
              ),
            ),
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
              ),
            ),
          ),
          borderData: FlBorderData(show: false),
        ),
      );
}
