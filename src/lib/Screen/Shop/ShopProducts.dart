class ShopProduct{
  final int id, price;
  final String name, image, type;

  ShopProduct({
    required this.image,
    required this.name,
    required this.price,
    required this.id,
    required this.type,
  });
}

List<ShopProduct> products = [
  ShopProduct(
    id:1,
    name: "Café",
    price: 20,
    type: "Drinks",
    image: "assets/icons/coffee.png",
  ),

  ShopProduct(
    id:2,
    name: "Pão",
    price: 30,
    type: "Snacks",
    image: "assets/icons/bread.png",
  ),

  ShopProduct(
    id:3,
    name: "Donut",
    price: 60,
    type: "Snacks",
    image: "assets/icons/donut.png",
  ),

  ShopProduct(
    id:4,
    name: "Sopa",
    price: 120,
    type: "Meals",
    image: "assets/icons/soup.png",
  ),

  ShopProduct(
    id:5,
    name: "Queque",
    price: 80,
    type: "Snacks",
    image: "assets/icons/cupcake.png",
  ),

  ShopProduct(
    id:6,
    name: "Chá",
    price: 20,
    type: "Drinks",
    image: "assets/icons/tea.png",
  ),

  ShopProduct(
    id:7,
    name: "Chupa",
    price: 30,
    type: "Snacks",
    image: "assets/icons/lolipop.png",
  ),

  ShopProduct(
    id:8,
    name: "Laranja",
    price: 30,
    type: "Snacks",
    image: "assets/icons/orange.png",
  ),
];
