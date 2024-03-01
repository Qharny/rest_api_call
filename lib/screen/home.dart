import 'package:flutter/material.dart';
import 'package:rest_api_call/color/color.dart';
import 'package:rest_api_call/screen/view.dart';
import 'package:http/http.dart' as http;

class Home extends StatelessWidget {
  const Home({Key? key});

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
      body: const Column(
        children: [
          Expanded(child: viewList()),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        child: const Icon(Icons.refresh, color: whiteColor),
        onPressed: fetchUsers,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
    );
  }

  void fetchUsers() {
    // creating variable to store url
    const url = "https://randomuser.me/api/?results=5000";
    final link = Uri.parse(url);
    http.get(link);
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
