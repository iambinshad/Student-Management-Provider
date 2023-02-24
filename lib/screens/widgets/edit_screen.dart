import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';

import '../../db/functions/db_functions.dart';
import '../../db/model/data_model.dart';

class EditScreen extends StatefulWidget {
  final String name;
  final String age;
  final String address;
  final String phone;
  final int index;
  const EditScreen(
      {super.key,
      required this.name,
      required this.age,
      required this.address,
      required this.phone,
      required this.index});
  @override
  State<EditScreen> createState() => _EditScreenState();
}

class _EditScreenState extends State<EditScreen> {
  TextEditingController _nameController = TextEditingController();

  TextEditingController _ageController = TextEditingController();

  TextEditingController _addressController = TextEditingController();

  TextEditingController _phoneController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  void initState() {
    _nameController = TextEditingController(text: widget.name);
    _ageController = TextEditingController(text: widget.age);
    _addressController = TextEditingController(text: widget.address);
    _phoneController = TextEditingController(text: widget.phone);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Edit details'),
      ),
      body: SafeArea(
        child: Center(
          child: Form(
            key: _formKey,
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: ListView(
                children: [
                  TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'name',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Name required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _ageController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Age',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Age is required';
                      } else if (value.length > 3) {
                        return 'Enter correct age';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _addressController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Address',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Address required';
                      } else {
                        return null;
                      }
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    controller: _phoneController,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'Phone',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Phone number required';
                      } else if (value.length != 10) {
                        return 'Enter correct phone number';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100, right: 100),
                    child: ElevatedButton.icon(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            StudentModel newDetails = StudentModel(
                              name: _nameController.text,
                              age: _ageController.text,
                              address: _addressController.text,
                              phone: _phoneController.text,
                            );
                            Provider.of<DbProvider>(context, listen: false)
                                .updateStudentModel(widget.index, newDetails);
                            Navigator.pop(context);
                            Navigator.pop(context);
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Details Updated')));
                          }
                        },
                        icon: const Icon(Icons.update),
                        label: const Text('Update')),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
