import 'package:hive/hive.dart';
part 'data_model.g.dart';

@HiveType(typeId: 1)
class StudentModel extends HiveObject {
  @HiveField(0)
  int? id;

  @HiveField(1)
  final String name;
  @HiveField(2)
  final String age;
  @HiveField(3)
  final String address;
  @HiveField(4)
  final String phone;

  StudentModel(
      {required this.name,
      required this.age,
      required this.address,
      required this.phone,
      this.id});
}
