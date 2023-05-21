class ShopProduct{
  final int id, price;
  final String name, image;

  ShopProduct({
    required this.image,
    required this.name,
    required this.price,
    required this.id,
  });
}

List<ShopProduct> products = [
  ShopProduct(
    id:1,
    name: "Coffee",
    price: 1200,
    image: "assets/icons/coffee.png",
  ),

  ShopProduct(
    id:2,
    name: "Bread",
    price: 1800,
    image: "assets/icons/bread.png",
  ),

  ShopProduct(
    id:3,
    name: "Donut",
    price: 3600,
    image: "assets/icons/donut.png",
  ),

  ShopProduct(
    id:4,
    name: "Soup",
    price: 7200,
    image: "assets/icons/soup.png",
  ),

  ShopProduct(
    id:5,
    name: "Muffin",
    price: 4800,
    image: "assets/icons/muffin.png",
  ),

  ShopProduct(
    id:6,
    name: "Tea",
    price: 1200,
    image: "assets/icons/tea.png",
  ),

  ShopProduct(
    id:7,
    name: "Lollipop",
    price: 1800,
    image: "assets/icons/lollipop.png",
  ),

  ShopProduct(
    id:8,
    name: "Orange",
    price: 1800,
    image: "assets/icons/orange.png",
  ),
];
