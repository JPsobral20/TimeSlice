class PlacesToStudyRooms{
  final int id;
  final String name, description, image, schedule;

  PlacesToStudyRooms({
    required this.schedule,
    required this.image,
    required this.name,
    required this.description,
    required this.id,
  });
}

List<PlacesToStudyRooms> rooms = [
  PlacesToStudyRooms(
    id: 1,
    name: "Biblioteca",
    description: "FEUP's library is usally a nice queit place to study or read in a quiet place.",
    image: "assets/icons/book.png",
    schedule: "Segunda a Sexta das 8:30-19:30",
  ),

  PlacesToStudyRooms(
    id: 2,
    name: "Sala de PC (B208)",
    description: "This study room is a bit loud but has computers and it's good to study with friends",
    image: "assets/icons/computer.png",
    schedule: "Segunda das 14:00- 17:30",
  ),

  PlacesToStudyRooms(
    id: 3,
    name: "Sala de PC (B213)",
    description: "This study room is a bit loud but has computers and it's good to study with friends",
    image: "assets/icons/computer.png",
    schedule: "Terça das 15:00- 17:00",
  ),

  PlacesToStudyRooms(
    id: 4,
    name: "Sala de estudo (B121)",
    description: "This study room is a bit loud but it's a nice place to study with friends.",
    image: "assets/icons/paper.png",
    schedule: "Quarta das 9:00- 13:00",
  ),

  PlacesToStudyRooms(
    id: 5,
    name: "Sala de estudo (B122)",
    description: "This study room is a bit loud but it's a nice place to study with friends.",
    image: "assets/icons/paper.png",
    schedule: "Quinta das 8:30- 12:30",
  ),

  PlacesToStudyRooms(
    id: 6,
    name: "Sala de estudo (B123)",
    description: "This study room is a bit loud but it's a nice place to study with friends.",
    image: "assets/icons/paper.png",
    schedule: "Sexta das 10:00- 16:30",
  ),

];
