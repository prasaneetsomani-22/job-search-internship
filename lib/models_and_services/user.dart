import 'package:http/http.dart' as http;
import 'dart:convert';

class User{
  final String id;
  final String email;
  final String password;
  final String mobileNo;

  User({this.id,this.email,this.password,this.mobileNo});

  factory User.fromJson(Map<String,dynamic> json){
    return User(
      id : json['id'],
      email: json['email'],
      password: json['password'],
      mobileNo: json['mobileno']
    );
  }

  Map<String,dynamic> tojson()=>
    {
      'id': id,
      'email': email,
      'password': password,
      'mobileno': mobileNo

    };

}

//Fetching User's List

Future<List<User>> fetchUser(String url) async{
  final response = await http.get(url);
  if (response.statusCode == 200){
    return decodeUsers(response.body);
  }
  else{
    throw Exception('Unable to Fetch data from the api');
  }
}

List<dynamic> decodeUsers(String responseBody){
  final parsed = json.decode(responseBody).cast<Map<String,dynamic>>();
  return parsed.map<User>((json)=>User.fromJson(json)).toList();
}

//Posting User's data

Future<User> postUser(String id,String email,String password,String mobileNo,String url) async{
  final http.Response response = await http.post(url,
  headers: <String,String>{
    'Content-Type': 'application/json; charset=UTF-8',
  },
  body: jsonEncode(<String,String>{
    'id': id,
    'email': email,
    'password': password,
    'mobileNo': mobileNo
  }));
  if(response.statusCode == 200){
    return User.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Failed to post User');
  }
}

Future<User> updateUser(Map<String,String> details,String url) async{
  final http.Response response = await http.put(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
  body: jsonEncode(details));

  if(response.statusCode == 200){
    return User.fromJson(json.decode(response.body));
  }
  else{
    throw Exception('Failed to update user');
  }
}

Future<User> deleteUser(String url)async{
  final http.Response response = await http.delete(url,
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },);
    if (response.statusCode == 200){
      return User.fromJson(json.decode(response.body));
    }
    else{
      throw Exception('Failed to delete user');
    }
}
