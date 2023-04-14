class PlacesToStudyRooms{
  final int id;
  final String name, description, image;
  //final Color color;

  PlacesToStudyRooms({
    required this.image,
    required this.name,
    required this.description,
    required this.id,
    //this.color  = Colors.white,
  });
}

List<PlacesToStudyRooms> rooms = [
  PlacesToStudyRooms(
    id:1,
    name: "Biblioteca",
    description: "Biblioteca é Fixe",
    image: "assets/icons/coffee.png",
  ),

  PlacesToStudyRooms(
    id:2,
    name: "Sala de estudo (B301)",
    description: "Sala Bué Fixe",
    image: "assets/icons/bread.png",
  ),

  PlacesToStudyRooms(
    id:3,
    name: "Sala de estudo (B203)",
    description: "Sala super Fixe",
    image: "assets/icons/donut.png",
  ),

  PlacesToStudyRooms(
    id:4,
    name: "Sopa",
    description: "Sala memo Fixe",
    image: "assets/icons/soup.png",
  ),

  PlacesToStudyRooms(
    id:5,
    name: "Queque",
    description: "Sala Fixolas",
    image: "assets/icons/cupcake.png",
  ),

  PlacesToStudyRooms(
    id:6,
    name: "Chá",
    description: "Sala Fixinha",
    image: "assets/icons/tea.png",
  ),

  PlacesToStudyRooms(
    id:7,
    name: "Chupa",
    description: "Sala Fixona",
    image: "assets/icons/lolipop.png",
  ),

  PlacesToStudyRooms(
    id:8,
    name: "Laranja",
    description: "Sala peixe",
    image: "assets/icons/orange.png",
  ),
];
