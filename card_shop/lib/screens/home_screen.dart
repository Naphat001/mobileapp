import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/product_card.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    final newProducts = productsData.newItems;

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Banner Section
          SizedBox(
            height: 200,
            width: double.infinity,
            child: PageView(
              children: [
                Image.network(
                  'https://via.placeholder.com/800x400.png?text=New+Arrrivals+Shadowverse',
                  fit: BoxFit.cover,
                ),
                Image.network(
                  'https://via.placeholder.com/800x400.png?text=Big+Sale+50%25+Off',
                  fit: BoxFit.cover,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text(
              'สินค้าใหม่ (NEW ARRIVALS)',
              style: Theme.of(
                context,
              ).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 280,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: newProducts.length,
              itemBuilder: (ctx, i) => Container(
                width: 160,
                margin: const EdgeInsets.only(left: 16, bottom: 10),
                child: ProductCard(product: newProducts[i]),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
