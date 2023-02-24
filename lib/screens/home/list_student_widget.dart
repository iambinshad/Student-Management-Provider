// import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:reg_database/db/functions/db_functions.dart';
import 'package:reg_database/screens/widgets/add_student_widgets.dart';
import 'package:reg_database/screens/widgets/display_fullDetails.dart';

class ListStudentWidget extends StatelessWidget {
  const ListStudentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Provider.of<DbProvider>(context, listen: false).foundUsers =
          Provider.of<DbProvider>(context, listen: false).studentListNotifier;
    });

    return SafeArea(
      child: Container(
        decoration: const BoxDecoration(
            gradient:
                LinearGradient(colors: [Colors.deepPurple, Colors.purple])),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            centerTitle: true,
            title: const Text('Students'),
          ),
          body: Consumer<DbProvider>(
            builder: (context, value, child) {
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                      onChanged: (value) =>
                          Provider.of<DbProvider>(context,listen: false).runFilter(value),
                      decoration: const InputDecoration(
                          enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.red, width: 3))),
                    ),
                  ),
                  Expanded(
                    child: ListView.separated(
                      itemBuilder: (ctx, index) {
                        final data = value.studentListNotifier[index];
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
                                Provider.of<DbProvider>(context, listen: false)
                                    .deleteStudent(index);
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
                      itemCount:
                          Provider.of<DbProvider>(context).foundUsers.length,
                    ),
                  )
                ],
              );
            },
          ),
          floatingActionButton: FloatingActionButton.extended(
            backgroundColor: Colors.red,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: ((context) {
                  return AddStudentWidget();
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
