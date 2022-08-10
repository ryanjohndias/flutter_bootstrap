import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../models/response/planet_response.dart';

part 'swapi_api.g.dart';

@RestApi()
abstract class SwapiApi {
  factory SwapiApi(Dio dio, {String baseUrl}) = _SwapiApi;

  @GET('/planets')
  Future<List<PlanetResponse>> getPlanets();
}
