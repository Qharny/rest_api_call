import 'dart:convert';
import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rest_api_call/color/color.dart';
import 'package:rest_api_call/screen/view.dart';
import 'package:http/http.dart' as http;

class Home extends StatefulWidget {
  const Home({Key? key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<dynamic> users = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: const Text(
          'Rest API Call',
          style: TextStyle(
            color: whiteColor,
            fontSize: 30,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final email = user['email'];
              return ListTile(
                title: Text(email),
                //   title: Text('Name: ${users[index]['name']['first']}'),
                //   subtitle: Text('Email: ${users[index]['email']}'),
                //   leading: CircleAvatar(
                //     backgroundImage:
                //         NetworkImage(users[index]['picture']['thumbnail']),
                //   ),
              );
            },
          )),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        onPressed: fetchUsers,
        child: const Icon(Icons.refresh, color: whiteColor),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  Future<void> fetchUsers() async {
    // creating variable to store url
    const url = "https://randomuser.me/api/?results=10"; //  get random users
    final link = Uri.parse(url);
    final response = await http.get(link);
    final body = response.body;
    // decodes the json api code
    final json = jsonDecode(body);
    setState(() {
      users = json('result');
    });
    print("Successful");
  }
}







// import 'package:flutter/material.dart';
// import 'package:rest_api_call/color/color.dart';
// import 'package:rest_api_call/screen/view.dart';

// class home extends StatelessWidget {
//   const home({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: whiteColor,
//       appBar: AppBar(
//         backgroundColor: primaryColor,
//         title: const Text(
//           'Rest API Call',
//           style: TextStyle(
//               color: whiteColor, fontSize: 30, fontWeight: FontWeight.w600),
//         ),
//         centerTitle: true,
//       ),
//       body: Column(
//         children: [
//           const viewList(),
//           FloatingActionButton(
            
//             backgroundColor: primaryColor,
//             child: const Icon(Icons.refresh, color: whiteColor),
//             onPressed: () {
//               print('Button Clicked');
//             },
//           ),
//           floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//         ],
//       ),
//     );
//   }
// }
