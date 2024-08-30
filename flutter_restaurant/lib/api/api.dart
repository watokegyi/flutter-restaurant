// import 'dart:convert';

// import 'package:flutter_restaurant/model/menuitems.dart';

// import 'package:http/http.dart' as http;


// class ApiService {
//   static const String baseUrl = 'http://localhost:8080/api/res';

  
//   static Future<bool> login(String email, String password) async {
//     final response = await http.post(
//       Uri.parse('$baseUrl/logIn'),
//       headers: {'Content-Type': 'application/json'},
//       body: jsonEncode({
//         'email': email,
//         'password': password,
//       }),
//     );

//     if (response.statusCode == 200) {
//       final data = jsonDecode(response.body);
//       return data['success'];
//     } else {
//       return false;
//     }
//   }


//   Future<List<MenuItem>> fetchMenuItems() async {
//     final response = await http.get(Uri.parse('$baseUrl/menuitems'));

//     if (response.statusCode == 200) {
//       final List<dynamic> data = json.decode(response.body);
//       return data.map((json) => MenuItem.fromJson(json)).toList();
//     } else {
//       throw Exception('Failed to load menu items');
//     }
//   }
// }



import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter_restaurant/model/menuitems.dart';

class ApiService {
  static const String baseUrl = 'http://localhost:8080/api/res';

  // Login method
  static Future<bool> login(String email, String password) async {
    try {
      final response = await http
          .post(
            Uri.parse('$baseUrl/logIn'),
            headers: {'Content-Type': 'application/json'},
            body: jsonEncode({
              'email': email,
              'password': password,
            }),
          )
          .timeout(const Duration(seconds: 10)); // Add a timeout of 10 seconds

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final data = jsonDecode(response.body);
        return data['success'];
      } else {
        // Handle unexpected status codes
        print('Login failed with status: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      // Handle network or parsing errors
      print('Error during login: $e');
      return false;
    }
  }

  // Fetch menu items method
  Future<List<MenuItem>> fetchMenuItems() async {
    try {
      final response = await http
          .get(Uri.parse('$baseUrl/menuitems'))
          .timeout(const Duration(seconds: 10)); // Add a timeout of 10 seconds

      if (response.statusCode >= 200 && response.statusCode < 300) {
        final List<dynamic> data = json.decode(response.body);
        return data.map((json) => MenuItem.fromJson(json)).toList();
      } else {
        // Handle unexpected status codes
        throw Exception(
            'Failed to load menu items. Status code: ${response.statusCode}');
      }
    } catch (e) {
      // Handle network or parsing errors
      print('Error fetching menu items: $e');
      throw Exception('Failed to load menu items');
    }
  }
}
