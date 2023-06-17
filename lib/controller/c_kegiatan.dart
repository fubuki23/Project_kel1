import 'package:get/get.dart';
import 'package:project_kelas/model/kegiatan.dart';

class CKegiatan extends GetxController {
  Rx<Kegiatan> _kegiatan = Kegiatan().obs;

  Kegiatan get user => _kegiatan.value;

  void setKegiatan(Kegiatan dataKegiatan) => _kegiatan.value = dataKegiatan;
}
