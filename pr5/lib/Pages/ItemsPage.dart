import 'package:flutter/material.dart';
import 'package:pr5/Pages/ItemPage.dart';
import 'package:pr5/Pages/component/Items.dart';
import 'package:pr5/model/items.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        title: const Text('Товары'),
        backgroundColor: Colors.white70,
      ),
      body: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            childAspectRatio: 0.7,
          ),
          itemCount: ItemsList.length,
          itemBuilder: (BuildContext context, int index) {
            return ListOfItems(item: ItemsList[index]);
          }),
    );
  }
}

class ListOfItems extends StatelessWidget {
  const ListOfItems({super.key, required this.item});

  final Items item;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ItemPage(item: item),
          ),
        );
      },
      child: Padding(
        padding:
            const EdgeInsets.only(right: 5.0, left: 5.0, top: 2.0, bottom: 5.0),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.25,
          //height: MediaQuery.of(context).size.height * 0.47,
          decoration: BoxDecoration(
            color: const Color.fromARGB(255, 255, 246, 218),
            borderRadius: BorderRadius.circular(7.0),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              Center(
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey, width: 1),
                  ),
                  child: Image.network(
                    item.image,
                    width: MediaQuery.of(context).size.width * 0.4,
                    height: MediaQuery.of(context).size.width * 0.4,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, child, loadingProgress) {
                      if (loadingProgress == null) return child;
                      return const CircularProgressIndicator();
                    },
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        width: MediaQuery.of(context).size.width * 0.4,
                        height: MediaQuery.of(context).size.width * 0.4,
                        color: Colors.amber[200],
                        child: const Center(
                            child: Text(
                          'нет картинки',
                          softWrap: true,
                          textAlign: TextAlign.center,
                        )),
                      );
                    },
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: 4.0, bottom: 0.0, right: 15.0, left: 15.0),
                child: SizedBox(
                  height: 35.0,
                  child: Text(
                    '${item.name}',
                    style: const TextStyle(fontSize: 12),
                    softWrap: true,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15.0, right: 5.0),
                child: Row(children: [
                  const Text(
                    'Цена: ',
                    style: TextStyle(fontSize: 12),
                  ),
                  Text(
                    '${item.cost} ₽',
                    style: const TextStyle(
                        fontSize: 12,
                        color: Color.fromARGB(255, 6, 196, 9),
                        fontWeight: FontWeight.bold),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: IconButton(
                          onPressed: () => {},
                          icon: item.favorite
                              ? const Icon(Icons.favorite)
                              : const Icon(Icons.favorite_border)),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
