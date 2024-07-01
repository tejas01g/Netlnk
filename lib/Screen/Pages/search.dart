import 'package:flutter/material.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  final TextEditingController searchController = TextEditingController();

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(38, 38, 52, 1.0),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(38, 38, 52, 1.0),
        title: TextFormField(
          controller: searchController,
          decoration: const InputDecoration(labelText: 'Search For a User'),
          onFieldSubmitted: (String value) {
            print(value);
            print(searchController.text);
          },
        ),
      ),
    );
  }
}
