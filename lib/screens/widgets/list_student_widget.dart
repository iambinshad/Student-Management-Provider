// import 'dart:html';

import 'package:flutter/material.dart';
import 'package:reg_database/db/functions/db_functions.dart';
import 'package:reg_database/db/model/data_model.dart';
import 'package:reg_database/screens/widgets/add_student_widgets.dart';
import 'package:reg_database/screens/widgets/display_fullDetails.dart';
import 'package:reg_database/screens/widgets/search_screen.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    getAllStudents();

    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.deepPurple, Colors.purple])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            actions: [
              IconButton(
                  onPressed: () {
                    showSearch(
                      context: context,
                      delegate: SearchScreen(),
                    );
                  },
                  icon: const Icon(Icons.search))
            ],
            title: const Text('Students'),
          ),
          body: ValueListenableBuilder(
            valueListenable: studentListNotifier,
            builder: (BuildContext ctx, List<StudentModel> studentList,
                Widget? child) {
              return ListView.separated(
                itemBuilder: (ctx, index) {
                  final data = studentList[index];
                  return ListTile(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: ((ctx) {
                        return DisplayFullDetails(
                          address: data.address,
                          name: data.name,
                          phone: data.phone,
                          index: index,
                          age: data.age,
                        );
                      })));
                    },
                    title: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(data.name),
                    ),
                    subtitle: Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(data.age),
                    ),
                    leading: const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage('assets/img3.webp'),
                    ),
                    
                    trailing: IconButton(
                        onPressed: () {
                          deleteStudent(index);
                        },
                        icon: const Icon(
                          Icons.delete,
                          color: Colors.red,
                        )),
                  );
                },
                separatorBuilder: (context, index) {
                  return const Divider();
                },
                itemCount: studentList.length,
              );
            },
          ),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.red,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) {
                  return const AddStudentWidget();
                })),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text('Add Student'),
          ),
        ),
      ),
    );
  }
}
