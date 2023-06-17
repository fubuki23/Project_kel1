import 'dart:convert';
import 'package:get/get.dart';
import 'package:project_kelas/config/api.dart';
import 'package:project_kelas/event/event_pref.dart';
import 'package:project_kelas/model/kegiatan.dart';
import 'package:project_kelas/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:project_kelas/screen/admin/add_update_kegiatan.dart';
import 'package:project_kelas/screen/login.dart';
import 'package:project_kelas/widget/info.dart';

import '../screen/admin/dashboard_admin.dart';

class EventDb {
  static Future<User?> login(String username, String pass) async {
    User? user;

    try {
      var response = await http.post(Uri.parse(Api.login), body: {
        'username': username,
        'pass': pass,
      });

      if (response.statusCode == 200) {
        var responseBody = jsonDecode(response.body);

        if (responseBody['success']) {
          user = User.fromJson(responseBody['user']);
          EventPref.saveUser(user);
          Info.snackbar('Login Berhasil');
          Future.delayed(Duration(milliseconds: 1700), () {
            Get.offAll(DashboardAdmin());
          });
        } else {
          Info.snackbar('Login Gagal');
        }
      } else {
        Info.snackbar('Request Login Gagal');
      }
    } catch (e) {
      print(e);
    }

    return user;
  }

  static Future<List<User>> getUser() async {
    List<User> listUser = [];

    try {
      var response = await http.get(Uri.parse(Api.getUsers));

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          var users = responBody['user'];

          users.forEach((user) {
            listUser.add(User.fromJson(user));
          });
        }
      }
    } catch (e) {
      print(e);
    }

    return listUser;
  }

  static Future<String> addUser(
      String name, String username, String pass, String role) async {
    String reason;

    try {
      var response = await http.post(Uri.parse(Api.addUser), body: {
        'name': name,
        'username': username,
        'pass': pass,
        'role': role
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          reason = 'Add User Berhasil';
        } else {
          reason = responBody['reason'];
        }
      } else {
        reason = "Request Gagal";
      }
    } catch (e) {
      print(e);
      reason = e.toString();
    }

    return reason;
  }

  static Future<void> UpdateUser(
    String id,
    String name,
    String username,
    String pass,
    String role,
  ) async {
    try {
      var response = await http.post(Uri.parse(Api.updateUser), body: {
        'id': id,
        'name': name,
        'username': username,
        'pass': pass,
        'role': role
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Update User');
        } else {
          Info.snackbar('Gagal Update User');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> deleteUser(String id) async {
    try {
      var response =
          await http.post(Uri.parse(Api.deleteUser), body: {'id': id});

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Delete User');
        } else {
          Info.snackbar('Gagal Delete User');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  //Kegiatan
  static Future<List<Kegiatan>> getKegiatan() async {
    List<Kegiatan> listKegiatan = [];

    try {
      var response = await http.get(Uri.parse(Api.getKegiatan));

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          var kegiatan = responBody['kegiatan'];

          kegiatan.forEach((kegiatan) {
            listKegiatan.add(Kegiatan.fromJson(kegiatan));
          });
        }
      }
    } catch (e) {
      print(e);
    }

    return listKegiatan;
  }

  static Future<String> AddKegiatan(
      String id,
      String judul,
      String jenis,
      String deskripsi,
      String tanggal,
      String jam,
      String tempat,
      String nama_pnt,
      String no_idn,
      String jenis_kelamin,
      String status) async {
    String reason;

    try {
      var response = await http.post(Uri.parse(Api.addKegiatan), body: {
        'id': id,
        'judul': judul,
        'jenis': jenis,
        'deskripsi': deskripsi,
        'tanggal': tanggal,
        'jam': jam,
        'tempat': tempat,
        'nama_pnt': nama_pnt,
        'no_idn': no_idn,
        'jenis_kelamin': jenis_kelamin,
        'status': status,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          reason = 'Add Kegiatan Berhasil';
        } else {
          reason = responBody['reason'];
        }
      } else {
        reason = "Request Gagal";
      }
    } catch (e) {
      print(e);
      reason = e.toString();
    }

    return reason;
  }

  static Future<void> UpdateKegiatan(
      String id,
      String judul,
      String jenis,
      String deskripsi,
      String tanggal,
      String jam,
      String tempat,
      String nama_pnt,
      String no_idn,
      String jenis_kelamin,
      String status) async {
    try {
      var response = await http.post(Uri.parse(Api.updateKegiatan), body: {
        'id': id,
        'judul': judul,
        'jenis': jenis,
        'deskripsi': deskripsi,
        'tanggal': tanggal,
        'jam': jam,
        'tempat': tempat,
        'nama_pnt': nama_pnt,
        'no_idn': no_idn,
        'jenis_kelamin': jenis_kelamin,
        'status': status,
      });

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Update Kegiatan');
        } else {
          Info.snackbar('Gagal Update Kegiatan');
        }
      }
    } catch (e) {
      print(e);
    }
  }

  static Future<void> deleteKegiatan(String id) async {
    try {
      var response =
          await http.post(Uri.parse(Api.deleteKegiatan), body: {'id': id});

      if (response.statusCode == 200) {
        var responBody = jsonDecode(response.body);
        if (responBody['success']) {
          Info.snackbar('Berhasil Delete Kegiatan');
        } else {
          Info.snackbar('Gagal Delete Kegiatan');
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
