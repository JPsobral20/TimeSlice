class ShopProduct{
  final int id, price;
  final String name, image;
  //final Color color;

  ShopProduct({
    required this.image,
    required this.name,
    required this.price,
    required this.id,
    //this.color  = Colors.white,
  });
}

List<ShopProduct> products = [
  ShopProduct(
    id:1,
    name: "Café",
    price: 20,
    image: "assets/icons/coffee.png",
  ),

  ShopProduct(
    id:2,
    name: "Pão",
    price: 30,
    image: "assets/icons/bread.png",
  ),

  ShopProduct(
    id:3,
    name: "Donut",
    price: 60,
    image: "assets/icons/donut.png",
  ),

  ShopProduct(
    id:4,
    name: "Sopa",
    price: 120,
    image: "assets/icons/soup.png",
  ),

  ShopProduct(
    id:5,
    name: "Queque",
    price: 80,
    image: "assets/icons/cupcake.png",
  ),

  ShopProduct(
    id:6,
    name: "Chá",
    price: 20,
    image: "assets/icons/tea.png",
  ),

  ShopProduct(
    id:7,
    name: "Chupa",
    price: 30,
    image: "assets/icons/lolipop.png",
  ),

  ShopProduct(
    id:8,
    name: "Laranja",
    price: 30,
    image: "assets/icons/orange.png",
  ),
];
