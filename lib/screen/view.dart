import 'package:flutter/material.dart';
import 'package:rest_api_call/screen/home.dart';

class viewList extends StatelessWidget {
  const viewList({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(itemBuilder: (context, index) {
      return ListTile(
        title: Text('Name: ${users[index]['name']['first']}'),
        subtitle: Text('Email: ${users[index]['email']}'),
        leading: CircleAvatar(
          backgroundImage: NetworkImage(users[index]['picture']['thumbnail']),
        ),
      );
    });
  }
}