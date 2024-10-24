import 'package:flutter/material.dart';
import 'package:inncontrol/components/add_item_dialog.dart';
import 'package:inncontrol/components/item_card.dart';
// import 'package:flutter_svg/flutter_svg.dart';

import '../../models/item.dart';

class InventoryScreen extends StatefulWidget {
  const InventoryScreen({super.key});

  @override
  State<InventoryScreen> createState() => _InventoryScreenState();
}

class _InventoryScreenState extends State<InventoryScreen> {
  List<ItemModel> items = [
    ItemModel(
      itemName: 'Shampoo',
      itemStock: 150,
      itemDescription:
          'Su fórmula suave limpia profundamente, dejando el cabello fresco, hidratado y con un aroma agradable que perdura.',
      graphPath: 'assets/vectors/graph.png',
    ),
    ItemModel(
      itemName: 'Jabón de mano',
      itemStock: 250,
      itemDescription:
          'Jabón con la más alta protección antibacteriana con aroma a aloe vera y frutos rojos.',
      graphPath: 'assets/vectors/graph.png',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: inventorySection(),
    );
  }

  Column inventorySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        mainTitle(),
        inventorySearchBar(),
        Expanded(
          child: showInventory(),
        ),
      ],
    );
  }

  ListView showInventory() {
    return ListView.separated(
      // shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 28),
      itemCount: items.length,
      itemBuilder: (context, index) {
        return ItemCard(
          item: items[index],
          onDelete: () => deleteItem(index),
        );
      },
      separatorBuilder: (context, index) => const SizedBox(height: 22),
    );
  }

  Padding inventorySearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 11),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(
            width: 290,
            height: 42,
            child: TextField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.grey,
                  size: 25,
                  applyTextScaling: true,
                ),
                suffixIcon: Icon(Icons.filter_alt_outlined, color: Colors.grey),
                hintText: 'Search',
                hintStyle: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey,
                    width: 0.8,
                  ),
                ),
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              showAddItemDialog(context);
            },
            style: ElevatedButton.styleFrom(
              fixedSize: const Size(42, 42),
              shape: const CircleBorder(),
              backgroundColor: const Color(0xff1D455E),
              padding: EdgeInsets.zero,
            ),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            ),
          )
        ],
      ),
    );
  }

  Padding mainTitle() {
    return const Padding(
      padding: EdgeInsets.only(left: 10),
      child: Text(
        'Inventory',
        style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 34,
            color: Colors.white,
            shadows: [
              Shadow(
                blurRadius: 4,
                color: Colors.black26,
                offset: Offset(0, 4),
              )
            ]),
      ),
    );
  }

  Future showAddItemDialog(BuildContext context) {
    return showDialog(
      barrierColor: Colors.black.withOpacity(0.8),
      context: context,
      builder: (context) {
        return AddItemDialog(
          onItemAdded: (title, description, quantity) {
            createItem(title, description, quantity);
          },
        );
      },
    );
  }

  void createItem(String name, String description, String stock) {
    setState(() {
      items.add(ItemModel(
        itemName: name,
        itemStock: int.parse(stock),
        itemDescription: description,
        graphPath: 'assets/vectors/graph.png',
      ));
    });
  }

  void deleteItem(int index) {
    setState(() {
      items.removeAt(index);
    });
  }
}
