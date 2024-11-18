import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class StarWarsCharacters extends StatelessWidget {
  // Our GraphQL query to fetch character data.
  final String query = """  
    query {  
      allPeople {  
        people {  
          name  
          gender  
        }  
      }  
    }  
  """;

  const StarWarsCharacters({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Star Wars Characters')),
      body: Query(
        options: QueryOptions(document: gql(query)),  // Pass the query here.
        builder: (result, {refetch, fetchMore}) {
          if (result.isLoading) return const Center(child: CircularProgressIndicator());
          if (result.hasException) return Text('Error: ${result.exception.toString()}');

          // Extract characters from the result.
          final characters = result.data!['allPeople']['people'];

          return ListView.builder(
            itemCount: characters.length,
            itemBuilder: (_, index) => ListTile(
              title: Text(characters[index]['name']),
              subtitle: Text('Gender: ${characters[index]['gender']}'),
            ),
          );
        },
      ),
    );
  }
}