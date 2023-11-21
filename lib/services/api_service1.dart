// import 'dart:convert';
//
// import 'package:http/http.dart' as http;
//
// import '../model/response.dart';
//
// class ApiService {
//   static const url = "https://randr.tridentinfoway.com/api/gas_station_list";
//   static Future<ResponseData> getData() async {
//     // return ResponseData.fromJson(json.decode(respStr));
//
//     final response = await http.post(
//       Uri.parse(url),
//       headers: <String, String>{
//         'Content-Type': 'application/json; charset=UTF-8',
//       },
//       body: jsonEncode(<String, String>{
//         'user_id': "27",
//         'select_type': "Manager",
//       }),
//     );
//     // print("respones ${jsonDecode(response.body)}");
//     if (response.statusCode == 200) {
//       //  print("statuscode :${response.statusCode}");
//
//       return ResponseData.fromJson(json.decode(response.body));
//     } else {
//       throw Exception('Failed to load data from API');
//     }
//   }
// }
