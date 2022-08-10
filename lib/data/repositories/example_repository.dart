import '../../domain/models/planet.dart';
import '../api/swapi_api.dart';
import '../mapper/planet_mapper.dart';
import '../models/response/planet_response.dart';

class ExampleRepository {
  ExampleRepository({required this.swapiApi});

  final SwapiApi swapiApi;

  Future<List<Planet>> getPlanets() async {
    final List<PlanetResponse> response = await swapiApi.getPlanets();
    return response
        .map((PlanetResponse e) => e.toDomain())
        .toList(growable: false);
  }
}
