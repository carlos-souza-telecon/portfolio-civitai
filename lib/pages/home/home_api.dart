import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:portfolio/pages/home/models/civitai_images.dart';

class HomeApi {
  static Future<CivitaiImages?> fetchImagesByUsername(String username) async {
    try {
      Map<String, String> headers = {
        'Content-Type': 'application/json',
      };
      String urlBase = 'civitai.com';
      String urlComplementar = '/api/v1/images';
      Map<String, String> queryParams = {
        'username': username,
        'sort': 'Newest',
        'limit': '100',
      };

      Uri uri = Uri.https(urlBase, urlComplementar, queryParams);
      var response = await http.get(
        uri,
        headers: headers,
        // body: convert.jsonEncode({
        //   'idUsuario': idUsuario,
        //   'idGrupoEmpresarial': idGrupoEmpresarial,
        // }),
      );

      if (response.statusCode != 200) {
        return null;
      }

      Map<String, dynamic> mapResponse = convert.json.decode(response.body);
      return CivitaiImages.fromJson(mapResponse);
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
