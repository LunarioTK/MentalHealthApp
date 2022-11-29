import 'package:flutter/material.dart';
import 'package:mentalhealthapp/pages/searchbar.dart';
import 'package:mentalhealthapp/utils/emoji.dart';
import 'package:mentalhealthapp/utils/skills_box.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(
          icon: Icon(
            Icons.home,
            color: Colors.grey,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.message,
            color: Colors.grey,
          ),
          label: '',
        ),
        BottomNavigationBarItem(
          icon: Icon(
            Icons.person,
            color: Colors.grey,
          ),
          label: '',
        ),
      ]),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      //Hi jaret!
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Hi, Jaret!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 24,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            '17 nov, 2022',
                            style: TextStyle(
                              color: Colors.blue[200],
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      ),

                      //Notificarções
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.blue[300],
                            borderRadius: BorderRadius.circular(12)),
                        padding: const EdgeInsets.all(12),
                        child: const Icon(
                          Icons.notifications,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 35),
                  Stack(
                    children: [
                      //Emojis
                      Align(
                        heightFactor: 2.4,
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          //crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            //Badly
                            Column(
                              children: const [
                                EmojiFace(emoji: '😔'),
                                SizedBox(height: 15),
                                Text(
                                  'Badly',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            //Fine
                            Column(
                              children: const [
                                EmojiFace(emoji: '😊'),
                                SizedBox(height: 15),
                                Text(
                                  'Fine',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            //Well
                            Column(
                              children: const [
                                EmojiFace(emoji: '😁'),
                                SizedBox(height: 15),
                                Text(
                                  'Well',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),

                            //Excellent
                            Column(
                              children: const [
                                EmojiFace(emoji: '😃'),
                                SizedBox(height: 15),
                                Text(
                                  'Excellent',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),

                      //Como te sentes
                      Align(
                        heightFactor: 6.5,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'How do you feel?',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '..',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                                letterSpacing: 1,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),

                      //Search Bar
                      const Align(
                        alignment: Alignment.topCenter,
                        child: SearchBar(),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            //Exercises bar
            Expanded(
              child: ClipRRect(
                borderRadius:
                    const BorderRadius.vertical(top: Radius.circular(40)),
                child: Container(
                  color: Colors.grey[200],

                  //Excercises and ..
                  child: Column(
                    children: [
                      const SizedBox(height: 35),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 35.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Exercises',
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              '..',
                              style: TextStyle(
                                color: Colors.grey[900],
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Expanded(
                        child: ListView(
                          children: [
                            const SizedBox(height: 15),

                            //Speaking Skills
                            SkillBox(
                                icon: Icons.favorite,
                                iconColor: Colors.amber.shade900,
                                boxTitle: 'Speaking Skills',
                                execercisoNum: 16),

                            const SizedBox(height: 15),

                            //Reading Skills
                            SkillBox(
                                icon: Icons.person,
                                iconColor: Colors.blue.shade800,
                                boxTitle: 'Reading Skills',
                                execercisoNum: 8),

                            //Listening Skills
                            SkillBox(
                                icon: Icons.record_voice_over,
                                iconColor: Colors.pink.shade800,
                                boxTitle: 'Listening Skills',
                                execercisoNum: 12),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
