import 'package:flutter/material.dart';
import '../widgets/app_drawer.dart';
import './home_screen.dart';
import './product_list_screen.dart';

class MainScreen extends StatefulWidget {
  static const routeName = '/';
  const MainScreen({Key? key}) : super(key: key);

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    const HomeScreen(),
    const ProductListScreen(), // Products Tab
    const Center(child: Text('Orders Screen')), // Orders
    const Center(child: Text('Notifications Screen')), // Notifications
    const Center(child: Text('Account Screen')), // Account
  ];

  final List<String> _titles = [
    'CardShop - Home',
    'Products',
    'Orders',
    'Notifications',
    'Account',
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_titles[_selectedIndex]),
        actions: [
          if (_selectedIndex == 0)
            TextButton(
              onPressed: () {},
              child: const Text(
                'Login/Join',
                style: TextStyle(color: Colors.white),
              ),
            ),
        ],
      ),
      drawer: const AppDrawer(),
      body: _pages[_selectedIndex],
      floatingActionButton: _selectedIndex == 0
          ? FloatingActionButton(
              onPressed: () {},
              backgroundColor: Colors.orange,
              child: const Icon(Icons.chat),
            )
          : null,
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed, // Needed for 4+ items
        backgroundColor: Colors.white,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.grey,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'หน้าแรก'),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_bag),
            label: 'สินค้า',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_alt),
            label: 'สั่งซื้อ',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: 'แจ้งเตือน',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'บัญชี'),
        ],
      ),
    );
  }
}
