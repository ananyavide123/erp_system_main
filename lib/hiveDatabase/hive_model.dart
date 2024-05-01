import 'package:hive/hive.dart';
part "hive_model.g.dart";

@HiveType(typeId: 1)
class Details {
  Details({
    required this.name,
    required this.contact,
   
  });

  @HiveField(0)
  String name;

  @HiveField(1)
  int contact;

 

  factory Details.fromMap(Map<String, dynamic> data) {
    return Details(
      name: data['name'],
      contact: data['contact'],
      
    );
  }
}
