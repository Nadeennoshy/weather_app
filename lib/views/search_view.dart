

import 'dart:developer';

import 'package:flutter/material.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body:   Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: TextField(
            onSubmitted: ((value) {
              log(value);
            }),
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.symmetric(vertical: 30,horizontal: 15),
              label:  Text('Search'),
              suffixIcon: Icon(Icons.search),
              hintText: 'Enter City Name',
              border: OutlineInputBorder(

              )
            ),
          ),
        ),
      ),
    );
  }
}