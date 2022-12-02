import 'package:flutter/material.dart';
import 'package:mentalhealthapp/utils/skills_box.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

class PanelWidget extends StatelessWidget {
  final ScrollController controller;
  final PanelController panelController;
  const PanelWidget(
      {super.key, required this.controller, required this.panelController});

  @override
  Widget build(BuildContext context) {
    return ListView(
      controller: controller,
      padding: EdgeInsets.zero,
      children: <Widget>[
        const SizedBox(height: 12),
        buildHandle(),
        const SizedBox(height: 18),
        buildAboutText(),
        const SizedBox(height: 24),
      ],
    );
  }

  //Traço antes do About
  Widget buildHandle() => GestureDetector(
        onTap: (() => togglePanel()),
        child: Center(
          child: Container(
              width: 40,
              height: 6,
              decoration: BoxDecoration(
                color: Colors.grey[300],
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              )),
        ),
      );

  void togglePanel() => panelController.isPanelOpen
      ? panelController.close()
      : panelController.open();

  //Tudo dentro do panel
  Widget buildAboutText() => Container(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Excercises',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                    ),
                  ),
                  Text(
                    '..',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Colors.grey[900],
                    ),
                  )
                ],
              ),
              const SizedBox(height: 15),
              Column(
                children: [
                  //Speaking Skills
                  SkillBox(
                      icon: Icons.favorite,
                      iconColor: Colors.amber.shade900,
                      boxTitle: 'Speaking Skills',
                      execercisoNum: 16),

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
              )
            ],
          ),
        ),
      );
}
