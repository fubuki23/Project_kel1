class Api {
  static const _host = "http://192.168.100.8/api_ta";

  static String _user = "$_host/user";
  static String _kegiatan = "$_host/kegiatan";

  static String login = "$_host/login.php";

  // user
  static String addUser = "$_user/add_user.php";
  static String deleteUser = "$_user/delete_user.php";
  static String getUsers = "$_user/get_users.php";
  static String updateUser = "$_user/update_user.php";

  // kegiatan
  static String addKegiatan = "$_kegiatan/add_kegiatan.php";
  static String deleteKegiatan = "$_kegiatan/delete_kegiatan.php";
  static String getKegiatan = "$_kegiatan/get_kegiatan.php";
  static String updateKegiatan = "$_kegiatan/update_kegiatan.php";

}
