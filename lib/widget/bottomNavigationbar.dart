import 'package:flutter/material.dart';
import 'package:e_bazar/Ui /Cart/Cart_Screen.dart';
import 'package:e_bazar/Ui%20/Home/Home_screen.dart';
import 'package:e_bazar/Ui%20/Settings/Settings_screen.dart';
import 'package:e_bazar/Ui%20/WishList/Wishlist_Screen.dart';

class NavigationScreen extends StatefulWidget {
  const NavigationScreen({super.key});

  @override
  State<NavigationScreen> createState() => _NavigationScreenState();
}

class _NavigationScreenState extends State<NavigationScreen> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  static final List<Widget> _pages = <Widget>[
    const HomeScreen(),
    WishlistScreen(),
    const Center(child: Text('Mail Page', style: TextStyle(fontSize: 24))),
    CartScreen(),
    SettingsScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        // No need to set colors manually — Theme handles this
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: 'Favorite'),
          BottomNavigationBarItem(icon: Icon(Icons.list_alt_rounded), label: 'List'),
          BottomNavigationBarItem(icon: Icon(Icons.card_travel_rounded), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Person'),
        ],
      ),
    );
  }
}
