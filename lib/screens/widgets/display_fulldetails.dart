import 'package:reg_database/screens/widgets/edit_screen.dart';
import 'package:flutter/material.dart';

class DisplayFullDetails extends StatelessWidget {
  final String name;
  final String age;
  final String address;
  final String phone;
  final int index;
  const DisplayFullDetails(
      {super.key,
      required this.name,
      required this.age,
      required this.address,
      required this.phone,
      required this.index});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('Student Details'),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: SafeArea(
              child: Center(
            child: ListView(
              children: [
                const SizedBox(
                  height: 30,
                ),
                const CircleAvatar(
                  radius: 80,
                  foregroundColor: Colors.black,
                  backgroundImage: AssetImage('assets/img3.webp'),
                ),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Name : $name',
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Age : $age',
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Address : $address',
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Phone : $phone',
                            style: const TextStyle(fontSize: 25),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                ElevatedButton.icon(
                    onPressed: () {
                      Navigator.push(context, MaterialPageRoute(builder: (ctx) {
                        return EditScreen(
                          index: index,
                          address: address,
                          age: age,
                          name: name,
                          phone: phone,
                        );
                      }));
                    },
                    icon: const Icon(Icons.edit),
                    label: const Text('Edit'))
              ],
            ),
          )),
        ));
  }
}
