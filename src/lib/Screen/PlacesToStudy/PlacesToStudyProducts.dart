class PlacesToStudyProduct{
  final int id;
  final String name, description, image;
  //final Color color;

  PlacesToStudyProduct({
    required this.image,
    required this.name,
    required this.description,
    required this.id,
    //this.color  = Colors.white,
  });
}

List<PlacesToStudyProduct> products = [
  PlacesToStudyProduct(
    id:1,
    name: "Café",
    description: "Sala Fixe",
    image: "assets/icons/coffee.png",
  ),

  PlacesToStudyProduct(
    id:2,
    name: "Pão",
    description: "Sala Bué Fixe",
    image: "assets/icons/bread.png",
  ),

  PlacesToStudyProduct(
    id:3,
    name: "Donut",
    description: "Sala super Fixe",
    image: "assets/icons/donut.png",
  ),

  PlacesToStudyProduct(
    id:4,
    name: "Sopa",
    description: "Sala memo Fixe",
    image: "assets/icons/soup.png",
  ),

  PlacesToStudyProduct(
    id:5,
    name: "Queque",
    description: "Sala Fixolas",
    image: "assets/icons/cupcake.png",
  ),

  PlacesToStudyProduct(
    id:6,
    name: "Chá",
    description: "Sala Fixinha",
    image: "assets/icons/tea.png",
  ),

  PlacesToStudyProduct(
    id:7,
    name: "Chupa",
    description: "Sala Fixona",
    image: "assets/icons/lolipop.png",
  ),

  PlacesToStudyProduct(
    id:8,
    name: "Laranja",
    description: "Sala peixe",
    image: "assets/icons/orange.png",
  ),
];
