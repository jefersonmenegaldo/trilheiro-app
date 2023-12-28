import 'package:flutter/foundation.dart';
import 'package:trilheiro/src/models/place.model.dart';
import 'package:trilheiro/src/repositories/place.repository.dart';
import '../exceptions/custom.exception.dart';

class PlaceService {
  final PlaceRepository _placeRepository;
  
  PlaceService(this._placeRepository);

  Future<Place?> getPlace(int id) async {
    try {
      final place = await _placeRepository.get(id);
      return place;
    } on CustomException catch (e) {
      if (kDebugMode) {
        print("Erro personalizado: $e");
      }
      rethrow;
    } catch (e) {
      if (kDebugMode) {
        print("Erro não tratado: $e");
      }
      throw CustomException(
          "Erro inesperado");
    }
  }

  Future<List<Place>?> getAllPlaces() async {
    try {
      final places = await _placeRepository.getAll();
      return places;
    } on CustomException catch (e) {
      if (kDebugMode) {
        print("Erro personalizado: $e");
      }
      rethrow;
    } catch (e) {
      if (kDebugMode) {
        print("Erro não tratado: $e");
      }
      throw CustomException(
          "Erro inesperado");
    }
  }

  
}
