import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/data/repo/notlardao_repository.dart';

import '../../data/entity/notlar.dart';

class AnasayfaCubit extends Cubit<List<Notlar>> {
  AnasayfaCubit() : super(<Notlar>[]);

  var nrepo = NotlarDaoRepository();

  Future<void> notlariYukle() async {
    var liste = await nrepo.notlariYukle();
    emit(liste);
  }

  Future<void> notlariYukleArama(String aranan) async {
    var liste = await nrepo.notlariYukleArama(aranan);
    emit(liste);
  }

  Future<void> sil(int id) async {
    await nrepo.sil(id);
    notlariYukle();
  }
}
