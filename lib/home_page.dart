import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String readRepositories = r"""
 query{
 artworkAttributionClasses
 {
  name
  }
}
""";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Graph QL Demo"),
      ),
      body: Query(
        options: QueryOptions(
          documentNode: gql(readRepositories),
        ),
        builder: (QueryResult result,
            {VoidCallback refetch, FetchMore fetchMore}) {
          if (result.hasException) {
            return Text(result.exception.toString());
          }

          if (result.loading) {
            return Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
              itemCount: result.data["artworkAttributionClasses"].length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(
                      result.data["artworkAttributionClasses"][index]["name"]),
                );
              });
        },
      ),
    );
  }
}
