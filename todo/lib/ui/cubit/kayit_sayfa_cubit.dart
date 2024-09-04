import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo/data/repo/notlardao_repository.dart';

class KayitSayfaCubit extends Cubit<void> {
  KayitSayfaCubit() : super(0);
  var nrepo = NotlarDaoRepository();
  Future<void> kaydet(String not) async {
    await nrepo.kaydet(not);
  }
}
