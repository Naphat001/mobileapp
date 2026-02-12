import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/product_provider.dart';
import '../widgets/product_card.dart';

class ProductListScreen extends StatefulWidget {
  static const routeName = '/product-list';

  const ProductListScreen({Key? key}) : super(key: key);

  @override
  _ProductListScreenState createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  String _sortOrder = 'name'; // 'name', 'price_asc', 'price_desc'
  String _searchQuery = '';

  @override
  Widget build(BuildContext context) {
    final productsData = Provider.of<ProductProvider>(context);
    var products = productsData.searchProducts(_searchQuery);

    // Sorting logic
    if (_sortOrder == 'price_asc') {
      products.sort((a, b) => a.price.compareTo(b.price));
    } else if (_sortOrder == 'price_desc') {
      products.sort((a, b) => b.price.compareTo(a.price));
    } else {
      products.sort((a, b) => a.name.compareTo(b.name));
    }

    return Column(
      children: [
        // Search Bar and Filter
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Expanded(
                child: TextField(
                  decoration: const InputDecoration(
                    labelText: 'Search...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(),
                  ),
                  onChanged: (value) {
                    setState(() {
                      _searchQuery = value;
                    });
                  },
                ),
              ),
              const SizedBox(width: 10),
              DropdownButton<String>(
                value: _sortOrder,
                items: [
                  const DropdownMenuItem(value: 'name', child: Text('Name')),
                  const DropdownMenuItem(
                    value: 'price_asc',
                    child: Text('Price: Low-High'),
                  ),
                  const DropdownMenuItem(
                    value: 'price_desc',
                    child: Text('Price: High-Low'),
                  ),
                ],
                onChanged: (value) {
                  setState(() {
                    _sortOrder = value!;
                  });
                },
              ),
            ],
          ),
        ),
        Expanded(
          child: products.isEmpty
              ? const Center(child: Text('ไม่พบสินค้า'))
              : GridView.builder(
                  padding: const EdgeInsets.all(10.0),
                  itemCount: products.length,
                  itemBuilder: (ctx, i) => ProductCard(product: products[i]),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 0.7, // Adjusted for card height
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                  ),
                ),
        ),
      ],
    );
  }
}
