import 'package:flutter/material.dart';
import 'package:inncontrol/models/item.dart';

class ItemCard extends StatelessWidget {
  final ItemModel item;
  final VoidCallback onDelete;

  const ItemCard({super.key, required this.item, required this.onDelete});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        shape: BoxShape.rectangle,
        // color: Color(0xffEFEFEF),
        color: Color(0xffEFEFEF),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  item.itemName,
                  style: const TextStyle(
                    fontSize: 21,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                SizedBox(
                  height: 35,
                  child: TextButton(
                    onPressed: onDelete,
                    style: TextButton.styleFrom(
                        backgroundColor: const Color(0xff72B9EA),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5))),
                    child: const Row(
                      children: [
                        Text(
                          'Delete',
                          style: TextStyle(color: Colors.white, fontSize: 13),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Icon(
                          Icons.delete,
                          color: Colors.white,
                          size: 15,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              item.itemDescription,
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.black87,
              ),
            ),
            const SizedBox(
              height: 23,
            ),
            Text(
              'Stock Level: ${item.itemStock}',
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 23),
            Image.asset(
              item.graphPath,
              fit: BoxFit.none,
            ),
          ],
        ),
      ),
    );
  }
}
