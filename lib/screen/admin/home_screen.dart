import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_kelas/config/asset.dart';
import 'package:project_kelas/event/event_pref.dart';
import 'package:project_kelas/screen/admin/list_panitia.dart';
import 'package:project_kelas/screen/admin/list_kegiatan.dart';
import 'package:project_kelas/screen/admin/kalender.dart';
import 'package:project_kelas/screen/admin/list_user.dart';
import 'package:project_kelas/screen/login.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> _slideImages = [
    'https://teknokrat.ac.id/wp-content/uploads/2023/04/Sekar-Kinasih-040423-1.jpg',
    'https://teknokrat.ac.id/wp-content/uploads/2023/01/WhatsApp-Image-2023-01-04-at-18.00.09.jpeg',
    'https://teknokrat.ac.id/wp-content/uploads/2023/04/Tim-Tari-Teknokrat-120323.jpeg',
    'https://teknokrat.ac.id/wp-content/uploads/2023/04/ddaa.png',
  ];

  List<Map<String, dynamic>> _iconData = [
    {'nameLabel': 'User', 'iconLabel': Icons.people, 'index': 0},
    {'nameLabel': 'Kegiatan', 'iconLabel': Icons.event_available, 'index': 1},
    {'nameLabel': 'Panitia', 'iconLabel': Icons.group_add, 'index': 2},
    {'nameLabel': 'Kalender', 'iconLabel': Icons.calendar_month, 'index': 3},
    {'nameLabel': 'Logout', 'iconLabel': Icons.logout_outlined, 'index': 99},
  ];

  List<Map<String, dynamic>> _fragments = [
    {'title': 'Daftar User', 'view': ListUser()},
    {'title': 'Daftar Kegiatan', 'view': ListKegiatan()},
    {'title': 'Daftar Panitia', 'view': ListPanitia()},
    {'title': 'Daftar Penjadwalan', 'view': CalendarScreen()},
  ];

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            height: 200,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              image: DecorationImage(
                image: NetworkImage(
                  'https://teknokrat.ac.id/wp-content/uploads/2023/04/Web-header-UTI-23.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: _iconData.map((data) {
              return IconButton(
                nameLabel: data['nameLabel'],
                iconLabel: data['iconLabel'],
                index: data['index'],
                onTap: () {
                  _handleIconButtonTap(data['index']);
                },
              );
            }).toList(),
          ),
          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.only(left: 10, bottom: 10),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Hot News',
                style: TextStyle(
                  color: Asset.colorPrimaryDark,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),
          Container(
            height: 140,
            child: CarouselSlider(
              items: _slideImages.map((image) {
                return SlideItem(image: image);
              }).toList(),
              options: CarouselOptions(
                height: 140.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _handleIconButtonTap(int index) {
    if (index == 99) {
      EventPref.clear();
      Get.off(Login());
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => _fragments[index]['view']),
      );
    }
  }
}

class SlideItem extends StatelessWidget {
  final String image;

  SlideItem({required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Image.network(
          image,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class IconButton extends StatelessWidget {
  final String nameLabel;
  final IconData iconLabel;
  final int index;
  final VoidCallback onTap;

  IconButton({
    required this.nameLabel,
    required this.iconLabel,
    required this.index,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Container(
            height: 60,
            width: 60,
            decoration: BoxDecoration(
              color: Asset.colorPrimaryDark,
              borderRadius: BorderRadius.circular(30),
            ),
            child: Icon(
              iconLabel,
              color: Colors.white,
              size: 40,
            ),
          ),
          SizedBox(height: 5),
          Text(
            nameLabel,
            style: TextStyle(fontSize: 14),
          ),
        ],
      ),
    );
  }
}
