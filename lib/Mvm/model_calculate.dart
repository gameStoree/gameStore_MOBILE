// import 'package:project/Model_topUp/Joki_rank.dart';

class ModelCalculate {
  static String calculateTotalPrice(String jumlahItem, String hargaJoki) {
    if (jumlahItem.isEmpty || hargaJoki.isEmpty) {
      return '';
    }

    int jumlah = int.tryParse(jumlahItem) ?? 0;
    int harga = int.tryParse(hargaJoki) ?? 0;
    
    int total = jumlah * harga;
    return total.toString();
  }
}
