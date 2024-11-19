import 'package:flutter/material.dart';
import 'package:graphql_demo_app/star_wars_characters.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() async {
  await initHiveForFlutter(); // Needed for caching data.
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final client = ValueNotifier(
      GraphQLClient(
        link: HttpLink(
            'https://swapi-graphql.netlify.app/.netlify/functions/index'),
        // API URL
        cache: GraphQLCache(store: HiveStore()),
      ),
    );

    return GraphQLProvider(
      client: client,
      child: MaterialApp(
        title: 'Star Wars GraphQL Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: const StarWarsCharacters(), // Our app screen.
      ),
    );
  }
}
