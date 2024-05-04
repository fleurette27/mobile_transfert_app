import 'dart:convert';
import 'package:mobile_transfert_app/model/api_response.dart';
import 'package:mobile_transfert_app/model/transaction.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:mobile_transfert_app/constant.dart';

// Future<ApiResponse> feda () async {
//   ApiResponse apiResponse = ApiResponse();
//   try {
//     // String token = await getToken();

//     final response = await http.post(Uri.parse(fedaTransactionURL),
    
//         headers: {
//           'Accept': 'application/json',
//           // 'Authorization': 'Bearer $token'
//         }, body: {});

//     switch (response.statusCode) {
//       case 200:
//         apiResponse.data = FedaTransaction.fromJson(jsonDecode(response.body));
//         break;
//       case 422:
//         final errors = jsonDecode(response.body)['errors'];
//         apiResponse.error = errors[errors.keys.elementAt(0)][0];
//         break;
//       default:
//         apiResponse.error = somethingWentWrong;
//         break;
//     }
//   } catch (e) {
//     apiResponse.error = serverError;
//     print(e);
//   }
//     return apiResponse;

// }


Future<Map<String, dynamic>> createTransaction() async {

  try {
    final response = await http.post(
      Uri.parse(fedaTransactionURL),
      headers: {'Accept': 'application/json'},
    );

    if (response.statusCode == 200) {
      // Conversion de la réponse JSON en Map<String, dynamic>
      final Map<String, dynamic> responseData = json.decode(response.body);

      // Récupération du token et de l'URL depuis la réponse
      final Map<String, dynamic> tokenInfo = responseData['token'];
      final String token = tokenInfo['token'];
      final String url = tokenInfo['url'];

      // Retour du token et de l'URL sous forme de Map
      return {'token': token, 'url': url};
    } else {
      // Gérer les cas d'erreur
      throw Exception('Erreur lors de la création de la transaction : ${response.statusCode}');
    }
  } catch (e) {
    // Gérer les exceptions
    throw Exception('Erreur lors de la création de la transaction : $e');
  }
}