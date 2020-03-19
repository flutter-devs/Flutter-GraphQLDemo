import 'package:flutter/material.dart';
import 'package:graphql_demo/home_page.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

void main() => runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp()));


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final HttpLink httpLink =
    HttpLink(uri:
    "https://metaphysics-production.artsy.net/"
    );
    final ValueNotifier<GraphQLClient> client = ValueNotifier<GraphQLClient>(
      GraphQLClient(
        link: httpLink ,
        cache: OptimisticCache(
          dataIdFromObject: typenameDataIdFromObject,
        ),
      ),
    );
    return GraphQLProvider(
      client: client,
child: HomePage(),
    );
  }
}
