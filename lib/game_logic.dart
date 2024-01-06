class Game{
  final String hiddenCardpath = "assets/images/hidden.png";

  List<String>? gameImg;

  final List<String> cards_list = [
    "assets/images/circle2.png",
    "assets/images/triangle2.webp",
    "assets/images/circle2.png",
    "assets/images/circle2.png",
    // "assets/images/pent.jpg",
    "assets/images/star.png",
    "assets/images/triangle2.webp",
    "assets/images/triangle2.webp",
    "assets/images/star.png",
    "assets/images/star.png",
    // "assets/images/pent.jpg",

    // "assets/images/rectangular.png",
    // "assets/images/square.jpeg",
    // "assets/images/square.jpeg",
    // "assets/images/rectangular.png",
  ];

  List<Map<int, String>> matchCheck = [];

  final int cardCount = 9;

  void initGame(){
    gameImg = List.generate(cardCount, (index) => hiddenCardpath);
  }
}