import 'package:flutter/material.dart';
import 'package:project_kelas/model/kegiatan.dart';

import '../../model/user.dart';

void showDetailDialog(BuildContext context, Kegiatan kegiatan) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: SingleChildScrollView(
          child: DataTable(
            columnSpacing: 16.0,
            columns: [
              DataColumn(
                label: Text(
                  '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(
                    Text(
                      'Judul',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(kegiatan.judul ?? ''),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text(
                      'Jenis',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(kegiatan.jenis ?? ''),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(kegiatan.deskripsi ?? ''),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text(
                      'Tanggal',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(kegiatan.tanggal ?? ''),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text(
                      'Jam',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(kegiatan.jam ?? ''),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text(
                      'Tempat',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(kegiatan.tempat ?? ''),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text(
                      'Nama PNT',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(kegiatan.nama_pnt ?? ''),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text(
                      'No. IDN',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(kegiatan.no_idn ?? ''),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text(
                      'Jenis Kelamin',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(kegiatan.jenis_kelamin ?? ''),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text(
                      'Status',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(kegiatan.status ?? ''),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}

void showDetailUserDialog(BuildContext context, User user) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return Dialog(
        child: SingleChildScrollView(
          child: DataTable(
            columnSpacing: 16.0,
            columns: [
              DataColumn(
                label: Text(
                  '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              DataColumn(
                label: Text(
                  '',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
            rows: [
              DataRow(
                cells: [
                  DataCell(
                    Text(
                      'Username',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(user.userName ?? ''),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text(
                      'Nama',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(user.name ?? ''),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text(
                      'Status/Role',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(user.role ?? ''),
                  ),
                ],
              ),
              DataRow(
                cells: [
                  DataCell(
                    Text(
                      'Password',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  DataCell(
                    Text(user.pass ?? ''),
                  ),
                ],
              ),
            ],
          ),
        ),
      );
    },
  );
}
