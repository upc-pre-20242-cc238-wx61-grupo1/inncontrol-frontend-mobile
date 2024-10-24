import 'package:flutter/material.dart';

class AddItemDialog extends StatefulWidget {
  final Function(String, String, String) onItemAdded;

  const AddItemDialog({super.key, required this.onItemAdded});

  @override
  State<AddItemDialog> createState() => _AddItemDialogState();
}

class _AddItemDialogState extends State<AddItemDialog> {
  final TextEditingController itemTitleController = TextEditingController();
  final TextEditingController itemDescriptionController =
      TextEditingController();
  final TextEditingController itemProviderController = TextEditingController();
  final TextEditingController itemProviderContactController =
      TextEditingController();
  final TextEditingController itemProviderDescController =
      TextEditingController();
  final TextEditingController itemQuantityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Add Inventory item'),
      content: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 149,
            height: 35,
            child: TextField(
              controller: itemTitleController,
              maxLines: 1,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Item Title',
                hintStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.8),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 354,
            child: TextField(
              controller: itemDescriptionController,
              expands: false,
              maxLines: 3,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Description...',
                hintStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.8),
                ),
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SizedBox(
                width: 140,
                height: 35,
                child: TextField(
                  controller: itemProviderController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Provider',
                    hintStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.8),
                    ),
                  ),
                ),
              ),
              SizedBox(
                width: 140,
                height: 35,
                child: TextField(
                  controller: itemProviderContactController,
                  decoration: const InputDecoration(
                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 10,
                      vertical: 3,
                    ),
                    filled: true,
                    fillColor: Colors.white,
                    hintText: 'Provider Contact',
                    hintStyle: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(width: 0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 0.8),
                    ),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            width: 354,
            height: 35,
            child: TextField(
              controller: itemProviderDescController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Provider desc.',
                hintStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(width: 0),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.grey, width: 0.8),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 155,
            height: 35,
            child: TextField(
              controller: itemQuantityController,
              decoration: const InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 10,
                  vertical: 3,
                ),
                filled: true,
                fillColor: Colors.white,
                suffixIcon: Icon(Icons.arrow_drop_down),
                hintText: 'Quantity',
                hintStyle: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    width: 0,
                  ),
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
        ],
      ),
      actions: [
        TextButton(
          onPressed: () {
            String title = itemTitleController.text.isEmpty
                ? 'Unknown item'
                : itemTitleController.text;
            String description = itemDescriptionController.text;
            String quantity = itemQuantityController.text.isEmpty
                ? '0'
                : itemQuantityController.text;
            widget.onItemAdded(title, description, quantity);
            Navigator.of(context).pop();
          },
          child: const Text('Add item'),
        ),
      ],
    );
  }
}
