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
    description: "FEUP's library is usally a nice queit place to study or read in a quiet place.",
    image: "assets/icons/book.png",
  ),

  PlacesToStudyRooms(
    id:2,
    name: "Sala de PC (B208)",
    description: "This study room is a bit loud but has computers and it's good to study with friends",
    image: "assets/icons/computer.png",
  ),

  PlacesToStudyRooms(
    id:3,
    name: "Sala de PC (B213)",
    description: "This study room is a bit loud but has computers and it's good to study with friends",
    image: "assets/icons/computer.png",
  ),

  PlacesToStudyRooms(
    id:4,
    name: "Sala de estudo (B121)",
    description: "This study room is a bit loud but it's a nice place to study with friends.",
    image: "assets/icons/paper.png",
  ),

  PlacesToStudyRooms(
    id:5,
    name: "Sala de estudo (B122)",
    description: "This study room is a bit loud but it's a nice place to study with friends.",
    image: "assets/icons/paper.png",
  ),

  PlacesToStudyRooms(
    id:6,
    name: "Sala de estudo (B123)",
    description: "This study room is a bit loud but it's a nice place to study with friends.",
    image: "assets/icons/paper.png",
  ),

];
