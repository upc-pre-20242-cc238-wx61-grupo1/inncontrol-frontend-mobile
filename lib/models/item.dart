class ItemModel {
  String itemName;
  String itemDescription;
  int itemStock;
  String graphPath;

  ItemModel(
      {required this.itemName,
        required this.itemStock,
        required this.itemDescription,
        required this.graphPath});

  static List<ItemModel> getItems() {
    List<ItemModel> items = [];

    items.add(ItemModel(
      itemName: 'Shampoo',
      itemStock: 150,
      itemDescription:
      'Su fórmula suave limpia profundamente, dejando el cabello fresco, hidratado y con un aroma agradable que perdura.',
      graphPath: 'assets/vectors/graph.png',
    ));
    items.add(ItemModel(
      itemName: 'Jabón de mano',
      itemStock: 250,
      itemDescription:
      'Jabón con la más alta protección antibacteriana con aroma a aloe vera y frutos rojos.',
      graphPath: 'assets/vectors/graph.png',
    ));

    return items;
  }

  static void addItem() {}
}