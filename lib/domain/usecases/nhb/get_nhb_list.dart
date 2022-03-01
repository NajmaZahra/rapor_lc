
import 'package:rapor_lc/domain/entities/nhb.dart';
import 'package:rapor_lc/domain/repositories/nhb_repo.dart';
import 'package:rapor_lc/domain/usecases/base_use_case.dart';

class GetNHBListUseCase extends BaseUseCase<List<NHB>, String, NHBRepository> {
  NHBRepository repository;

  GetNHBListUseCase(this.repository) : super(repository, (repo, param) => repo.getNHBList(param));
}