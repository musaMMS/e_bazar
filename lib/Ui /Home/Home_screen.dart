import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  final List<String> youtubeVideoIds = [
    'dQw4w9WgXcQ',
    'K18cpp_-gP8',
    'VYOjWnS4cMY',
    'hY7m5jjJ9mM',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage('assets/user.jpg'),
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        shape: const StadiumBorder(),
                      ),
                      onPressed: () {},
                      child: const Text('My Activity'),
                    ),
                    Row(
                      children: const [
                        Icon(Icons.notifications_none),
                        SizedBox(width: 12),
                        Icon(Icons.settings),
                      ],
                    )
                  ],
                ),
                const SizedBox(height: 20),
                const Text(
                  'Hello, Romina!',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: Colors.grey.shade100,
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Announcement', style: TextStyle(fontWeight: FontWeight.bold)),
                          const SizedBox(height: 4),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur...',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                      const Icon(Icons.arrow_forward_ios, color: Colors.blue),
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                const Text('Recently viewed', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 60,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 5,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: CircleAvatar(
                        radius: 30,
                        backgroundImage: AssetImage('assets/user${index + 1}.jpg'),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                const Text('My Orders', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    orderButton('To Pay'),
                    orderButton('To Receive', isActive: true),
                    orderButton('To Review'),
                  ],
                ),
                const SizedBox(height: 20),
                const Text('Stories', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 10),
                SizedBox(
                  height: 180,
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
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                              image: NetworkImage('https://img.youtube.com/vi/$videoId/0.jpg'),
                              fit: BoxFit.cover,
                            ),
                          ),
                          child: const Align(
                            alignment: Alignment.center,
                            child: Icon(Icons.play_circle_fill, size: 48, color: Colors.white),
                          ),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(height: 20),
                sectionHeader('Categories'),
                GridView.count(
                  crossAxisCount: 4,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  crossAxisSpacing: 8,
                  mainAxisSpacing: 8,
                  childAspectRatio: 0.7,
                  children: [
                    categoryItem('Clothing', 'assets/cat1.jpg', 109),
                    categoryItem('Shoes', 'assets/cat2.jpg', 530),
                    categoryItem('Bags', 'assets/cat3.jpg', 87),
                    categoryItem('Lingerie', 'assets/cat4.jpg', 218),
                  ],
                ),
                const SizedBox(height: 20),
                sectionHeader('Flash Sale', showTimer: true),
                GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  childAspectRatio: 0.65,
                  children: List.generate(6, (index) => flashSaleItem('assets/sale${index + 1}.jpg')),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_outlined), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.mail_outline), label: ''),
          BottomNavigationBarItem(icon: Icon(Icons.person_outline), label: ''),
        ],
      ),
    );
  }

  Widget orderButton(String label, {bool isActive = false}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Row(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.blue,
              fontWeight: FontWeight.w500,
            ),
          ),
          if (isActive) ...[
            const SizedBox(width: 6),
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
        Text(title, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        if (showTimer)
          Row(
            children: const [
              Icon(Icons.timer, color: Colors.blue, size: 16),
              SizedBox(width: 4),
              Text("00", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(":36", style: TextStyle(fontWeight: FontWeight.bold)),
              Text(":58", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          )
        else
          const Icon(Icons.arrow_forward, color: Colors.blue),
      ],
    );
  }

  Widget categoryItem(String title, String imagePath, int count) {
    return Column(
      children: [
        Expanded(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(imagePath, fit: BoxFit.cover),
          ),
        ),
        const SizedBox(height: 4),
        Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        Text('$count', style: const TextStyle(color: Colors.grey)),
      ],
    );
  }

  Widget flashSaleItem(String imagePath) {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        Positioned(
          top: 8,
          left: 8,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(6),
            ),
            child: const Text('-20%', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
          ),
        ),
      ],
    );
  }
}

class StoryPlayer extends StatefulWidget {
  final String videoId;

  const StoryPlayer({Key? key, required this.videoId}) : super(key: key);

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
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
        loop: false,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: _controller,
      showVideoProgressIndicator: true,
    );
  }
}
