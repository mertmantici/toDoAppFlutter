import 'package:todo/data/entity/notlar.dart';
import 'package:todo/data/sqlite/veritaban_yardimcisi.dart';

class NotlarDaoRepository {
  Future<List<Notlar>> notlariYukle() async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM todo");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Notlar(id: satir["id"], name: satir["name"]);
    });
  }

  Future<List<Notlar>> notlariYukleArama(String aranan) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps =
        await db.rawQuery("SELECT * FROM todo WHERE name like '%$aranan%'");
    return List.generate(maps.length, (index) {
      var satir = maps[index];
      return Notlar(id: satir["id"], name: satir["name"]);
    });
  }

  Future<void> kaydet(String not) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var yeniNot = Map<String, dynamic>();
    yeniNot["name"] = not;
    await db.insert("todo", yeniNot);
  }

  Future<void> guncelle(int id, String not) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var guncellenenNot = Map<String, dynamic>();
    guncellenenNot["name"] = not;
    await db.update("todo", guncellenenNot, where: "id=?", whereArgs: [id]);
  }

  Future<void> sil(int id) async {
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("todo", where: "id=?", whereArgs: [id]);
  }
}
