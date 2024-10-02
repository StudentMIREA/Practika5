import 'package:flutter/material.dart';


class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber[200],
      appBar: AppBar(
        title: const Text('Профиль'),
        backgroundColor: Colors.white70,
      ),
      body: Column(
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
                    image: const DecorationImage(
                      image: NetworkImage(),
                      fit: BoxFit.cover,
                    )),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Container(
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 255, 246, 218),
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: const Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 35.0),
                      child: Text(
                        'Рябова Екатерина',
                        style: TextStyle(fontSize: 16.0),
                      ),
                    ),
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Expanded(
                            child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Телефон: ${}',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ))),
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Expanded(
                            child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            'Почта: ${}',
                            style: TextStyle(fontSize: 14.0),
                          ),
                        ))),
                    Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Expanded(
                          child: Align(
                              alignment: Alignment.centerRight,
                              child: Icon(Icons.edit)),
                        ))
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
