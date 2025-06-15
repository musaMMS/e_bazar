import 'package:e_bazar/AdMob/Add_show.dart';
import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../widget/imagepath.dart';
import 'JustForYou_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<String> youtubeVideoIds = [
    'dQw4w9WgXcQ',
    'K18cpp_-gP8',
    'VYOjWnS4cMY',
    'hY7m5jjJ9mM',
  ];

  // Helper for size scaling
  double getResponsiveSize(BuildContext context, double size) {
    double width = MediaQuery.of(context).size.width;
    double scale = width / 375;
    double cappedScale = scale.clamp(0.85, 1.2);
    return size * cappedScale;
  }

  // Helper for font size scaling (smaller variation)
  double getResponsiveFontSize(BuildContext context, double fontSize) {
    double width = MediaQuery.of(context).size.width;
    double scale = width / 375;
    double cappedScale = scale.clamp(0.9, 1.15);
    return fontSize * cappedScale;
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape = MediaQuery.of(context).orientation == Orientation.landscape;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(getResponsiveSize(context, 16)),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
                BannerAdWidget(),

              // Top Bar
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: getResponsiveSize(context, 24),
                    backgroundImage: const AssetImage('assets/musa.jpeg'),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const StadiumBorder(),
                      padding: EdgeInsets.symmetric(
                        horizontal: getResponsiveSize(context, 16),
                        vertical: getResponsiveSize(context, 8),
                      ),
                    ),
                    onPressed: () {},
                    child: Text(
                      'My Activity',
                      style: TextStyle(fontSize: getResponsiveFontSize(context, 14)),
                    ),
                  ),
                  Row(
                    children: [
                      Icon(Icons.notifications_none, size: getResponsiveSize(context, 24)),
                      SizedBox(width: getResponsiveSize(context, 12)),
                      Icon(Icons.settings, size: getResponsiveSize(context, 24)),
                    ],
                  )
                ],
              ),
              SizedBox(height: getResponsiveSize(context, 20)),

              Text(
                'Hello, MusaDev!',
                style: TextStyle(
                  fontSize: getResponsiveFontSize(context, 24),
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: getResponsiveSize(context, 12)),

              // Announcement
              Container(
                padding: EdgeInsets.all(getResponsiveSize(context, 12)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(getResponsiveSize(context, 12)),
                  color: Colors.grey.shade100,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Announcement',
                              style: TextStyle(
                                  fontSize: getResponsiveFontSize(context, 16),
                                  fontWeight: FontWeight.bold)),
                          SizedBox(height: getResponsiveSize(context, 4)),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur...',
                            style: TextStyle(
                              color: Colors.grey[600],
                              fontSize: getResponsiveFontSize(context, 14),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(Icons.arrow_forward_ios,
                        color: Colors.blue, size: getResponsiveSize(context, 16)),
                  ],
                ),
              ),

              SizedBox(height: getResponsiveSize(context, 20)),

              Text('Recently viewed',
                  style: TextStyle(
                      fontSize: getResponsiveFontSize(context, 18),
                      fontWeight: FontWeight.bold)),
              SizedBox(height: getResponsiveSize(context, 10)),
              SizedBox(
                height: getResponsiveSize(context, 60),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppImages.recentlyViewedImages.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: CircleAvatar(
                      radius: getResponsiveSize(context, 30),
                      backgroundImage:
                      AssetImage(AppImages.recentlyViewedImages[index]),
                    ),
                  ),
                ),
              ),

              SizedBox(height: getResponsiveSize(context, 20)),

              Text('My Orders',
                  style: TextStyle(
                      fontSize: getResponsiveFontSize(context, 18),
                      fontWeight: FontWeight.bold)),
              SizedBox(height: getResponsiveSize(context, 10)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  orderButton('To Pay'),
                  orderButton('To Receive', isActive: true),
                  orderButton('To Review'),
                ],
              ),

              SizedBox(height: getResponsiveSize(context, 20)),

              Text('Stories',
                  style: TextStyle(
                      fontSize: getResponsiveFontSize(context, 18),
                      fontWeight: FontWeight.bold)),
              SizedBox(height: getResponsiveSize(context, 10)),
              SizedBox(
                height: getResponsiveSize(context, 180),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: youtubeVideoIds.length,
                  itemBuilder: (context, index) {
                    String videoId = youtubeVideoIds[index];
                    return GestureDetector(
                      onTap: () {
                        showDialog(
                          context: context,
                          builder: (_) => AlertDialog(
                            content: AspectRatio(
                              aspectRatio: 16 / 9,
                              child: StoryPlayer(videoId: videoId),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(right: 12),
                        width: getResponsiveSize(context, 120),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(getResponsiveSize(context, 12)),
                          image: DecorationImage(
                            image: NetworkImage('https://img.youtube.com/vi/$videoId/0.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Center(
                          child: Icon(Icons.play_circle_fill,
                              size: getResponsiveSize(context, 48), color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: getResponsiveSize(context, 20)),

              sectionHeader('New Item'),
              GridView.count(
                crossAxisCount: isLandscape ? 6 : 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: getResponsiveSize(context, 8),
                mainAxisSpacing: getResponsiveSize(context, 8),
                childAspectRatio: 0.6,
                children: [
                  categoryItem('Clothing', 'assets/person/musa512.png', 109),
                  categoryItem('Shoes', 'assets/person/m1.png', 530),
                  categoryItem('Bags', 'assets/person/m2.png', 87),
                  categoryItem('Lingerie', 'assets/person/m3.png', 218),
                ],
              ),

              SizedBox(height: getResponsiveSize(context, 20)),

              sectionHeader('Flash Sale', showTimer: true),
              GridView.count(
                crossAxisCount: isLandscape ? 6 : 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: getResponsiveSize(context, 8),
                crossAxisSpacing: getResponsiveSize(context, 8),
                childAspectRatio: 0.6,
                children: List.generate(AppImages.flashSaleList.length,
                        (index) => flashSaleItem(AppImages.flashSaleList[index])),
              ),

              SizedBox(height: getResponsiveSize(context, 20)),

              sectionHeader('Categories'),
              SizedBox(
                height: getResponsiveSize(context, 150),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppImages.categoryList.length,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      width: getResponsiveSize(context, 100),
                      child: categoryItem('Category $index',
                          AppImages.categoryList[index], 20 + index),
                    ),
                  ),
                ),
              ),

              SizedBox(height: getResponsiveSize(context, 20)),

              sectionHeader('Horizontal Sale'),
              SizedBox(
                height: getResponsiveSize(context, 200),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppImages.flashSaleList.length,
                  itemBuilder: (context, index) => Container(
                    margin: const EdgeInsets.all(8),
                    width: getResponsiveSize(context, 150),
                    child: flashSaleItem(AppImages.flashSaleList[index]),
                  ),
                ),
              ),

              SizedBox(height: getResponsiveSize(context, 5)),

              const JustNowSection(),
            ],
          ),
        ),
      ),
    );
  }

  Widget orderButton(String label, {bool isActive = false}) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: getResponsiveSize(context, 18),
        vertical: getResponsiveSize(context, 8),
      ),
      decoration: BoxDecoration(
        color: isActive ? Colors.blue.withOpacity(0.2) : Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(getResponsiveSize(context, 24)),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: TextStyle(
              color: isActive ? Colors.blue[800] : Colors.blue,
              fontSize: getResponsiveFontSize(context, 14),
              fontWeight: FontWeight.w500,
            ),
          ),
          if (isActive) ...[
            SizedBox(width: getResponsiveSize(context, 6)),
            const CircleAvatar(radius: 4, backgroundColor: Colors.green),
          ]
        ],
      ),
    );
  }

  Widget sectionHeader(String title, {bool showTimer = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title,
            style: TextStyle(
                fontSize: getResponsiveFontSize(context, 18),
                fontWeight: FontWeight.bold)),
        if (showTimer)
          Row(
            children: [
              Icon(Icons.timer, color: Colors.blue, size: getResponsiveSize(context, 16)),
              SizedBox(width: 4),
              Text("00:03:15", style: TextStyle(color: Colors.blue, fontSize: getResponsiveFontSize(context, 14))),
            ],
          ),
      ],
    );
  }

  Widget categoryItem(String title, String imagePath, int count) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(getResponsiveSize(context, 12)),
      ),
      padding: EdgeInsets.symmetric(
        horizontal: getResponsiveSize(context, 10),
        vertical: getResponsiveSize(context, 8),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(imagePath,
              width: getResponsiveSize(context, 60),
              height: getResponsiveSize(context, 60)),
          SizedBox(height: getResponsiveSize(context, 8)),
          Text(title,
              style: TextStyle(
                  fontSize: getResponsiveFontSize(context, 14),
                  fontWeight: FontWeight.w500)),
          Text('$count items',
              style: TextStyle(
                  color: Colors.grey.shade600,
                  fontSize: getResponsiveFontSize(context, 12))),
        ],
      ),
    );
  }

  Widget flashSaleItem(String imagePath) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(getResponsiveSize(context, 12)),
      ),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(getResponsiveSize(context, 12)),
            child: Image.asset(imagePath,
                fit: BoxFit.cover, width: double.infinity, height: double.infinity),
          ),
          Positioned(
            top: 8,
            left: 8,
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 6, vertical: 4),
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(8),
              ),
              child: Text('35% OFF',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: getResponsiveFontSize(context, 12))),
            ),
          ),
        ],
      ),
    );
  }
}

class StoryPlayer extends StatefulWidget {
  final String videoId;
  const StoryPlayer({super.key, required this.videoId});

  @override
  State<StoryPlayer> createState() => _StoryPlayerState();
}

class _StoryPlayerState extends State<StoryPlayer> {
  late YoutubePlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller = YoutubePlayerController(
      initialVideoId: widget.videoId,
      flags: const YoutubePlayerFlags(autoPlay: true),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(controller: _controller);
  }
}
