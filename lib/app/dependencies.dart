import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../data/api/swapi_api.dart';
import '../data/persistence/secure_storage.dart';
import '../data/persistence/secure_storage_impl.dart';
import '../data/repositories/example_repository.dart';
import 'app_constants.dart';

class Dependencies extends StatelessWidget {
  const Dependencies({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        Provider<Dio>(
          create: (BuildContext context) => Dio(),
        ),
        Provider<SwapiApi>(
          create: (BuildContext context) => SwapiApi(
            context.read(),
            baseUrl: AppConstants.baseUrl,
          ),
        ),
        Provider<SecureStorage>(
          create: (BuildContext context) => SecureStorageImpl(),
        ),
        Provider<ExampleRepository>(
          create: (BuildContext context) => ExampleRepository(
            swapiApi: context.read(),
          ),
        ),
      ],
      child: child,
    );
  }
}
