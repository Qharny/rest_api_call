// ignore_for_file: use_key_in_widget_constructors, avoid_print

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:rest_api_call/color/color.dart';

import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> users = [];

  set isLoading(bool isLoading) {}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Random Emails',
          style: TextStyle(
            color: whiteColor,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        itemCount: users.length,
        itemBuilder: (context, index) {
          // final user = users[index];
          // final email = user['email'];
          // final name = user['name'];
          return ListTile(
            // title: Text(email),
            title: Text('Name: ${users[index]['name']['first']}', style: const TextStyle(fontWeight: FontWeight.w500),),
            subtitle: Text('Email: ${users[index]['email']}'),
            leading: CircleAvatar(
              backgroundImage:
                  NetworkImage(users[index]['picture']['thumbnail']),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: fetchUsers,
        child: const Icon(Icons.refresh, color: whiteColor),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void fetchUsers() async {
    print("Users called");
    setState(() => isLoading = true);
    try {
      // creating variable to store url
      const url = "https://randomuser.me/api/?results=100"; //  get random users
      final link = Uri.parse(url);
      final response = await http.get(link);
      final body = response.body;
      // decodes the json api code
      final json = jsonDecode(body);
      setState(() {
        users = json['results'];
      });
    } catch (e) {
      print(e);
    } finally {
      setState(() => isLoading = false);
    }
    print("Users called successful");
  }
}


// Get ip address
// https://ipinfo.io/161.185.160.93/geo
