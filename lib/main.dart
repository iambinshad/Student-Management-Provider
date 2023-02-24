import 'package:flutter/material.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:provider/provider.dart';
import 'package:reg_database/db/functions/db_functions.dart';
import 'package:reg_database/db/model/data_model.dart';
import 'package:reg_database/screens/home/list_student_widget.dart';
import 'package:reg_database/screens/widgets/search_screen.dart';

import 'Provider/provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();
  if (!Hive.isAdapterRegistered(StudentModelAdapter().typeId)) {
    Hive.registerAdapter(StudentModelAdapter());
  }

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ListenableProvider(
          create: (context) => DbProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Student Registration',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const ListStudentWidget(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
