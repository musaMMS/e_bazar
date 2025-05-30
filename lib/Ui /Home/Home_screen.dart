import 'package:e_bazar/AdMob/Add_show.dart';
import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';
import '../../widget/imagepath.dart';
import '../selectedproduct/Product_details.dart';

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

  double getResponsiveSize(BuildContext context, double size) {
    double width = MediaQuery.of(context).size.width;
    return size * (width / 375); // 375 is a common design width
  }

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

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
              SizedBox(height: getResponsiveSize(context, 20)),

              Text(
                'Hello, MusaDev!',
                style: TextStyle(
                  fontSize: getResponsiveSize(context, 24),
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
                          const Text('Announcement', style: TextStyle(fontWeight: FontWeight.bold)),
                          SizedBox(height: getResponsiveSize(context, 4)),
                          Text(
                            'Lorem ipsum dolor sit amet, consectetur...',
                            style: TextStyle(color: Colors.grey[600]),
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, color: Colors.blue),
                  ],
                ),
              ),

              SizedBox(height: getResponsiveSize(context, 20)),

              // Recently Viewed
              Text('Recently viewed', style: TextStyle(fontSize: getResponsiveSize(context, 18), fontWeight: FontWeight.bold)),
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
                      backgroundImage: AssetImage(AppImages.recentlyViewedImages[index]),
                    ),
                  ),
                ),
              ),

              SizedBox(height: getResponsiveSize(context, 20)),

              // My Orders
              Text('My Orders', style: TextStyle(fontSize: getResponsiveSize(context, 18), fontWeight: FontWeight.bold)),
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

              // Stories (YouTube)
              Text('Stories', style: TextStyle(fontSize: getResponsiveSize(context, 18), fontWeight: FontWeight.bold)),
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
                        child: const Align(
                          alignment: Alignment.center,
                          child: Icon(Icons.play_circle_fill, size: 48, color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: getResponsiveSize(context, 20)),

              // New Item Section
              sectionHeader('New Item'),
              GridView.count(
                crossAxisCount: 4,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisSpacing: getResponsiveSize(context, 8),
                mainAxisSpacing: getResponsiveSize(context, 8),
                childAspectRatio: 0.7,
                children: [
                  categoryItem('Clothing', 'assets/person/musa512.png', 109),
                  categoryItem('Shoes', 'assets/person/m1.png', 530),
                  categoryItem('Bags', 'assets/person/m2.png', 87),
                  categoryItem('Lingerie', 'assets/person/m3.png', 218),
                ],
              ),

              SizedBox(height: getResponsiveSize(context, 20)),

              // Flash Sale Section
              sectionHeader('Flash Sale', showTimer: true),
              GridView.count(
                crossAxisCount: 3,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                mainAxisSpacing: getResponsiveSize(context, 8),
                crossAxisSpacing: getResponsiveSize(context, 8),
                childAspectRatio: 0.65,
                children: List.generate(AppImages.flashSaleList.length, (index)=> flashSaleItem(AppImages.flashSaleList[index])),
              ),

              SizedBox(height: getResponsiveSize(context, 20)),

              // Categories from AppImages
              sectionHeader('Categories'),
              SizedBox(
                height: getResponsiveSize(context, 130),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppImages.categoryList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        width: getResponsiveSize(context, 100),
                        child: categoryItem(
                          'Category $index',
                          AppImages.categoryList[index],
                          20 + index,
                        ),
                      ),
                    );
                  },
                ),
              ),

              SizedBox(height: getResponsiveSize(context, 20)),

              // Horizontal Flash Sale Items
              sectionHeader('Horizontal Sale'),
              SizedBox(
                height: getResponsiveSize(context, 200),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: AppImages.flashSaleList.length,
                  itemBuilder: (context, index) {
                    return Container(
                      margin: const EdgeInsets.all(8),
                      width: getResponsiveSize(context, 150),
                      child: flashSaleItem(AppImages.flashSaleList[index]),
                    );
                  },
                ),
              ),
              SizedBox(height: getResponsiveSize(context, 5)),

               JustForYouSection(),
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
        color: Colors.blue.withOpacity(0.1),
        borderRadius: BorderRadius.circular(getResponsiveSize(context, 24)),
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
        Text(title, style: TextStyle(fontSize: getResponsiveSize(context, 18), fontWeight: FontWeight.bold)),
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
            borderRadius: BorderRadius.circular(getResponsiveSize(context, 12)),
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
          borderRadius: BorderRadius.circular(getResponsiveSize(context, 12)),
          child: Image.asset(imagePath, fit: BoxFit.cover),
        ),
        Positioned(
          top: getResponsiveSize(context, 8),
          left: getResponsiveSize(context, 8),
          child: Container(
            padding: EdgeInsets.symmetric(
              horizontal: getResponsiveSize(context, 6),
              vertical: getResponsiveSize(context, 2),
            ),
            decoration: BoxDecoration(
              color: Colors.red,
              borderRadius: BorderRadius.circular(getResponsiveSize(context, 6)),
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
      flags: const YoutubePlayerFlags(
        autoPlay: true,
        mute: false,
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


class JustForYouSection extends StatefulWidget {
  const JustForYouSection({super.key});

  @override
  State<JustForYouSection> createState() => _JustForYouSectionState();
}

class _JustForYouSectionState extends State<JustForYouSection> {
  List<dynamic> products = [];

  @override
  void initState() {
    super.initState();
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    final response = await Supabase.instance.client
        .from('products')
        .select()
        .order('id', ascending: false);
    setState(() {
      products = response;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("🛍️ Products")),
      body: products.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
        padding: EdgeInsets.all(10),
        itemCount: products.length,
        itemBuilder: (context, index) {
          final product = products[index];
          return Card(
            margin: EdgeInsets.symmetric(vertical: 8),
            elevation: 4,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              leading: product['image_url'] != null
                  ? Image.network(product['image_url'], width: 60)
                  : Icon(Icons.image_not_supported),
              title: Text(product['name'] ?? 'No Name'),
              subtitle: Text("৳ ${product['price'] ?? 'N/A'}"),
            ),
          );
        },
      ),
    );
  }
}

