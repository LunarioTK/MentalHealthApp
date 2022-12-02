import 'package:flutter/material.dart';
import 'package:mentalhealthapp/pages/searchbar.dart';
import 'package:mentalhealthapp/utils/emoji.dart';
import 'package:mentalhealthapp/utils/emojipopup.dart';
import 'package:mentalhealthapp/utils/panelwidget.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final panelController = PanelController();
  List<String> emojis = [
    '😔',
    '😊',
    '😁',
    '😃',
  ];
  void showPopup(int pos) {
    showDialog(
        context: context,
        builder: ((context) {
          return PopUpEmoji(
            emoji: emojis[pos],
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    final panelHeightClosed = MediaQuery.of(context).size.height * 0.4;
    final panelHeightOpen = MediaQuery.of(context).size.height * 0.65;

    return Scaffold(
      resizeToAvoidBottomInset: false,
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
      body: SlidingUpPanel(
        minHeight: panelHeightClosed,
        maxHeight: panelHeightOpen,
        controller: panelController,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(20)),
        panelBuilder: (controller) => PanelWidget(
          panelController: panelController,
          controller: controller,
        ),
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
                            borderRadius: BorderRadius.circular(12),
                          ),
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
                          heightFactor: 2.3,
                          alignment: Alignment.bottomCenter,
                          child: Row(
                            //crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              //Badly
                              Column(
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        showPopup(0);
                                      });
                                    },
                                    child: EmojiFace(emoji: emojis[0]),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
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
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        showPopup(1);
                                      });
                                    },
                                    child: EmojiFace(
                                      emoji: emojis[1],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
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
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        showPopup(2);
                                      });
                                    },
                                    child: EmojiFace(
                                      emoji: emojis[2],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
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
                                children: [
                                  TextButton(
                                    onPressed: () {
                                      setState(() {
                                        showPopup(3);
                                      });
                                    },
                                    child: EmojiFace(
                                      emoji: emojis[3],
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  const Text(
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
                        Align(
                          alignment: Alignment.topCenter,
                          child: SearchBar(
                            panelController: panelController,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
