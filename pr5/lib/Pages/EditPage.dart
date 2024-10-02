import 'package:flutter/material.dart';
import 'package:pr5/Pages/component/Person.dart';
import 'package:pr5/model/person.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key});

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {
  final TextEditingController imageController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController mailController = TextEditingController();
  String img_link = PersonList.elementAt(0).image;

  void enter_img(String text) {
    setState(() {
      img_link = text;
    });
  }

  @override
  void initState() {
    super.initState();
    imageController.text = PersonList.elementAt(0).image;
    nameController.text = PersonList.elementAt(0).name;
    phoneController.text = PersonList.elementAt(0).phone;
    mailController.text = PersonList.elementAt(0).mail;
  }

  @override
  void dispose() {
    imageController.dispose();
    nameController.dispose();
    phoneController.dispose();
    mailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 246, 218),
        appBar: AppBar(
          title: const Text('Товары'),
          backgroundColor: Colors.amber[200],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 15.0, bottom: 15.0),
                child: Center(
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: MediaQuery.of(context).size.width * 0.5,
                    decoration: BoxDecoration(
                        color: Colors.amber[100],
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 2),
                        image: DecorationImage(
                          image: NetworkImage(img_link),
                          fit: BoxFit.cover,
                        )),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  style: const TextStyle(fontSize: 14.0, color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: 'Картинка',
                    hintStyle:
                        const TextStyle(fontSize: 14.0, color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(255, 160, 0, 1), width: 1.0)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(255, 160, 0, 1), width: 2.0)),
                  ),
                  controller: imageController,
                  onChanged: (text) {
                    enter_img(text);
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  style: const TextStyle(fontSize: 14.0, color: Colors.black),
                  decoration: const InputDecoration(
                    hintText: 'Имя',
                    hintStyle:
                        const TextStyle(fontSize: 14.0, color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(255, 160, 0, 1), width: 1.0)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(255, 160, 0, 1), width: 2.0)),
                  ),
                  controller: nameController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  style: const TextStyle(fontSize: 14.0, color: Colors.black),
                  decoration: const InputDecoration(
                    fillColor: const Color.fromARGB(255, 255, 246, 218),
                    hintText: 'Телефон',
                    hintStyle:
                        const TextStyle(fontSize: 14.0, color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(255, 160, 0, 1), width: 1.0)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(255, 160, 0, 1), width: 2.0)),
                  ),
                  controller: phoneController,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(5.0),
                child: TextField(
                  style: const TextStyle(fontSize: 14.0, color: Colors.black),
                  decoration: const InputDecoration(
                    fillColor: const Color.fromARGB(255, 255, 246, 218),
                    hintText: 'Почта',
                    hintStyle:
                        const TextStyle(fontSize: 14.0, color: Colors.grey),
                    enabledBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(255, 160, 0, 1), width: 1.0)),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(
                            color: Color.fromRGBO(255, 160, 0, 1), width: 2.0)),
                  ),
                  controller: mailController,
                ),
              ),
              const SizedBox(
                height: 20.0,
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber[200],
                      padding: const EdgeInsets.only(
                          bottom: 13.0, top: 13.0, right: 30.0, left: 30.0),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      )),
                  onPressed: () {
                    if (imageController.text.isNotEmpty &&
                        nameController.text.isNotEmpty &&
                        mailController.text.isNotEmpty &&
                        phoneController.text.isNotEmpty) {
                      Person newPerson = Person(
                          0,
                          imageController.text,
                          nameController.text,
                          mailController.text,
                          phoneController.text);
                      Navigator.pop(context, newPerson);
                    }
                  },
                  child: const Text('Сохранить',
                      style: TextStyle(fontSize: 16, color: Colors.black)))
            ],
          ),
        ));
  }
}
