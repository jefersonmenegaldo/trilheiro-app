import 'package:trilheiro/src/models/place.model.dart';
import 'package:trilheiro/src/repositories/base.repository.dart';
import 'dart:convert' as convert;

class PlaceRepository extends BaseRepository {
  Future<Place?> get(int id) async {
    try {
      final response = await dio.get(makeURL('/place/$id'));

      if (response.statusCode == 200) {
        var jsonResponse =
            convert.jsonDecode(response.data) as Map<String, dynamic>;
        return Place.fromJson(jsonResponse);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  Future<List<Place>?> getAll() async {
    try {
      final response = await dio.get(makeURL('/place'));

      if (response.statusCode == 200) {
        final jsonResponse = response.data[0];
        List<Place> result = List<Place>.from(jsonResponse.map((entry) {
          return Place.fromJson(entry);
        }));

        return result;
      } else {
        throw Exception('Falha ao carregar dados do servidor');
      }
    } catch (e) {
      return null;
    }
  }

  Future<Place?> create(Place model) async {
    try {
      var userData = model.toJson();

      final response = await dio.post(makeURL('/place'), data: userData);

      if (response.statusCode == 200) {
        var jsonResponse = response.data[0];

        return Place.fromJson(jsonResponse);
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
