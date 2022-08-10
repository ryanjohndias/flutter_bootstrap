import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

import '../data/api/swapi_api.dart';
import 'app_constants.dart';

class Dependencies extends StatelessWidget {
  const Dependencies({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: <SingleChildWidget>[
        Provider<Dio>(create: (BuildContext context) {
          return Dio();
        }),
        Provider<SwapiApi>(create: (BuildContext context) {
          return SwapiApi(context.read(), baseUrl: AppConstants.baseUrl);
        }),
      ],
      child: child,
    );
  }
}
