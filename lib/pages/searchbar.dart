import 'package:flutter/material.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

class SearchBar extends StatefulWidget {
  final PanelController panelController;
  const SearchBar({super.key, required this.panelController});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late final controller = TextEditingController();
  bool _visible = false;
  bool keyOpen = false;
  List<String> matchQuery = [];
  //Lista de sugestões de pesquisa
  List<String> searchTerms = [
    "Psicologo",
    "Psiquiatra",
    "Depressão",
    "Bipolaridade",
    "Distúrbios alimentares",
  ];

  void findMatch() {
    setState(() {
      //Comparação entre a lista e o que escrevo na caixa
      /*matchQuery = searchTerms
          .where((element) =>
              element.toLowerCase().contains(controller.text.toLowerCase()))
          .toList();*/
      for (var terms in searchTerms) {
        if (terms.toLowerCase().contains(controller.text.toLowerCase())) {
          matchQuery = searchTerms
              .where((terms) =>
                  terms.toLowerCase().contains(controller.text.toLowerCase()))
              .toList();
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;
    return Column(
      children: [
        //Criação da caixa de pesquisa
        Container(
          padding: const EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: Colors.blue[300],
            borderRadius: BorderRadius.circular(12),
          ),
          child: TextField(
            onChanged: (value) {
              setState(() {
                _visible = !_visible;
                findMatch();
              });
            },
            controller: controller,
            style: const TextStyle(
              color: Colors.white,
            ),
            decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
              hintText: 'Search...',
              hintStyle: const TextStyle(
                fontSize: 18,
                color: Colors.white,
              ),
              prefixIcon: const Icon(
                Icons.search,
                size: 25,
                color: Colors.white,
              ),
              suffixIcon: IconButton(
                onPressed: () => controller.clear(),
                icon: const Icon(
                  Icons.clear,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),

        //Mostrar a pesquisa
        controller.text.isEmpty
            ? const SizedBox()
            : matchQuery.isEmpty
                ? const SizedBox()
                : Container(
                    constraints: const BoxConstraints.tightForFinite(
                      height: 180,
                    ),
                    margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
                    decoration: BoxDecoration(
                      color: Colors.blue[300],
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: ListView.builder(
                      itemCount: matchQuery.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          contentPadding:
                              const EdgeInsets.fromLTRB(35, 0, 15, 0),
                          onTap: () {
                            setState(() {
                              controller.text = matchQuery[index];
                              FocusManager.instance.primaryFocus?.unfocus();
                              matchQuery = [];
                            });
                          },
                          title: Text(
                            matchQuery[index],
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                            ),
                          ),
                        );
                      },
                    ),
                  ),
      ],
    );
  }
}
