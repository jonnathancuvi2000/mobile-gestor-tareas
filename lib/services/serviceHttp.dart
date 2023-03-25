import 'package:http/http.dart' as http;
import 'dart:convert';
// I did not use this, I add it just for test  and it worked 

class TareasApi {

  Future<void> getTime() async {
    try {
      var response = await http
          .get(Uri.parse('http://192.168.0.110:8082/gettasks'));
      // Map data = jsonDecode(response.body);
      print(response.body);

    } catch (e) {
      print(" this is teh error: $e");
    }
  }

}
