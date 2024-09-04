import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/data/repo/notlardao_repository.dart';

class DetaySayfaCubit extends Cubit<void> {
  DetaySayfaCubit() : super(0);

  var nrepo = NotlarDaoRepository();

  Future<void> guncelle(int id, String not) async {
    await nrepo.guncelle(id, not);
  }
}
