// import 'package:flutter/material.dart';
// import 'package:reg_database/db/functions/db_functions.dart';
// import 'package:reg_database/db/model/data_model.dart';
// import 'package:reg_database/screens/widgets/display_fulldetails.dart';
// import 'package:reg_database/screens/home/list_student_widget.dart';

// class SearchScreen extends SearchDelegate {
//   @override
//   List<Widget>? buildActions(BuildContext context) {
//     return [
//       IconButton(
//         onPressed: (() {
//           query = '';
//         }),
//         icon: const Icon(Icons.clear),
//       )
//     ];
//   }

//   @override
//   Widget? buildLeading(BuildContext context) {
//     return IconButton(
//       icon: const Icon(Icons.arrow_back),
//       onPressed: () {
//         close(context, null);
//       },
//     );
//   }

//   @override
//   Widget buildResults(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: studentListNotifier,
//       builder: ((BuildContext context, List<StudentModel> studentList,
//           Widget? child) {
//         return ListView.builder(
//           itemBuilder: (ctx, index) {
//             final data = studentList[index];
//             if (data.name.toLowerCase().contains(
//                   query.toLowerCase(),
//                 )) {
//               return Column(
//                 children: [
//                   ListTile(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: ((context) {
//                             return const ListStudentWidget();
//                           }),
//                         ),
//                       );
//                     },
//                     title: Text(data.name),
//                     leading: const CircleAvatar(),
//                   ),
//                   const Divider()
//                 ],
//               );
//             } else {
//               return Container();
//             }
//           },
//           itemCount: studentList.length,
//         );
//       }),
//     );
//   }

//   @override
//   Widget buildSuggestions(BuildContext context) {
//     return ValueListenableBuilder(
//       valueListenable: studentListNotifier,
//       builder: ((BuildContext context, List<StudentModel> studentList,
//           Widget? child) {
//         return ListView.builder(
//           itemBuilder: (ctx, index) {
//             final data = studentList[index];
//             if (data.name.toLowerCase().contains(
//                   query.toLowerCase(),
//                 )) {
//               return Column(
//                 children: [
//                   ListTile(
//                     onTap: () {
//                       Navigator.push(
//                         context,
//                         MaterialPageRoute(
//                           builder: ((context) {
//                             return DisplayFullDetails(
//                                 name: data.name,
//                                 age: data.age,
//                                 address: data.address,
//                                 phone: data.phone,
//                                 index: index);
//                           }),
//                         ),
//                       );
//                     },
//                     title: Text(data.name),
//                     leading: const CircleAvatar(
//                       backgroundImage: AssetImage('assets/img3.webp'),
//                     ),
//                   ),
//                   const Divider()
//                 ],
//               );
//             } else {
//               return Container();
//             }
//           },
//           itemCount: studentList.length,
//         );
//       }),
//     );
//   }
// }

import 'package:flutter/Material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
