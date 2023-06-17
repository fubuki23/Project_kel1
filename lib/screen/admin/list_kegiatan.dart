import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/dialog/dialog_route.dart';
import 'package:project_kelas/config/asset.dart';
import 'package:project_kelas/event/event_db.dart';
import 'package:project_kelas/model/kegiatan.dart';
import 'package:project_kelas/screen/admin/add_update_kegiatan.dart';
import 'package:project_kelas/screen/admin/show_detail.dart';

import '../../model/kegiatan.dart';

class ListKegiatan extends StatefulWidget {
  const ListKegiatan({Key? key}) : super(key: key);

  @override
  State<ListKegiatan> createState() => _ListKegiatanState();
}

class _ListKegiatanState extends State<ListKegiatan> {
  List<Kegiatan> _listKegiatan = [];

  void getKegiatan() async {
    _listKegiatan = await EventDb.getKegiatan();

    setState(() {});
  }

  @override
  void initState() {
    getKegiatan();
    super.initState();
  }

  void showOption(Kegiatan? kegiatan) async {
    var result = await Get.dialog(
      SimpleDialog(
        children: [
          ListTile(
            onTap: () => Get.back(result: 'update'),
            title: const Text('Update'),
          ),
          ListTile(
            onTap: () => Get.back(result: 'delete'),
            title: const Text('Delete'),
          ),
          ListTile(
            onTap: () => Get.back(),
            title: const Text('Close'),
          )
        ],
      ),
      barrierDismissible: false,
    );
    switch (result) {
      case 'update':
        Get.to(AddUpdateKegiatan(kegiatan: kegiatan))
            ?.then((value) => getKegiatan());
        break;
      case 'delete':
        EventDb.deleteKegiatan(kegiatan!.id!).then((value) => getKegiatan());
        break;
    }
  }

  void showDetail(Kegiatan kegiatan) {
    showDetailDialog(context, kegiatan);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'List Kegiatan',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Color.fromARGB(255, 115, 18, 32),
      ),
      body: _listKegiatan.isNotEmpty
          ? SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  columnSpacing: 16.0,
                  columns: [
                    DataColumn(
                      label: Text(
                        'No.',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Judul',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Jam',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Tanggal',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text(
                        'Aksi',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                  rows: List<DataRow>.generate(
                    _listKegiatan.length,
                    (index) {
                      Kegiatan kegiatan = _listKegiatan[index];
                      return DataRow(
                        cells: [
                          DataCell(
                            Container(
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Color.fromARGB(255, 115, 18, 32),
                              ),
                              padding: EdgeInsets.all(8),
                              child: Text(
                                '${index + 1}',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              kegiatan.judul ?? '',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              kegiatan.jam ?? '',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          DataCell(
                            Text(
                              kegiatan.tanggal ?? '',
                              style: TextStyle(fontSize: 14),
                            ),
                          ),
                          DataCell(
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () => showDetail(kegiatan),
                                  icon: Icon(Icons.remove_red_eye),
                                ),
                                IconButton(
                                  onPressed: () => showOption(kegiatan),
                                  icon: Icon(Icons.more_vert),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ),
            )
          : Center(
              child: Text(
                "Data Kosong",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
      floatingActionButton: Positioned(
        bottom: 16,
        right: 16,
        child: FloatingActionButton(
          onPressed: () =>
              Get.to(AddUpdateKegiatan())?.then((value) => getKegiatan()),
          child: Icon(Icons.add),
          backgroundColor: Color.fromARGB(255, 115, 18, 32),
        ),
      ),
    );
  }
}
