import 'package:flutter/material.dart';
import 'package:matching_game/Score_board.dart';
import 'package:matching_game/game_logic.dart';

class MemoryCard extends StatefulWidget {
  @override
  State<MemoryCard> createState() {
    return MemoryCardState();
  }
}

class MemoryCardState extends State<MemoryCard> {
  Game _game = Game();
  int tries = 0;
  int score = 0;

  @override
  void initState() {
    super.initState();
    _game.initGame();
  }

  @override
  Widget build(BuildContext context) {
    double screen_width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
            child: Text(
              "Matching Game",
              style: TextStyle(
                  fontSize: 48,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              scoreBoard("Tries", "${tries}"),
              scoreBoard("Score", "${score}"),
            ],
          ),
          SizedBox(
            height: screen_width,
            width: screen_width,
            child: GridView.builder(
                itemCount: _game.gameImg!.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  crossAxisSpacing: 16.0,
                  mainAxisSpacing: 16.0,
                ),
                padding: EdgeInsets.all(16),
                itemBuilder: (context, index) {
                  return GestureDetector(
                      onTap: () {
                        print(_game.cards_list[index]);
                        setState(() {
                          tries++;
                          _game.gameImg![index] = _game.cards_list[index];
                          _game.matchCheck
                              .add({index: _game.cards_list[index]});
                        });
                        if (_game.matchCheck.length == 3) {
                          if (_game.matchCheck[0].values.first ==
                                  _game.matchCheck[1].values.first &&
                              _game.matchCheck[0].values.first ==
                                  _game.matchCheck[2].values.first) {
                            print("true");
                            score += 100;
                            _game.matchCheck.clear();
                          } else {
                            print("false");
                            Future.delayed(Duration(milliseconds: 1000), () {
                              print(_game.gameImg);
                              setState(() {
                                _game.gameImg![_game.matchCheck[0].keys.first] =
                                    _game.hiddenCardpath;
                                _game.gameImg![_game.matchCheck[1].keys.first] =
                                    _game.hiddenCardpath;
                                _game.gameImg![_game.matchCheck[2].keys.first] =
                                    _game.hiddenCardpath;
                                _game.matchCheck.clear();
                              });
                            });
                          }
                        }
                      },
                      child: Container(
                        padding: EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.orange,
                          borderRadius: BorderRadius.circular(8),
                          image: DecorationImage(
                            image: AssetImage(_game.gameImg![index]),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ));
                }),
          ),
        ],
      ),
    );
  }
}
