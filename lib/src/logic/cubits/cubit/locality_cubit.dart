import 'package:bloc/bloc.dart';
import 'package:coupure_info/src/logic/models/locality.dart';
import 'package:coupure_info/src/logic/repo/localities_repo.dart';
import 'package:equatable/equatable.dart';

part 'locality_state.dart';

class LocalityCubit extends Cubit<LocalityState> {
  final LocalitiesRepo _localitiesRepo;

  LocalityCubit(this._localitiesRepo) : super(LocalityInitial());

  List<String> regions = [];

  List<Locality> localities = [];

  Future<void> getRegions() async {
    emit(LocalityLoading());
    try {
      regions = await _localitiesRepo.getRegions();
      emit(LocalityRegionsLoaded(regions));
    } catch (e) {
      emit(LocalityError(e.toString()));
    }
  }

  Future<void> getLocalities({String? region, required String locality}) async {
    emit(LocalityLoading());
    try {
      localities = await _localitiesRepo.getLocalities(
        region: region,
        locality: locality,
      );
      emit(LocalityLoaded(localities));
    } catch (e) {
      emit(LocalityError(e.toString()));
    }
  }
}
