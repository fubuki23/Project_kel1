import 'package:flutter/material.dart';

class Navbar1 extends StatelessWidget {
  final List<Developer> developers = [
    Developer(
      name: 'Rudi Bagas Kara',
      npm: '21312013',
      photo: 'asset/images/Rudy.jpeg',
    ),
    Developer(
      name: 'Umar Wira Hadi K',
      npm: '18312221',
      photo: 'asset/images/Wira.png',
    ),
    Developer(
      name: 'Eko Nopendra',
      npm: '18312089',
      photo: 'asset/images/Eko.jpeg',
    ),
    Developer(
      name: 'Fahmi Wira Oktavier',
      npm: '21312016',
      photo: 'asset/images/Fahmi.jpeg',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            alignment: Alignment.center,
            padding: EdgeInsets.all(16),
            child: Text(
              'Tentang Developer',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color.fromARGB(255, 115, 18, 32),
              ),
            ),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              padding: EdgeInsets.all(16),
              children: developers.map((developer) {
                return Card(
                  child: Padding(
                    padding: EdgeInsets.all(16),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 55,
                          backgroundImage: AssetImage(developer.photo),
                          backgroundColor: Color.fromARGB(255, 115, 18, 32),
                        ),
                        SizedBox(height: 8),
                        Text(
                          developer.name,
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'NPM: ${developer.npm}',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class Developer {
  final String name;
  final String npm;
  final String photo;

  Developer({
    required this.name,
    required this.npm,
    required this.photo,
  });
}
