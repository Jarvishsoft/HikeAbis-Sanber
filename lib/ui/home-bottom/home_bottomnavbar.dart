import 'package:flutter/material.dart';
import 'package:hike_abis/ui/home-bottom/akun/akun_page.dart';
import 'package:hike_abis/ui/home-bottom/home_page.dart';
import 'package:hike_abis/ui/home-bottom/order_page.dart';
import 'package:hike_abis/ui/home-bottom/rekomendasi_page.dart';

class HomeBottomnavbar extends StatefulWidget {
  const HomeBottomnavbar({super.key});

  @override
  State<HomeBottomnavbar> createState() => _HomeBottomnavbarState();
}

class _HomeBottomnavbarState extends State<HomeBottomnavbar> {
  PageController _pageController = PageController();
  int selectedIndex = 0;

  @override
  void initState() {
    _pageController = PageController(initialPage: selectedIndex);
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  // ignore: unused_element
  void _onItemTapped(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 200),
      curve: Curves.bounceInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView(
          physics: const NeverScrollableScrollPhysics(),
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
          children: [
            const HomePage(),
            // const OrderPage(),
            const BookingListPage(),
            RekomendasiPage(),
            const AkunPage(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        elevation: 10,
        backgroundColor: const Color(0xFFCBD8ED),
        unselectedItemColor: const Color(0xFF000000),
        selectedItemColor: const Color(0xFF3B3B3B),
        currentIndex: selectedIndex,
        selectedFontSize: 14,
        unselectedFontSize: 12,
        selectedIconTheme: const IconThemeData(size: 24),
        unselectedIconTheme: const IconThemeData(size: 20),
        onTap: _onItemTapped,
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 0 ? Icons.home : Icons.home_outlined),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 1
                ? Icons.book_online_rounded
                : Icons.book_online_outlined),
            label: 'Pesanan',
          ),
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 2
                ? Icons.recommend_rounded
                : Icons.recommend_outlined),
            label: 'Rekomendasi',
          ),
          BottomNavigationBarItem(
            icon: Icon(selectedIndex == 3
                ? Icons.person_2_rounded
                : Icons.person_2_outlined),
            label: 'Akun',
          ),
        ],
      ),
    );
  }
}
