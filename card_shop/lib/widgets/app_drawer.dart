import 'package:flutter/material.dart';

class AppDrawer extends StatelessWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          AppBar(title: const Text('Menu'), automaticallyImplyLeading: false),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home (หน้าแรก)'),
            onTap: () {
              Navigator.of(context).pushReplacementNamed('/');
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.shop),
            title: const Text('All Products (สินค้าทั้งหมด)'),
            onTap: () {
              // If we are using MainScreen with BottomNav, we might want to switch tab instead.
              // But for simplicity/standard drawer nav behavior:
              // We can push ProductListScreen or pop and switch tab if we had access to MainScreen state.
              // For now, let's just push Named if it's a separate route, or handle it via MainScreen.
              // Since MainScreen handles BottomNav, let's assume 'Home' goes to / (MainScreen).
              // 'All Products' could also be on MainScreen index 1.
              Navigator.of(context).pushReplacementNamed('/');
              // In a real app with BottomNav + Drawer, Drawer usually switches the BottomNav index.
              // But here I'll just close drawer for now as we are likely already on MainScreen.
            },
          ),
          const Divider(),
          ListTile(
            leading: const Icon(Icons.payment),
            title: const Text('Payment (แจ้งchำระเงิน)'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.article),
            title: const Text('Articles (บทความ)'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.info),
            title: const Text('About Us (เกี่ยวกับเรา)'),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.contact_mail),
            title: const Text('Contact Us (ติดต่อเรา)'),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
