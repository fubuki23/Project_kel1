import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:get/get.dart';
import 'package:project_kelas/config/asset.dart';
import 'package:project_kelas/event/event_db.dart';
import 'package:project_kelas/screen/admin/list_kegiatan.dart';
import 'package:project_kelas/widget/info.dart';

import '../../model/kegiatan.dart';

class AddUpdateKegiatan extends StatefulWidget {
  final Kegiatan? kegiatan;
  AddUpdateKegiatan({this.kegiatan});

  @override
  State<AddUpdateKegiatan> createState() => _AddUpdateKegiatanState();
}

class _AddUpdateKegiatanState extends State<AddUpdateKegiatan> {
  var _formKey = GlobalKey<FormState>();
  var _controllerId = TextEditingController();
  var _controllerJudul = TextEditingController();
  var _controllerDeskripsi = TextEditingController();
  var _controllerTanggal = TextEditingController();
  var _controllerJam = TextEditingController();
  var _controllerTempat = TextEditingController();
  var _controllerNama_pnt = TextEditingController();
  var _controllerNo_idn = TextEditingController();
  var _controllerStatus = TextEditingController();

  List<String> jenis_kg = [
    "Akademik",
    "Non Akademik",
  ];
  String _jenis_kg = "Akademik";

  //jk
  List<String> jenis_jk = [
    "Laki-Laki",
    "Perempuan",
  ];
  String _jenis_jk = "Laki-Laki";

  bool _isHidden = true;
  @override
  void initState() {
    // TODO: implement initState
    if (widget.kegiatan != null) {
      _controllerId.text = widget.kegiatan!.id!;
      _controllerJudul.text = widget.kegiatan!.judul!;
      _jenis_kg = widget.kegiatan!.jenis!;
      _controllerDeskripsi.text = widget.kegiatan!.deskripsi!;
      _controllerTanggal.text = widget.kegiatan!.tanggal!;
      _controllerJam.text = widget.kegiatan!.jam!;
      _controllerTempat.text = widget.kegiatan!.tempat!;
      _controllerNama_pnt.text = widget.kegiatan!.nama_pnt!;
      _controllerNo_idn.text = widget.kegiatan!.no_idn!;
      _jenis_jk = widget.kegiatan!.jenis_kelamin!;
      _controllerStatus.text = widget.kegiatan!.status!;
    }
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        // titleSpacing: 0,
        title: widget.kegiatan != null
            ? Text('Update Kegiatan')
            : Text('Tambah Kegiatan'),
        backgroundColor: Asset.colorPrimary,
      ),
      body: Stack(
        children: [
          Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.all(16),
              children: [
                TextFormField(
                  enabled: widget.kegiatan == null ? true : false,
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerId,
                  decoration: InputDecoration(
                      labelText: "Id Kegiatan",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerJudul,
                  decoration: InputDecoration(
                      labelText: "Judul",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  value: _jenis_kg,
                  decoration: InputDecoration(
                      labelText: "Jenis Kegiatan",
                      hintText: "Jenis Kegiatan",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  items: jenis_kg.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _jenis_kg = newValue!;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerDeskripsi,
                  decoration: InputDecoration(
                      labelText: "Deskripsi",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerTanggal,
                  decoration: InputDecoration(
                      labelText: "Tanggal",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerJam,
                  decoration: InputDecoration(
                      labelText: "Jam",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerTempat,
                  decoration: InputDecoration(
                      labelText: "Tempat",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerNama_pnt,
                  decoration: InputDecoration(
                      labelText: "Nama Panitia",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerNo_idn,
                  decoration: InputDecoration(
                      labelText: "No Identitas",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                SizedBox(
                  height: 10,
                ),
                DropdownButtonFormField<String>(
                  value: _jenis_jk,
                  decoration: InputDecoration(
                      labelText: "Jenis Kelamin",
                      hintText: "Jenis Kelamin",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                  items: jenis_jk.map((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                  onChanged: (String? newValue) {
                    setState(() {
                      _jenis_jk = newValue!;
                    });
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                TextFormField(
                  validator: (value) => value == '' ? 'Jangan Kosong' : null,
                  controller: _controllerStatus,
                  decoration: InputDecoration(
                      labelText: "Status",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
                ElevatedButton(
                  onPressed: () async {
                    if (_formKey.currentState!.validate()) {
                      if (widget.kegiatan == null) {
                        String message = await EventDb.AddKegiatan(
                          _controllerId.text,
                          _controllerJudul.text,
                          _jenis_kg,
                          _controllerDeskripsi.text,
                          _controllerTanggal.text,
                          _controllerJam.text,
                          _controllerTempat.text,
                          _controllerNama_pnt.text,
                          _controllerNo_idn.text,
                          _jenis_jk,
                          _controllerStatus.text,
                        );
                        Info.snackbar(message);
                        if (message.contains('Berhasil')) {
                          _controllerId.clear();
                          _controllerJudul.clear();
                          _controllerDeskripsi.clear();
                          _controllerTanggal.clear();
                          _controllerJam.clear();
                          _controllerNama_pnt.clear();
                          _controllerNo_idn.clear();
                          _controllerStatus.clear();
                          Get.off(
                            ListKegiatan(),
                          );
                        }
                      } else {
                        EventDb.UpdateKegiatan(
                          _controllerId.text,
                          _controllerJudul.text,
                          _jenis_kg,
                          _controllerDeskripsi.text,
                          _controllerTanggal.text,
                          _controllerJam.text,
                          _controllerTempat.text,
                          _controllerNama_pnt.text,
                          _controllerNo_idn.text,
                          _jenis_jk,
                          _controllerStatus.text,
                        );
                      }
                    }
                  },
                  child: Text(
                    widget.kegiatan == null ? 'Simpan' : 'Ubah',
                    style: TextStyle(fontSize: 16),
                  ),
                  style: ElevatedButton.styleFrom(
                      primary: Asset.colorAccent,
                      fixedSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5))),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
