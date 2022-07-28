
import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jacobia/constants.dart';

import '../../components/reusable_widgets.dart';
import 'leaderboard_screen.dart';


class AfterGameScreen extends StatefulWidget {
  final int score;

  const AfterGameScreen({Key? key, required this.score}) : super(key: key);

  @override
  State<AfterGameScreen> createState() => _AfterGameScreenState();
}

class _AfterGameScreenState extends State<AfterGameScreen> {
  bool isPlaying = false;
  late ConfettiController _controllerTopCenter;

  @override
  void dispose() {
    _controllerTopCenter.dispose();
    super.dispose();
  }

  @override
  void initState() {
    _controllerTopCenter =
        ConfettiController(duration: const Duration(seconds: 5));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {

    setState(() {
      _controllerTopCenter.play();
    });

    return Stack(
      alignment: Alignment.topCenter,
      children: [
        Scaffold(
          backgroundColor: Colors.white,
          body: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height*0.05),
              child: Column(
                children: [
                  Center(
                      child: Column(
                    children: [
                      Text(
                        "Congratulations!",
                        style: Theme.of(context).textTheme.headline3?.copyWith(
                            color: Color(0xffFFBA07),
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(top: MediaQuery.of(context).size.width*0.05),
                        child: CircleAvatar(
                          backgroundColor: Color(0xff5A88B0),
                          radius: 120,
                          child: Image.asset('assets/images/kupa.png'),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              width:MediaQuery.of(context).size.width*0.4,
                              height: MediaQuery.of(context).size.height*0.15,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    widget.score.toString() + "/10",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(
                                            color:secondaryColor,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    "Score",
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        ?.copyWith(
                                            color: Color(0xff00B2FF),
                                            fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Container(
                          height:MediaQuery.of(context).size.height*0.10,
                          width: MediaQuery.of(context).size.width*0.5,
                          child: InkWell(
                            onTap: () {
                              Get.to(LeaderboardScreen())

                              ;
                            },
                            child: Card(

                              color: Color(0xff26ce99),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Center(
                                child: Text(
                                  "Next",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5
                                      ?.copyWith(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )),
                ],
              ),
            ),
          ),
        ),
        ConfettiWidget(
          numberOfParticles: 50,
          blastDirectionality: BlastDirectionality.explosive,
          confettiController: _controllerTopCenter,
        )
      ],
    );
  }
}
