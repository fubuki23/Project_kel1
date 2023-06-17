import 'package:flutter/material.dart';
import 'package:flutter_calendar_carousel/flutter_calendar_carousel.dart'
    show CalendarCarousel;
import 'package:intl/intl.dart';
import 'package:project_kelas/event/event_db.dart';
import 'package:project_kelas/model/kegiatan.dart';

class CalendarScreen extends StatefulWidget {
  @override
  _CalendarScreenState createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  DateTime _currentDate = DateTime.now();
  List<DateTime> _eventDates = [];
  List<Kegiatan> _listKegiatan = [];

  @override
  void initState() {
    super.initState();
    // Ambil data kegiatan dari database
    _getListKegiatan();
  }

  Future<void> _getListKegiatan() async {
    _listKegiatan = await EventDb.getKegiatan();

    setState(() {
      // Ambil tanggal dari setiap kegiatan dan tambahkan ke _eventDates
      _eventDates = _listKegiatan
          .map((kegiatan) => DateTime.parse(kegiatan.tanggal ?? ''))
          .toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Calendar',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 115, 18, 32),
      ),
      body: CalendarCarousel(
        onDayPressed: (DateTime date, List<dynamic> events) {
          // Cek apakah tanggal yang dipilih memiliki kegiatan
          if (_eventDates.contains(date)) {
            // Ambil kegiatan berdasarkan tanggal yang dipilih
            Kegiatan kegiatan = _listKegiatan.firstWhere(
                (k) => DateTime.parse(k.tanggal ?? '') == date,
                orElse: () => Kegiatan());

            // Tampilkan informasi kegiatan pada tanggal yang dipilih
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: Text(
                      'Kegiatan pada ${DateFormat('yyyy MMMM dd').format(date)}'),
                  content: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Judul: ${kegiatan.judul ?? ''}'),
                      Text('Deskripsi: ${kegiatan.deskripsi ?? ''}'),
                      // Tambahkan informasi lainnya sesuai kebutuhan
                    ],
                  ),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context),
                      child: Text('Tutup'),
                    ),
                  ],
                );
              },
            );
          }
        },
        weekendTextStyle: TextStyle(color: Colors.red),
        thisMonthDayBorderColor: Colors.grey,
        markedDateCustomTextStyle: TextStyle(
          color: Colors.blue,
        ),
      ),
    );
  }
}
