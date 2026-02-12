import 'package:flutter/material.dart';
import '../models/product.dart';

class ProductProvider with ChangeNotifier {
  final List<Product> _items = [
    Product(
      id: 'p1',
      name: 'Shadowverse Evolve: Starter Deck #1',
      sku: 'SKU-00001',
      price: 899.00,
      imageUrl: 'https://via.placeholder.com/300x400.png?text=Starter+Deck+1',
      description:
          'The first starter deck for Shadowverse Evolve. Contains everything you need to start playing.',
      isNew: true,
      category: 'Shadowverse',
    ),
    Product(
      id: 'p2',
      name: 'Shadowverse Evolve: Booster Set #1',
      sku: 'SKU-00002',
      price: 150.00,
      imageUrl: 'https://via.placeholder.com/300x400.png?text=Booster+Set+1',
      description: 'Expand your collection with Booster Set #1.',
      isNew: true,
      category: 'Shadowverse',
    ),
    Product(
      id: 'p3',
      name: 'One Piece Card Game: Starter Deck',
      sku: 'SKU-00003',
      price: 550.00,
      imageUrl: 'https://via.placeholder.com/300x400.png?text=One+Piece+Deck',
      description: 'Set sail with the Straw Hat Crew in this starter deck.',
      isNew: false,
      category: 'One Piece',
    ),
    Product(
      id: 'p4',
      name: 'Vanguard: Trial Deck 01',
      sku: 'SKU-00004',
      price: 400.00,
      imageUrl: 'https://via.placeholder.com/300x400.png?text=Vanguard+TD01',
      description: 'Stand up, Vanguard! Trial Deck for beginners.',
      isNew: false,
      category: 'Vanguard',
    ),
    Product(
      id: 'p5',
      name: 'Pokemon TCG: Elite Trainer Box',
      sku: 'SKU-00005',
      price: 2500.00,
      imageUrl: 'https://via.placeholder.com/300x400.png?text=Pokemon+ETB',
      description: 'The ultimate trainer box for Pokemon collectors.',
      isNew: true,
      category: 'Pokemon',
    ),
  ];

  List<Product> get items {
    return [..._items];
  }

  List<Product> get newItems {
    return _items.where((prod) => prod.isNew).toList();
  }

  Product findById(String id) {
    return _items.firstWhere((prod) => prod.id == id);
  }

  List<Product> searchProducts(String query) {
    return _items
        .where((prod) => prod.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }
}
