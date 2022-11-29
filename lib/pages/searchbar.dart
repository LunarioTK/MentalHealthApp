import 'package:flutter/material.dart';

class SearchBar extends StatefulWidget {
  const SearchBar({super.key});

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  late final controller = TextEditingController();
  bool _visible = false;
  List<String> matchQuery = [];
  //Lista de sugestões de pesquisa
  List<String> searchTerms = [
    "Apple",
    "Banana",
    "Mango",
    "Pear",
    "Watermelons",
    "Blueberries",
    "Pineapples",
    "Strawberries"
  ];

  void findMatch() {
    setState(() {
      //Comparação entre a lista e o que escrevo na caixa
      matchQuery = searchTerms
          .where((element) =>
              element.toLowerCase().contains(controller.text.toLowerCase()))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
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
                findMatch();
                _visible = !_visible;
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
        Stack(
          clipBehavior: Clip.none,
          children: [
            controller.text.isEmpty
                ? Container()
                : AnimatedOpacity(
                    opacity: _visible ? 1.0 : 0.0,
                    duration: const Duration(milliseconds: 400),
                    child: searchTerms.isEmpty
                        ? Center(
                            child: Text(
                              'No results found',
                              style: TextStyle(
                                  color: Colors.grey[600],
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                        : Container(
                            constraints: const BoxConstraints.tightForFinite(
                              height: 200,
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
                  ),
          ],
        ),
      ],
    );
  }
}
