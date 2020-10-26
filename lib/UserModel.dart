import 'dart:convert';
import 'package:http/http.dart' as http;

class UserModel{
  String id;
  String name;

  UserModel({this.id, this.name});

  factory UserModel.createUser(Map<String, dynamic> object){
    return UserModel(
      id: object['id'].toString(),
      name: object['first_name'] + " " + object['last_name']
    );
  }

  static Future<UserModel> callApiGet(String id) async{
    String url = "https://reqres.in/api/users/"+id;

    var response = await http.get(url);
    var jsonObject = json.decode(response.body);

    var data = (jsonObject as Map<String, dynamic>)['data'];

    return UserModel.createUser(data);
  }
}